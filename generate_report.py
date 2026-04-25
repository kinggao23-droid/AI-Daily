#!/usr/bin/env python3
"""
AI Daily Report Generator

每天定时调用 Anthropic Claude API (含 Web Search 工具) 生成两份日报：
  1. 综合版: <YYYY-MM-DD>.md
  2. LLMOps 竞品情报版: llmops/<YYYY-MM-DD>.md

然后通过 SMTP 发送邮件 (Gmail) 到指定邮箱。

环境变量:
  ANTHROPIC_API_KEY  - Anthropic API Key (必需)
  EMAIL_USERNAME     - Gmail 用户名 (必需)
  EMAIL_PASSWORD     - Gmail 应用专用密码 (必需, 16位)
  EMAIL_TO           - 收件邮箱 (默认与 EMAIL_USERNAME 相同)
  CLAUDE_MODEL       - 模型 ID (默认: claude-opus-4-7)

用法:
  python3 generate_report.py                # 生成两份日报 + 发送邮件
  python3 generate_report.py --no-email     # 只生成不发送
  python3 generate_report.py --skip-llmops  # 跳过 LLMOps 专题
"""
import argparse
import json
import os
import smtplib
import sys
import urllib.request
import urllib.error
from datetime import datetime, timezone, timedelta
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from pathlib import Path

# ============================================================
# 配置
# ============================================================
ANTHROPIC_API_URL = "https://api.anthropic.com/v1/messages"
DEFAULT_MODEL = "claude-opus-4-7"
ANTHROPIC_VERSION = "2023-06-01"
MAX_TOKENS = 16000
WEB_SEARCH_MAX_USES = 8  # 单次报告最多触发 Web Search 次数

# 北京时区
BEIJING_TZ = timezone(timedelta(hours=8))

# ============================================================
# 提示词模板
# ============================================================
GENERAL_DAILY_PROMPT = """你是一位资深 AI 行业分析师,正在为一位 LLMOps 平台产品经理 + 解决方案架构师撰写每日 AI 技术日报。

**用户背景**:
- 任职于星环科技 (Transwarp), 负责 LLMOps 平台 + 金融客户(证券) 解决方案
- 关注模型动态、Agent / RAG 进展、企业落地
- 不只要"是什么", 还要"背后的设计理念 + 对我的产品启示"
- 中文输出, 假设熟悉主流 LLM 概念

**今日日期**: {date_zh} ({weekday})

**任务**:
请使用 Web Search 工具检索 2026 年 4 月最新的 AI 行业动态, 然后撰写一份 综合版 AI 日报, 严格按以下结构输出 (纯 Markdown, 无前言无总结):

```
# AI 技术日报 - {date_cn}

---

## 一、今日要闻

### 1. <要闻标题>
<3-5 句概述 + 链接>
**核心技术原理:<技术名词>**
<用平实语言解释技术原理, 适合 PM 理解>
**对产品的启示**:
<2-3 条对产品决策的建议>

### 2. <要闻标题>
...

(共 4-5 条要闻)

---

## 二、热门开源项目
- **项目名**: 简短描述
(3-5 项)

---

## 三、产品动态
| 厂商 | 动作 | 时间 |
(8-10 行)

---

## 四、趋势洞察与行动建议
### 趋势一: <趋势>
<分析 + 对 PM 的具体建议>
(共 3-4 个趋势)

---

*本日报基于公开信息整理, 数据截至 {date_cn}。*
```

**重要要求**:
1. 必须使用 Web Search 工具检索真实的最新动态, 不要编造
2. 每条要闻必须有可点击的链接
3. "核心技术原理" 段落要让产品经理能看懂(避免堆砌术语)
4. "对产品的启示" 必须是可执行的具体建议, 不要空话
5. 趋势洞察要给到具体行动建议, 不要泛泛而谈"未来很重要"
"""


