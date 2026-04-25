#!/usr/bin/env python3
"""
向飞书 + Bark 推送 AI Daily 通知。

环境变量:
  FEISHU_WEBHOOK    飞书自定义机器人 webhook URL (可选)
  FEISHU_SECRET     飞书签名校验 secret (可选)
  BARK_URL          Bark App URL, 形如 https://api.day.app/YOUR_KEY (可选)

用法:
  python3 send_notification.py <general.md> <llmops.md>
"""
import base64
import hashlib
import hmac
import json
import os
import re
import sys
import time
import urllib.parse
import urllib.request
from datetime import datetime, timedelta, timezone
from pathlib import Path

BJ = timezone(timedelta(hours=8))
WEEKDAYS = ["周一", "周二", "周三", "周四", "周五", "周六", "周日"]
REPO = "kinggao23-droid/AI-Daily"


# ============================================================
# 工具
# ============================================================
def http_post(url: str, data: dict, timeout: int = 30) -> tuple[int, str]:
    body = json.dumps(data, ensure_ascii=False).encode("utf-8")
    req = urllib.request.Request(
        url, data=body,
        headers={"Content-Type": "application/json; charset=utf-8"},
        method="POST",
    )
    try:
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            return resp.status, resp.read().decode("utf-8", errors="ignore")
    except urllib.error.HTTPError as e:
        return e.code, e.read().decode("utf-8", errors="ignore")
    except Exception as e:
        return -1, str(e)


def http_get(url: str, timeout: int = 30) -> tuple[int, str]:
    try:
        with urllib.request.urlopen(url, timeout=timeout) as resp:
            return resp.status, resp.read().decode("utf-8", errors="ignore")
    except urllib.error.HTTPError as e:
        return e.code, e.read().decode("utf-8", errors="ignore")
    except Exception as e:
        return -1, str(e)


def extract_summary(md_text: str, max_chars: int = 350) -> str:
    """从 markdown 里提取一段精华摘要 (跳过标题/分隔, 取前几条要闻的标题)"""
    lines = md_text.split("\n")
    bullets = []
    for line in lines:
        s = line.strip()
        # 抓 "### 1. 标题" 这种
        m = re.match(r"^###\s+(?:🔥\s*)?(?:\d+\.|要闻[一二三四五六])\s+(.+)$", s)
        if m:
            title = re.sub(r"\*\*([^*]+)\*\*", r"\1", m.group(1))
            bullets.append(f"• {title}")
            if len(bullets) >= 5:
                break
    if not bullets:
        # fallback: 取第一段非空文本
        for line in lines:
            s = line.strip()
            if s and not s.startswith(("#", "-", "|", "*", "```", ">")):
                return s[:max_chars]
        return "(无法提取摘要)"
    text = "\n".join(bullets)
    return text[:max_chars]


# ============================================================
# 飞书
# ============================================================
def feishu_sign(secret: str, timestamp: int) -> str:
    """飞书签名: HMAC-SHA256(secret, timestamp + '\n' + secret) -> base64"""
    string_to_sign = f"{timestamp}\n{secret}"
    h = hmac.new(secret.encode("utf-8"), string_to_sign.encode("utf-8"),
                 digestmod=hashlib.sha256).digest()
    return base64.b64encode(h).decode("utf-8")


def send_feishu(webhook: str, secret: str | None,
                title: str, general_summary: str, llmops_summary: str,
                general_url: str, llmops_url: str) -> None:
    """发送飞书富文本卡片消息"""
    payload = {
        "msg_type": "interactive",
        "card": {
            "config": {"wide_screen_mode": True, "enable_forward": True},
            "header": {
                "title": {"tag": "plain_text", "content": title},
                "template": "blue",
            },
            "elements": [
                {
                    "tag": "div",
                    "text": {
                        "tag": "lark_md",
                        "content": "**📰 综合版日报**\n" + general_summary,
                    },
                },
                {
                    "tag": "action",
                    "actions": [{
                        "tag": "button",
                        "text": {"tag": "plain_text", "content": "查看综合版 →"},
                        "url": general_url,
                        "type": "primary",
                    }],
                },
                {"tag": "hr"},
                {
                    "tag": "div",
                    "text": {
                        "tag": "lark_md",
                        "content": "**🎯 LLMOps 竞品情报版**\n" + llmops_summary,
                    },
                },
                {
                    "tag": "action",
                    "actions": [{
                        "tag": "button",
                        "text": {"tag": "plain_text", "content": "查看 LLMOps 专题 →"},
                        "url": llmops_url,
                        "type": "primary",
                    }],
                },
                {"tag": "hr"},
                {
                    "tag": "note",
                    "elements": [{
                        "tag": "plain_text",
                        "content": f"自动生成 · 数据源: {REPO} · 北京时间 18:00",
                    }],
                },
            ],
        },
    }

    if secret:
        ts = int(time.time())
        payload["timestamp"] = str(ts)
        payload["sign"] = feishu_sign(secret, ts)

    code, body = http_post(webhook, payload)
    if code == 200:
        try:
            j = json.loads(body)
            if j.get("StatusCode") == 0 or j.get("code") == 0:
                print("✅ 飞书已发送")
                return
        except Exception:
            pass
    print(f"❌ 飞书发送失败: HTTP {code}, body={body[:200]}")


