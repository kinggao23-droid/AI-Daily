#!/bin/bash
# 飞书 + Bark 推送脚本 - 2026-07-15 AI 技术日报
# 由于远程执行环境的网络策略限制，无法直接推送。请在本地环境运行此脚本。

# === 飞书卡片推送 ===
echo "正在推送到飞书..."
curl -s -X POST "https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81" \
  -H "Content-Type: application/json" \
  -d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "tag": "plain_text",
        "content": "📊 AI 技术日报 - 2026年7月15日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 今日要闻\n\n**1. 中国AI拟人化管理办法今日正式施行**\n豆包(3.5亿月活)和通义千问同日下线用户自定义智能体功能。新规覆盖虚拟伴侣、情感陪伴类AI，不影响工具型AI。\n\n**2. Anthropic发布Claude for Teachers**\n美国K-12教师免费使用高级版Claude一年，接入全美50州学术标准，符合FERPA。\n\n**3. 7月17日超级日**\nGemini 3.5 Pro(200万token上下文从零重建) + DeepSeek V4正式版(首次引入高峰定价) + WAIC 2026开幕(习近平首次亲自出席，1100+企业，300+新品)"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "**4. AI模型排行榜前四名差距仅6分**\n| 排名 | 模型 | 智能指数 | 输入/输出价格 |\n|------|------|---------|----------|\n| #1 | Fable 5 | 60 | $10/$50 |\n| #2 | Opus 4.8 | 56 | $15/$75 |\n| #3 | GPT-5.6 Sol | 59 | $5/$30 |\n| #4 | Grok 4.5 | 54 | $2/$6 |\n\nGrok 4.5 token效率比Opus 4.8高4.2倍"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "**5. AI竞争从模型转向落地**\n四巨头合计$80亿+建部署服务：\nAWS $10亿 | Microsoft $25亿 | OpenAI $40亿 | Anthropic $15亿\n72%企业已有Agent AI在生产环境"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "## 热门开源 Top 3\n\n| 项目 | Star | 周增 | 描述 |\n|------|------|------|------|\n| OfficeCLI | 16.8K | +7129 | AI操作Office文档 |\n| Orca | 19.1K | +5724 | 30+ Agent并行编码 |\n| OmniRoute | 17.3K | +4297 | 231+ LLM统一网关 |"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "## 资本动态\n\n• SpaceX $600亿收购Cursor(史上最大)\n• Anthropic $650亿H轮(估值$9650亿)\n• DeepSeek筹备IPO(估值~$710亿)\n• Together AI $8亿C轮(估值$83亿)\n• 2026 H1全球创业融资$5100亿创纪录"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "## PM行动建议\n\n1. **搭建多模型路由**：模型差距已到个位数，按场景选模型\n2. **关注7/17三大发布**：Gemini 3.5 Pro + DeepSeek V4 + WAIC\n3. **中国合规**：拟人化管理办法今日生效\n4. **抓住Sonnet 5限时价**：$2/$10(至8/31)\n\n📎 [查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-15.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'
echo ""
echo "飞书推送完成"

# === Bark 推送 ===
echo "正在推送到 Bark..."
TITLE=$(python3 -c "import urllib.parse; print(urllib.parse.quote('📊 AI 技术日报 2026-07-15'))")
BODY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('中国AI拟人化管理办法今日施行，豆包千问下线智能体；7/17超级日：Gemini 3.5 Pro+DeepSeek V4+WAIC开幕。点击查看全文→'))")
GITHUB_URL=$(python3 -c "import urllib.parse; print(urllib.parse.quote('https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-15.md'))")

curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/${TITLE}/${BODY}?url=${GITHUB_URL}&group=AI%E6%97%A5%E6%8A%A5"
echo ""
echo "Bark 推送完成"
echo "全部推送完成！"