LLMOPS_DAILY_PROMPT = """你是一位资深 LLMOps 行业分析师, 正在为一位 LLMOps 平台产品经理撰写《LLMOps 竞品情报日报》。

**用户背景**:
- 任职于星环科技 (Transwarp), 负责 LLMOps 平台产品规划
- 重点关注国内外 LLMOps 同业竞品的新功能 + 设计理念 + 落地影响
- 国外: LangChain/LangSmith, Dify, Coze, Anthropic Claude SDK, OpenAI Agents SDK, Google Agent Builder, AWS Bedrock, Azure AI Foundry, Databricks, Glean, Snowflake Cortex, Portkey, Langfuse
- 国内: 字节扣子, 百度千帆, 阿里百炼, 腾讯元器, 华为 ModelArts, 智谱清流, 月之暗面 Kimi 平台, 火山引擎
- 中文输出, 假设熟悉主流 LLM/Agent 概念
- 不要资本市场/股价类财经资讯
- 偏好"功能背后的产品逻辑 + 对我产品的具体启示"

**今日日期**: {date_zh} ({weekday})

**任务**:
使用 Web Search 工具检索 LLMOps 平台 / Agent 框架 / AI 基础设施 2026 年 4 月的最新动态, 撰写一份《LLMOps 竞品情报日报》, 严格按以下结构 (纯 Markdown):

```
# LLMOps 竞品情报日报

**日期**: {date_cn}({weekday})
**状态**: <一句话总结今日 3 条主线>

---

## 1. 今日要闻

### 🔥 要闻一: <标题>
**平台**: <平台名>
**时间**: <YYYY-MM-DD>
**具体更新内容**:
- <bullet>
- <bullet>
**设计理念解读** (为什么这么做):
- <从产品逻辑角度分析,1-3 条>
**影响分析**:
<2-3 句, 包含对国内厂商/星环的启示>
**参考链接**:
- [来源1](URL)

(共 3 条要闻)

---

## 2. 功能创新追踪
### 近期各平台重要功能更新对比
| 平台 | 更新内容 | 具体能力 | 竞品差异点 |
(8-10 行)

### 重点功能深度解读
**<功能名>**:
- 是什么/落地难度/业务价值/建议
(2-3 项)

---

## 3. 价格与商业动态
### 投融资
| 平台/产品 | 动作 | 详情 |
(4-6 行)

### 模型价格观察
<2-3 句趋势观察>

---

## 4. 平台/工具新动向
### 🆕 <工具名>
- <bullet>
(3-4 项)

---

## 5. 对产品经理的启示
### 启示一: <一句话>
<分析>
**具体建议**:
- <可执行 bullet>

(共 4-5 条启示, 必须包含"竞品短板就是你的机会点"这种 actionable 内容)

---

*本日报基于公开信息整理, 数据截至 {date_cn}。*
```

**重要要求**:
1. 必须用 Web Search 检索真实动态, 不编造
2. 每条"设计理念解读"要能回答"为什么 X 厂商这么做",不只是描述功能
3. 启示必须能直接指导产品决策, 避免空话
4. "竞品短板就是你的机会点"这种段落对用户最有价值,务必有
"""


# ============================================================
# Anthropic API 调用
# ============================================================
def call_claude_with_web_search(prompt: str, model: str, api_key: str) -> str:
    """调用 Claude API 并启用 Web Search 工具"""
    headers = {
        "x-api-key": api_key,
        "anthropic-version": ANTHROPIC_VERSION,
        "content-type": "application/json",
    }
    payload = {
        "model": model,
        "max_tokens": MAX_TOKENS,
        "tools": [
            {
                "type": "web_search_20250305",
                "name": "web_search",
                "max_uses": WEB_SEARCH_MAX_USES,
            }
        ],
        "messages": [{"role": "user", "content": prompt}],
    }
    data = json.dumps(payload).encode("utf-8")
    req = urllib.request.Request(
        ANTHROPIC_API_URL, data=data, headers=headers, method="POST"
    )
    try:
        with urllib.request.urlopen(req, timeout=600) as resp:
            result = json.loads(resp.read().decode("utf-8"))
    except urllib.error.HTTPError as e:
        body = e.read().decode("utf-8", errors="ignore")
        raise RuntimeError(f"Anthropic API HTTP {e.code}: {body}") from e

    # 拼接所有 text block
    out = []
    for block in result.get("content", []):
        if block.get("type") == "text":
            out.append(block.get("text", ""))
    text = "".join(out).strip()
    if not text:
        raise RuntimeError(f"Empty response from Claude. Full response: {result}")
    return text


