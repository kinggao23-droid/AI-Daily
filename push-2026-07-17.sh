#!/bin/bash
# 飞书推送
curl -s -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
-H 'Content-Type: application/json' \
-d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "tag": "plain_text",
        "content": "📊 AI 技术日报 - 2026年7月17日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "**🔥 今日要闻**\n\n**1. 超级日到来：Gemini 3.5 Pro + WAIC 2026 + DeepSeek V4**\n- Gemini 3.5 Pro 瞄准今日发布：200万token上下文、Deep Think推理、泄露定价$15/$60每百万token\n- WAIC 2026上海开幕：习近平首次亲自出席，300+全球新品首发\n- DeepSeek V4转正式版：V4 Pro仅$0.435/$0.87，引入峰谷计费"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "**2. OpenAI提议向美国政府出让5%股份（$426亿）**\n按$8520亿估值计算，提议Anthropic/Google/Meta也出让5%，通过主权财富基金运作\n\n**3. GPT-5.6全面开放三档定价**\n- Sol $5/$30（BrowseComp 92.2% 新SOTA）\n- Terra $2.50/$15（≈GPT-5.5性能减半价格）\n- Luna $1/$6（性价比是Opus 4.8的5倍）"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "**4. Fable 5免费期第三次延长至7/19**\n应对GPT-5.6竞争，Cursor中出现Opus 5泄露\n\n**5. Jalapeño推理芯片9个月完成流片**\nOpenAI+Broadcom首款自研芯片，2026年底部署"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "**🌟 热门开源Top3**\nOllama(174K⭐) | Dify(138K⭐) | vLLM(83K⭐)\n\n**💰 融资**\nTogether AI C轮$8亿@$83亿 | Harvey AI $2亿@$110亿 | Taktile C轮$1.1亿\n2026H1全球创业融资$5100亿超2025全年"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "**💡 行动建议**\n1. 建立模型路由表：旗舰10%+中端30%+经济型60%\n2. 产品路线图预留2-4周监管缓冲期\n3. 现在做高调用量场景原型，待推理成本下降后规模化\n4. 切入金融/法律Agent赛道\n\n📎 [查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-17.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'

echo ""
echo "---"

# Bark推送
ENCODED_TITLE=$(python3 -c "import urllib.parse; print(urllib.parse.quote('📊 AI 技术日报 2026-07-17'))")
ENCODED_BODY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('超级日到来：Gemini 3.5 Pro+WAIC 2026+DeepSeek V4 三件大事同日落地，点击查看完整日报'))")
ENCODED_URL=$(python3 -c "import urllib.parse; print(urllib.parse.quote('https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-17.md'))")

curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/${ENCODED_TITLE}/${ENCODED_BODY}?url=${ENCODED_URL}&group=AI%E6%97%A5%E6%8A%A5"

echo ""
echo "Done."
