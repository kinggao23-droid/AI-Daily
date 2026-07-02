#!/bin/bash
# AI 技术日报推送脚本 - 2026-07-02
# 用法：在本地执行 bash scripts/push-2026-07-02.sh

echo "📊 推送 AI 技术日报 2026-07-02..."

# === 飞书卡片推送 ===
echo "🔔 推送到飞书..."
curl -s -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
  -H 'Content-Type: application/json' \
  -d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "tag": "plain_text",
        "content": "📊 AI 技术日报 - 2026年7月2日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 🔥 今日要闻\n\n**1. Claude Fable 5 全球恢复上线**\n出口管制解除，SWE-bench Pro 80.3%（目前公开可用模型最高）重返战场。API 定价 $10/$50/M token，批处理半价 $5/$25。新增安全分类器阻止 >99% 的漏洞利用请求。\n\n**2. Anthropic 发布 Claude Science 科研工作台**\n集成 60+ 科学数据库（基因组学、蛋白质组学、结构生物学等），Forbes 评价"花 $26 画完研究领域图谱"。支持最多 50 个项目、每个 $30K 资助。\n\n**3. SpaceX 以 $600 亿收购 Cursor**\nAI 编码工具最大并购案。Cursor 年化收入 $10 亿+，收购倍数 60x。AI 编码工具进入大厂整合时代。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**4. OpenAI 推出 Flex Processing 半价 API**\n同步 API 50% 折扣，GPT-5.5 从 $5/$30 降至 $2.50/$15。与 Claude Sonnet 5 限时价 $2/$10 直接竞争。\n\n**5. GitHub Copilot 用量计费引发反弹**\n转向 token 用量计费后，用户月费最高暴涨 60 倍（$70→$4,200）。Agent 编码模式是 token 消耗大户。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 🌟 热门开源 Top 3\n\n| 项目 | Star | 亮点 |\n|------|------|------|\n| OpenClaw | 347K ⭐ | GitHub 史上最高 Star，本地全平台 AI 助手 |\n| Superpowers | 225K ⭐ | 让 AI 编码 Agent 遵守工程纪律 |\n| vLLM | 70.5K ⭐ | 高吞吐 LLM 推理引擎，比 Ollama 快 9x |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 💰 API 价格速览（7月2日）\n\n| 模型 | 输入/输出 (/M token) | 特点 |\n|------|---------------------|------|\n| DeepSeek V4-Flash | $0.14/$0.28 | 最便宜 |\n| GPT-5.6 Luna(Flex) | $0.50/$3.00 | OpenAI 最低价 |\n| Gemini 3.5 Flash | $1.50/$9.00 | 速度最快 |\n| Sonnet 5 限时 | $2.00/$10.00 | Agent 最强中端 |\n| GPT-5.5(Flex) | $2.50/$15.00 | 旗舰半价 |\n| Fable 5 批处理 | $5.00/$25.00 | 编码最强 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 📈 资本动态\n\n- **Anthropic** S-1 秘密递交，目标估值 $9,650亿+，年化收入 $470亿\n- **SpaceX 收购 Cursor** $600亿（股票），AI编码最大并购\n- **Shield AI** Series G $20亿，估值 $127亿（↑140%）\n- **2026 Q1 全球 AI 融资** $2,555亿，超过2025全年"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 💡 行动建议\n\n1. **Fable 5 批处理**是当前性价比最高的编码方案——Opus 4.8 的价格，高 11% 的编码性能\n2. **审计团队 AI 工具 token 用量**，防止 Copilot 式计费惊喜\n3. **Flex Processing** 可让 OpenAI API 成本直降 50%\n4. **垂直 AI 工作台**是新赛道——找你行业的"$26 画完领域图谱"机会\n\n📖 [查看完整日报 →](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-02.md)"
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

# === Bark 推送（iPhone 通知） ===
echo "📱 推送到 Bark..."
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-07-02/Claude%20Fable%205%20%E5%85%A8%E7%90%83%E6%81%A2%E5%A4%8D%E4%B8%8A%E7%BA%BF%EF%BC%8CSWE-bench%20Pro%2080.3%25%20%E9%87%8D%E8%BF%94%E6%88%98%E5%9C%BA%E3%80%82SpaceX%20%24600%E4%BA%BF%E6%94%B6%E8%B4%AD Cursor%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%AE%8C%E6%95%B4%E6%97%A5%E6%8A%A5%E2%86%92?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-02.md&group=AI%E6%97%A5%E6%8A%A5"

echo ""
echo "✅ 推送完成！"
