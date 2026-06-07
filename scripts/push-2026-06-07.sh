#!/bin/bash
# Push script for 2026-06-07 AI daily report
# Run this locally: bash scripts/push-2026-06-07.sh

set -e

echo "📤 Pushing 2026-06-07 AI daily report..."

# === 1. Feishu Card ===
echo "→ Sending to Feishu..."
curl -s -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
-H 'Content-Type: application/json' \
-d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "tag": "plain_text",
        "content": "📊 AI 技术日报 - 2026年6月7日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "**🔥 今日要闻**\n\n**1. GitHub Copilot 全面转向用量计费，部分开发者月费暴涨 25 倍**\n6月1日起所有计划切换为 token 用量计费制（Usage-Based Billing），每计划含等值 AI Credits 额度。多位开发者报告月费从 $29 暴涨至 $750。Agent 模式大量消耗 token 是主因。\n\n**2. ChatGPT 月活突破 10 亿，史上最快**\nSensor Tower 数据：ChatGPT 发布约 3 年即达 10 亿 MAU，超越 TikTok（~4年）、Instagram（~8年）。周活 9 亿，日处理 20 亿+ 查询，ARR 突破 $100 亿。Claude 应用月活约 5600 万，同比增长 640%。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3. Gemini 3.5 Pro 即将发布：200 万 token 上下文**\nGoogle CEO 在 I/O 2026 承诺 6 月发布。预期支持 200 万 token（目前量产模型最大）、Deep Think 深度推理模式。6 月 8 日起 Gemini 3.5 Flash 成为企业默认模型。\n\n**4. 白宫 AI 行政令：前沿模型发布前 30 天须提交政府预审**\n自愿性质，要求前沿 AI 公司在模型发布前 30 天向政府提交预审。建立 AI 网络安全信息交换中心。明确不建立强制许可制度。\n\n**5. Snowflake Summit 2026：26 项 AI Agent 新能力**\n发布 CoWork（Claude 驱动的工作 Agent）、CoCo 编码 Agent、AI Agent Identity 身份认证。Anthropic 成为 Snowflake 核心 AI 供应商。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**🌟 热门开源项目 Top 3**\n\n| 项目 | Star 数 | 一句话介绍 |\n|------|---------|----------|\n| [Dify](https://github.com/langgenius/dify) | 139K | 可视化 AI Agent 工作流平台 |\n| [RAGFlow](https://github.com/infiniflow/ragflow) | 81.6K | 企业级 RAG 引擎 |\n| [Ollama](https://github.com/ollama/ollama) | 280K+ | 本地大模型一键运行 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**💰 资本动态**\n\n| 公司 | 融资 | 估值 |\n|------|------|------|\n| Anthropic | $650亿 Series H | $9650亿 |\n| Supabase | $5亿 Series F | $105亿 |\n| Suno | $4亿 Series D | $54亿 |\n| Generalist AI | $4亿 | $20亿 |\n\nChatGPT ARR 突破 $100 亿，广告业务扩展至英国。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**📈 模型价格速览（每百万 token）**\n\n| 模型 | 输入 | 输出 |\n|------|------|------|\n| DeepSeek V4-Pro | $0.435 | $0.87 |\n| MiniMax M3(促销) | $0.30 | $1.20 |\n| Qwen 3.7 Max(促销) | $1.25 | $3.75 |\n| Gemini 3.5 Flash | $1.50 | $9.00 |\n| Grok 4.3 | $1.25 | $2.50 |\n| Claude Opus 4.8 | $5.00 | $25.00 |\n| GPT-5.5 | $5.00 | $30.00 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**💡 行动建议**\n1. AI 工具定价转向按量付费，立即审计团队 token 消耗基线\n2. 中国模型性价比攻势加速，批处理场景可降 50-90% 成本\n3. 企业 AI Agent 进入生产阶段，权限管理和审计是采购关键\n4. 200 万 token 上下文即将标配，重新评估 RAG vs 全文输入策略\n\n📎 [查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-07.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'
echo ""
echo "✅ Feishu sent!"

# === 2. Bark Push ===
echo "→ Sending to Bark..."
TITLE=$(python3 -c "import urllib.parse; print(urllib.parse.quote('📊 AI 技术日报 2026-06-07'))")
BODY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('GitHub Copilot 用量计费生效，部分开发者费用暴涨25倍；ChatGPT月活突破10亿创纪录。点击查看全文→'))")
URL=$(python3 -c "import urllib.parse; print(urllib.parse.quote('https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-07.md'))")
GROUP=$(python3 -c "import urllib.parse; print(urllib.parse.quote('AI日报'))")
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/${TITLE}/${BODY}?url=${URL}&group=${GROUP}"
echo ""
echo "✅ Bark sent!"

echo ""
echo "🎉 All push notifications sent successfully!"
