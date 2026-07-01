#!/bin/bash
# AI 技术日报 2026-07-01 推送脚本（飞书 + Bark）
# 用法：bash scripts/push-2026-07-01.sh

echo "📤 推送 AI 技术日报 2026-07-01..."

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
        "content": "📊 AI 技术日报 - 2026年7月1日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 今日要闻\n\n**1️⃣ Anthropic 发布 Claude Sonnet 5**\n限时 $2/$10（至8月31日），SWE-bench Pro 63.2% 超 GPT-5.5 的 58.6%，Terminal-Bench 80.4%，100万token上下文。已上线 claude.ai、Claude Code、Cursor、VS Code、GitHub Copilot。\n\n**2️⃣ SpaceX × Reflection AI $63亿算力租赁今日生效**\n月费$1.5亿，NVIDIA GB300，合同至2029年。SpaceX同时向Anthropic（$12.5亿/月）、Google（$9.2亿/月）出租算力。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3️⃣ Gemini 3.5 Pro 确认7月发布**\n200万token上下文（生产级最大）+ Deep Think推理。预计$15/$60。Flash已上线：$1.50/$9.00，GDPval-AA 1,656 Elo。\n\n**4️⃣ ChatGPT份额首次跌破50%**\nChatGPT 46.4%↓ | Gemini 27.7%↑ | Claude 10.3%↑↑（季度+306%）\nChatGPT仍是首个月活10亿AI产品。\n\n**5️⃣ 白宫AI行政令：模型发布前30天预审**\n自愿向政府提前30天提供前沿模型访问权限，建立AI网络安全信息交换中心。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 热门开源 Top 3\n\n🔥 **strix** (28K⭐ +515) AI渗透测试，实际攻击验证零误报\n🔥 **video-use** (12.6K⭐ +721) 用Claude Code剪辑视频\n🔥 **ai-berkshire** (7.5K⭐ +969) 巴菲特芒格方法论多Agent投资研究"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## LLM定价速览（7月最新）\n\n| 模型 | 输入 | 输出 |\n|------|------|------|\n| DeepSeek V4-Flash | $0.14 | $0.28 |\n| DeepSeek V4-Pro | $0.435 | $0.87 |\n| GLM-5.2 | $0.95 | $3.00 |\n| Gemini 3.5 Flash | $1.50 | $9.00 |\n| Sonnet 5限时 | $2.00 | $10.00 |\n| Opus 4.8 | $5.00 | $25.00 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 趋势洞察\n\n🔹 **Agent模型性价比时代**：Sonnet 5以$2/$10提供63.2%编码能力\n🔹 **AI市场碎片化**：场景化竞争取代全能竞争\n🔹 **视频制作Agent化**：video-use革新内容生产\n🔹 **政府管控成第四变量**：模型热切换能力成刚需\n\n📄 [查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-01.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}')

FEISHU_HTTP_CODE=$(echo "$FEISHU_RESULT" | tail -1)
FEISHU_BODY=$(echo "$FEISHU_RESULT" | sed '$d')

if [ "$FEISHU_HTTP_CODE" = "200" ]; then
  echo "✅ 飞书推送成功"
else
  echo "❌ 飞书推送失败 (HTTP $FEISHU_HTTP_CODE)"
  echo "$FEISHU_BODY"
fi

# ===== Bark 推送 =====
echo ""
echo "📱 发送 Bark 推送..."
BARK_RESULT=$(curl -s -w "\n%{http_code}" "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-07-01/Claude%20Sonnet%205%20%E5%8F%91%E5%B8%83%EF%BC%9ASWE-bench%2063.2%25%20%E8%B6%85GPT-5.5%EF%BC%8C%E9%99%90%E6%97%B6%242%2F%2410%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%AE%8C%E6%95%B4%E6%97%A5%E6%8A%A5?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-01.md&group=AI%E6%97%A5%E6%8A%A5")

BARK_HTTP_CODE=$(echo "$BARK_RESULT" | tail -1)
BARK_BODY=$(echo "$BARK_RESULT" | sed '$d')

if [ "$BARK_HTTP_CODE" = "200" ]; then
  echo "✅ Bark 推送成功"
else
  echo "❌ Bark 推送失败 (HTTP $BARK_HTTP_CODE)"
  echo "$BARK_BODY"
fi

echo ""
echo "🎉 推送完成！"
