#!/bin/bash
# 飞书 + Bark 推送脚本 - 2026-07-16 AI 技术日报
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
        "content": "📊 AI 技术日报 - 2026年7月16日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 今日要闻\n\n**1️⃣ 明日三箭齐发：Gemini 3.5 Pro + DeepSeek V4 + WAIC 2026**\n- **Gemini 3.5 Pro**：200万token上下文（当前最长）、Deep Think推理模式、完全推倒重建架构\n- **DeepSeek V4正式版**：V4-Pro $1.74/$3.48、V4-Flash $0.14/$0.28（每百万token），首次引入峰谷定价\n- **WAIC 2026上海开幕**：10万㎡展览、1100+企业、300+新品发布，习近平首次亲临"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "**2️⃣ Claude Code桌面版上线沙箱浏览器**\nAI编程助手首次能\"自己上网\"——在应用内浏览网页、阅读文档、与页面交互。Cmd+Shift+B快捷访问，沙箱隔离+安全分类器审查。Pro/Max用户可用。\n\n**3️⃣ AI安全指数：九大实验室无一及格**\nFLI 2026夏季评估：Anthropic C+（最高）> OpenAI/Google C > Meta D+ > xAI/DeepSeek/Mistral接近不及格。安全将成差异化竞争维度。"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "**4️⃣ Perplexity Brain：Agent自我改进记忆**\n上下文图谱+夜间自动复盘，正确率+25%、召回率+16%、成本-13%。$200/月Max订阅可用。\n\n**5️⃣ GitHub Copilot首接开源权重模型Kimi K2.7 Code**\n月之暗面1T参数/32B激活MoE模型，从Hugging Face到Copilot仅19天。模型阵容扩至5家厂商。"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "## 热门开源 Top 3\n\n| 项目 | ⭐ Star | 亮点 |\n|---|---|---|\n| OpenClaw | 375K+ | 个人AI助手，超越React成GitHub现象级 |\n| Vibe-Trading | 23.7K+ | AI量化交易研究平台，452个预制因子 |\n| mattpocock/skills | 160K+ | Claude Code技能库，750万+下载 |"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "## 产品动态\n\n- **GPT-5.6全面开放**：Sol $5/$30、Terra $2.5/$15、Luna $1/$6\n- **Seedream 5.0 Pro**（字节）：对标GPT-Image 2，原生2K\n- **腾讯混元Hy3**：MoE 2950亿参数，Apache-2.0开源\n- **Google Gemini矩阵**：Spark/Omni/Enterprise/Daily Brief"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "## 资本格局\n\n- DeepSeek融资$15亿+IPO筹备，估值$710亿\n- 快手可灵AI融资$30亿，估值$180亿\n- TSMC Q2营收$399.6亿，6月同比+67.9%创新高\n- Anthropic洽谈三星2nm自研推理芯片\n- 韩国$8800亿AI/芯片国家投资计划"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "## PM行动建议\n\n1. **明天关注三大发布**：准备Gemini 3.5 Pro测试+DeepSeek API迁移(7/24前)\n2. **评估Agent记忆升级**：Perplexity Brain模式值得借鉴\n3. **中国开源进入主流**：Kimi/DeepSeek纳入多模型路由评估\n4. **峰谷定价将成标准**：架构加入任务时段调度\n5. **AI安全影响采购**：优先选安全评级高的供应商\n\n📖 [查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-16.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'
echo ""
echo "飞书推送完成"

# === Bark 推送 ===
echo "正在推送到 Bark..."
TITLE=$(python3 -c "import urllib.parse; print(urllib.parse.quote('📊 AI 技术日报 2026-07-16'))")
BODY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('明日超级日：Gemini 3.5 Pro(200万token)+DeepSeek V4正式版+WAIC开幕；AI安全指数九大实验室无一及格。点击查看全文→'))")
GITHUB_URL=$(python3 -c "import urllib.parse; print(urllib.parse.quote('https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-16.md'))")

curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/${TITLE}/${BODY}?url=${GITHUB_URL}&group=AI%E6%97%A5%E6%8A%A5"
echo ""
echo "Bark 推送完成"
echo "全部推送完成！"
