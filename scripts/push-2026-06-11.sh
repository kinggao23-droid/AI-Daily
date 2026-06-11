#!/bin/bash
# AI 技术日报推送脚本 - 2026-06-11
# 推送到飞书 Webhook + Bark iPhone 通知

set -e

echo "📤 正在推送 2026-06-11 AI 技术日报..."

# ===== 飞书卡片消息 =====
echo "1/2 推送到飞书..."
curl -s -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
  -H 'Content-Type: application/json' \
  -d '{
    "msg_type": "interactive",
    "card": {
      "header": {
        "template": "blue",
        "title": {
          "tag": "plain_text",
          "content": "📊 AI 技术日报 - 2026年6月11日"
        }
      },
      "elements": [
        {
          "tag": "markdown",
          "content": "## 🔥 今日要闻\n\n**1. Claude Fable 5 发布：编程能力碾压竞品**\nAnthropic 6月9日发布最强模型 Claude Fable 5。SWE-Bench Pro 得分 80.3%，GPT-5.5 仅 58.6%，领先 21 个百分点。API 定价：输入 $10/M token，输出 $50/M token。上下文 100 万 token，自适应思考默认开启。6月9-22日 Claude.ai 订阅用户可免费使用。\n\n**2. Anthropic 650 亿美元 H 轮融资，估值 9650 亿美元**\n首次超越 OpenAI 成为全球估值最高 AI 公司。Altimeter/Sequoia 领投，年化收入 470 亿美元。距万亿美元俱乐部仅一步之遥。"
        },
        {
          "tag": "hr"
        },
        {
          "tag": "markdown",
          "content": "**3. Google 关闭 Gemini CLI，转向闭源 Antigravity CLI**\n6月18日停服，6000+ 社区 PR 的开源项目变为闭源。开发者强烈反弹：\"我们是在做无偿劳动吗？\" 替代方案：Claude Code、OpenHands、Cursor。\n\n**4. SpaceX 今日定价 IPO：$135/股，估值 1.75 万亿美元**\n史上最大 IPO，明日纳斯达克交易（SPCX）。募资 750 亿美元。将为 OpenAI（9月）和 Anthropic（10月）IPO 铺路。\n\n**5. EU AI Act 第50条 8月2日生效**\n52天后，AI 聊天机器人必须亮明 AI 身份，Deepfake 必须加水印。违规罚款最高 3500 万欧元或年营业额 7%。"
        },
        {
          "tag": "hr"
        },
        {
          "tag": "markdown",
          "content": "## 🌟 热门开源项目 Top 3\n\n**1. Headroom** — Token 压缩 60-95%，本周 +13,062 Star（增长最快）\n[GitHub](https://github.com/chopratejas/headroom) | 21,785 ⭐\n\n**2. TurboVec** — 向量索引 8 倍压缩，基于 Google ICLR 2026 论文\n[GitHub](https://github.com/RyanCodrai/turbovec) | 10,809 ⭐\n\n**3. Agent-Reach** — AI Agent 零成本联网 13+ 平台\n[GitHub](https://github.com/Panniantong/Agent-Reach) | 26,054 ⭐"
        },
        {
          "tag": "hr"
        },
        {
          "tag": "markdown",
          "content": "## 📦 产品动态\n\n| 产品 | 关键更新 |\n|------|----------|\n| NVIDIA Nemotron 3 Ultra | 550B 参数开源最强，API 低至 $0.37/$1.08 |\n| Apple Siri AI | Gemini 驱动，iOS 27 可选 Claude/ChatGPT 为默认 AI |\n| Gemini 3.5 Pro | 200 万 token 上下文，6 月内发布 |"
        },
        {
          "tag": "hr"
        },
        {
          "tag": "markdown",
          "content": "## 💰 资本动态\n\n| 公司 | 事件 | 金额/估值 |\n|------|------|----------|\n| Anthropic | H 轮 | $650 亿 / $9650 亿 |\n| SpaceX | IPO | $750 亿 / $1.75 万亿 |\n| OpenAI | 秘密 IPO | $7300-8500 亿 |\n| PhysicsX | C 轮 | $3 亿 / $24 亿 |"
        },
        {
          "tag": "hr"
        },
        {
          "tag": "markdown",
          "content": "## 💡 行动建议\n\n1. **模型选型精细化**：编程用 Fable 5，通用推理用 Opus 4.8，成本敏感用 Gemini Flash\n2. **用 Headroom 降本**：Token 压缩 60-95%，直接砍掉 API 成本\n3. **EU 合规排查**：8月2日前 AI 产品须加身份标识（仅剩 52 天）\n4. **Gemini CLI 迁移**：6月18日停服，仅剩 7 天，立即评估替代方案\n\n📎 [查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-11.md)"
        },
        {
          "tag": "hr"
        },
        {
          "tag": "markdown",
          "content": "💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
        }
      ]
    }
  }'

echo ""

# ===== Bark iPhone 推送 =====
echo "2/2 推送到 Bark..."
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-06-11/Claude%20Fable%205%20%E5%8F%91%E5%B8%83%EF%BC%9ASWE-Bench%20Pro%2080.3%25%20%E7%A2%BE%E5%8E%8B%20GPT-5.5%EF%BC%8CAnthropic%20%E4%BC%B0%E5%80%BC%E7%AA%81%E7%A0%B4%209650%20%E4%BA%BF%E7%BE%8E%E5%85%83%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%85%A8%E6%96%87?url=https%3A%2F%2Fgithub.com%2Fkinggao23-droid%2FAI-Daily%2Fblob%2Fmain%2F2026-06-11.md&group=AI%E6%97%A5%E6%8A%A5"

echo ""
echo "✅ 推送完成！"