# ============================================================
# 邮件发送
# ============================================================
def send_email(subject: str, html_body: str, to_addr: str,
               smtp_user: str, smtp_pass: str) -> None:
    msg = MIMEMultipart("alternative")
    msg["From"] = smtp_user
    msg["To"] = to_addr
    msg["Subject"] = subject
    msg.attach(MIMEText(html_body, "html", "utf-8"))

    with smtplib.SMTP_SSL("smtp.gmail.com", 465, timeout=60) as server:
        server.login(smtp_user, smtp_pass)
        server.sendmail(smtp_user, [to_addr], msg.as_string())


def markdown_to_simple_html(md: str) -> str:
    """简易 markdown → HTML 转换 (邮件场景, 保持可读)"""
    lines = md.split("\n")
    html = ['<html><body style="font-family: -apple-system, BlinkMacSystemFont, '
            '\'Segoe UI\', \'PingFang SC\', \'Hiragino Sans GB\', \'Microsoft YaHei\', '
            'sans-serif; line-height:1.7; color:#222; max-width:800px; margin:auto; padding:20px;">']
    in_table = False
    in_code = False
    for line in lines:
        s = line.rstrip()
        if s.startswith("```"):
            in_code = not in_code
            html.append("<pre style='background:#f5f5f5;padding:8px;border-radius:4px;overflow-x:auto;'>" if in_code else "</pre>")
            continue
        if in_code:
            html.append(_escape_html(s))
            continue
        if s.startswith("# "):
            html.append(f"<h1 style='color:#0A2E5C;border-bottom:2px solid #1E5AA8;padding-bottom:8px;'>{_escape_html(s[2:])}</h1>")
        elif s.startswith("## "):
            html.append(f"<h2 style='color:#1E5AA8;margin-top:24px;'>{_escape_html(s[3:])}</h2>")
        elif s.startswith("### "):
            html.append(f"<h3 style='color:#0A2E5C;margin-top:20px;'>{_inline_md(s[4:])}</h3>")
        elif s.startswith("- "):
            html.append(f"<li>{_inline_md(s[2:])}</li>")
        elif s.startswith("|") and "|" in s[1:]:
            if not in_table:
                in_table = True
                html.append("<table style='border-collapse:collapse;width:100%;margin:12px 0;'>")
            cells = [c.strip() for c in s.strip("|").split("|")]
            if all(set(c) <= set("-: ") for c in cells):
                continue  # 表格分隔行
            tag = "th" if cells and "---" not in s else "td"
            row = "".join(f"<{tag} style='border:1px solid #ddd;padding:6px 10px;text-align:left;'>{_inline_md(c)}</{tag}>" for c in cells)
            html.append(f"<tr>{row}</tr>")
        else:
            if in_table:
                html.append("</table>")
                in_table = False
            if s.strip() == "---":
                html.append("<hr style='border:none;border-top:1px solid #ddd;margin:16px 0;'>")
            elif s.strip() == "":
                html.append("<br>")
            else:
                html.append(f"<p>{_inline_md(s)}</p>")
    if in_table:
        html.append("</table>")
    html.append("</body></html>")
    return "\n".join(html)


def _escape_html(s: str) -> str:
    return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")