# ============================================================
# Bark
# ============================================================
def send_bark(bark_url: str, title: str, body: str,
              click_url: str) -> None:
    """
    Bark 推送 (POST JSON 模式, 比 GET URL 模式更可靠)
    bark_url 形如 https://api.day.app/YOUR_KEY
    """
    base = bark_url.rstrip("/")
    payload = {
        "title": title,
        "body": body,
        "url": click_url,
        "group": "AI Daily",
        "level": "active",
        "sound": "minuet",
        "icon": "https://avatars.githubusercontent.com/u/121283862",
    }
    code, body_resp = http_post(f"{base}/push", payload)
    if code == 200:
        try:
            j = json.loads(body_resp)
            if j.get("code") == 200:
                print("✅ Bark 已发送")
                return
        except Exception:
            pass
    # 尝试老接口 GET 模式作为 fallback
    print(f"⚠️  Bark POST 失败 (HTTP {code}, body={body_resp[:200]}), 尝试 GET fallback...")
    safe_title = urllib.parse.quote(title)
    safe_body = urllib.parse.quote(body)
    fallback_url = f"{base}/{safe_title}/{safe_body}?url={urllib.parse.quote(click_url)}&group=AI%20Daily"
    code2, body2 = http_get(fallback_url)
    if code2 == 200:
        print("✅ Bark 已发送 (GET fallback)")
    else:
        print(f"❌ Bark 完全失败: HTTP {code2}, body={body2[:200]}")


# ============================================================
# 主流程
# ============================================================
def main():
    if len(sys.argv) < 3:
        print("用法: send_notification.py <general.md> <llmops.md>", file=sys.stderr)
        sys.exit(1)

    general_path = Path(sys.argv[1])
    llmops_path = Path(sys.argv[2])

    if not general_path.exists():
        print(f"❌ 综合版文件不存在: {general_path}", file=sys.stderr)
        sys.exit(2)
    if not llmops_path.exists():
        print(f"❌ LLMOps 文件不存在: {llmops_path}", file=sys.stderr)
        sys.exit(3)

    now = datetime.now(BJ)
    date_iso = now.strftime("%Y-%m-%d")
    date_cn = now.strftime("%Y年%m月%d日")
    weekday = WEEKDAYS[now.weekday()]
    title = f"📰 AI Daily · {date_cn} ({weekday})"

    general_md = general_path.read_text(encoding="utf-8")
    llmops_md = llmops_path.read_text(encoding="utf-8")
    general_summary = extract_summary(general_md)
    llmops_summary = extract_summary(llmops_md)

    general_url = f"https://github.com/{REPO}/blob/main/{date_iso}.md"
    llmops_url = f"https://github.com/{REPO}/blob/main/llmops/{date_iso}.md"

    # 飞书
    feishu_webhook = os.environ.get("FEISHU_WEBHOOK", "").strip()
    feishu_secret = os.environ.get("FEISHU_SECRET", "").strip() or None
    if feishu_webhook:
        try:
            send_feishu(feishu_webhook, feishu_secret, title,
                       general_summary, llmops_summary,
                       general_url, llmops_url)
        except Exception as e:
            print(f"❌ 飞书异常: {e}")
    else:
        print("⚠️  FEISHU_WEBHOOK 未设置, 跳过飞书")

    # Bark
    bark_url = os.environ.get("BARK_URL", "").strip()
    if bark_url:
        try:
            bark_body = f"综合版要闻:\n{general_summary[:200]}\n\nLLMOps:\n{llmops_summary[:150]}"
            send_bark(bark_url, title, bark_body, general_url)
        except Exception as e:
            print(f"❌ Bark 异常: {e}")
    else:
        print("⚠️  BARK_URL 未设置, 跳过 Bark")


if __name__ == "__main__":
    main()
