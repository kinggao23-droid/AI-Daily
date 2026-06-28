#!/bin/bash
# AI 技术日报 2026-06-28 推送脚本（飞书 + Bark）
# 用法：bash scripts/push-2026-06-28.sh

echo "📤 推送 AI 技术日报 2026-06-28..."

# ===== 飞书推送 =====
echo "📮 发送飞书卡片消息..."
FEISHU_RESULT=$(curl -s -w "\n%{http_code}" -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
  -H 'Content-Type: application/json' \
  -d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "tag": "plain_text",
        "content": "📊 AI 技术日报 - 2026年6月28日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 今日要闻\n\n**1️⃣ 全球 AI 股票大抛售：纳斯达克连跌五天**\n纳斯达克连跌 5 天，Alphabet 市值蒸发 $2700 亿。四大科技巨头 AI 资本支出超 $4520 亿，市场质疑 ROI。OpenAI IPO 可能延期。\n\n**2️⃣ Qualcomm $39.2 亿收购 Modular**\nLLVM/Swift 之父 Chris Lattner 创立，Mojo 语言+MAX 引擎挑战 NVIDIA CUDA 垄断。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3️⃣ ChatGPT 份额首次跌破 50%**\nChatGPT 46.4%，Gemini 27.7%，Claude 10.3%。Claude 月活 2.45 亿（5 个月翻 4 倍），付费率 13% 行业最高。\n\n**4️⃣ GPT-4.5 退役，GPT-4 时代终结**\n6月27日下线迁移至 GPT-5.5。GPT-5.6 延期至 7 月。\n\n**5️⃣ Agentjacking 攻击**\n85% 成功率劫持 AI 编程 Agent，2388 个组织受影响。Sentry 拒绝修复。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 热门开源 Top 3\n\n🔥 **ai-berkshire** — Claude Code 价值投资多智能体框架 ⭐4,131\n🔥 **Browser Use** — AI 浏览器自动化 ⭐97K（年增 10 倍）\n🔥 **Cognee** — AI Agent 长期记忆平台 ⭐24K（拜耳等 70+ 企业使用）"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 资本动态\n\nAnthropic Series H $650 亿（估值 $9650 亿）| Suno Series D $4 亿 | Flourish $5 亿（Bezos 参投）| Qualcomm 收购 Modular $39.2 亿 | Assort Health Series C $1.2 亿（新独角兽）"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## LLM 价格速览（/百万 token）\n\nDeepSeek V4-Flash $0.14/$0.28 → Gemini 3.5 Flash $1.50/$9.00 → Claude Sonnet 4.6 $3.00/$15.00 → Claude Opus 4.8 $5.00/$25.00 → GPT-5.5 $5.00/$30.00"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 行动建议\n\n1. **证明 ROI**：AI 功能必须量化商业价值\n2. **Agent 安全**：MCP 数据源需防数据投毒，权限最小化\n3. **模型降级测试**：DeepSeek V4 比 GPT-5.5 便宜 34 倍但基准更高\n4. **多模型架构**：至少支持 3 家供应商快速切换\n\n📎 [点击查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-28.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}')

FEISHU_HTTP_CODE=$(echo "$FEISHU_RESULT" | tail -1)
FEISHU_BODY=$(echo "$FEISHU_RESULT" | sed '$d')

if [ "$FEISHU_HTTP_CODE" = "200" ]; then
  echo "✅ 飞书推送成功"
else
  echo "❌ 飞书推送失败 (HTTP $FEISHU_HTTP_CODE): $FEISHU_BODY"
fi

# ===== Bark 推送 =====
echo "📱 发送 Bark 推送..."
BARK_TITLE=$(python3 -c "import urllib.parse; print(urllib.parse.quote('📊 AI 技术日报 2026-06-28'))")
BARK_BODY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('纳斯达克连跌5天，Alphabet市值蒸发\$2700亿；ChatGPT份额首次跌破50%，Claude月活翻4倍达2.45亿。点击查看全文→'))")
BARK_URL="https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/${BARK_TITLE}/${BARK_BODY}?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-28.md&group=AI%E6%97%A5%E6%8A%A5"

BARK_RESULT=$(curl -s -w "\n%{http_code}" "$BARK_URL")
BARK_HTTP_CODE=$(echo "$BARK_RESULT" | tail -1)

if [ "$BARK_HTTP_CODE" = "200" ]; then
  echo "✅ Bark 推送成功"
else
  echo "❌ Bark 推送失败 (HTTP $BARK_HTTP_CODE)"
fi

echo ""
echo "🎉 推送完成！"
echo "📎 GitHub 日报链接: https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-28.md"