def _inline_md(s: str) -> str:
    """内联 markdown (粗体/链接)"""
    import re
    s = _escape_html(s)
    s = re.sub(r"\*\*([^*]+)\*\*", r"<strong>\1</strong>", s)
    s = re.sub(r"\[([^\]]+)\]\(([^)]+)\)", r"<a href='\2' style='color:#1E5AA8;'>\1</a>", s)
    s = re.sub(r"`([^`]+)`", r"<code style='background:#f0f0f0;padding:1px 4px;border-radius:3px;'>\1</code>", s)
    return s


# ============================================================
# 主流程
# ============================================================
def get_today_strings():
    now = datetime.now(BEIJING_TZ)
    weekdays = ["周一", "周二", "周三", "周四", "周五", "周六", "周日"]
    return {
        "iso": now.strftime("%Y-%m-%d"),
        "date_cn": now.strftime("%Y年%m月%d日"),
        "date_zh": now.strftime("%Y-%m-%d"),
        "weekday": weekdays[now.weekday()],
    }


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--no-email", action="store_true", help="不发送邮件,只生成文件")
    parser.add_argument("--skip-llmops", action="store_true", help="跳过 LLMOps 专题")
    parser.add_argument("--skip-general", action="store_true", help="跳过综合版")
    args = parser.parse_args()

    api_key = os.environ.get("ANTHROPIC_API_KEY")
    if not api_key:
        print("❌ 缺少环境变量 ANTHROPIC_API_KEY", file=sys.stderr)
        sys.exit(1)

    model = os.environ.get("CLAUDE_MODEL", DEFAULT_MODEL)
    today = get_today_strings()
    repo_root = Path(__file__).parent

    summaries = []  # 用于汇总到邮件正文

    # 综合版
    if not args.skip_general:
        print(f"📰 生成综合版日报 ({today['iso']})...", flush=True)
        prompt = GENERAL_DAILY_PROMPT.format(
            date_cn=today["date_cn"], date_zh=today["date_zh"],
            weekday=today["weekday"]
        )
        general_md = call_claude_with_web_search(prompt, model, api_key)
        out_general = repo_root / f"{today['iso']}.md"
        out_general.write_text(general_md, encoding="utf-8")
        print(f"✅ 已写入 {out_general} ({len(general_md)} chars)")
        summaries.append(("综合版", general_md))

    # LLMOps 专题
    if not args.skip_llmops:
        print(f"📊 生成 LLMOps 竞品情报版 ({today['iso']})...", flush=True)
        prompt = LLMOPS_DAILY_PROMPT.format(
            date_cn=today["date_cn"], date_zh=today["date_zh"],
            weekday=today["weekday"]
        )
        llmops_md = call_claude_with_web_search(prompt, model, api_key)
        llmops_dir = repo_root / "llmops"
        llmops_dir.mkdir(exist_ok=True)
        out_llmops = llmops_dir / f"{today['iso']}.md"
        out_llmops.write_text(llmops_md, encoding="utf-8")
        print(f"✅ 已写入 {out_llmops} ({len(llmops_md)} chars)")
        summaries.append(("LLMOps 竞品情报版", llmops_md))

    # 发送邮件
    if not args.no_email and summaries:
        smtp_user = os.environ.get("EMAIL_USERNAME")
        smtp_pass = os.environ.get("EMAIL_PASSWORD")
        to_addr = os.environ.get("EMAIL_TO") or smtp_user
        if not (smtp_user and smtp_pass):
            print("⚠️  缺少 EMAIL_USERNAME / EMAIL_PASSWORD, 跳过发送邮件")
        else:
            print(f"📧 发送邮件到 {to_addr}...", flush=True)
            for label, md in summaries:
                subject = f"[AI Daily · {label}] {today['date_cn']}({today['weekday']})"
                html = markdown_to_simple_html(md)
                send_email(subject, html, to_addr, smtp_user, smtp_pass)
                print(f"✅ 已发送: {subject}")

    print("🎉 完成")


if __name__ == "__main__":
    main()
