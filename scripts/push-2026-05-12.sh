#!/bin/bash
# AI 技术日报 2026-05-12 推送脚本
# 包含飞书卡片推送和 Bark iPhone 通知

echo "=== 推送飞书卡片消息 ==="

curl -s -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
-H 'Content-Type: application/json' \
-d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "tag": "plain_text",
        "content": "📊 AI 技术日报 - 2026年5月12日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "**🔥 今日要闻**\n\n**1️⃣ OpenAI 成立 Deployment Company**\n40 亿美元打造企业 AI 部署公司，TPG 领投，19 家机构参投。收购 AI 咨询公司 Tomoro（150 名工程师）。将 AI 部署工程师派驻到客户企业，标志着 OpenAI 从\\\"卖 API\\\"转向\\\"卖解决方案+服务\\\"。\n\n**2️⃣ DeepSeek V4：1.6 万亿参数，价格仅 GPT-5.5 的 1/17**\n• V4 Pro：输入 $0.145/百万 token，输出 $1.74/百万 token\n• V4 Flash：输入 $0.14/百万 token，输出 $0.28/百万 token\n• GPT-5.5 对比：输入 $5.00，输出 $30.00/百万 token\n• 权重完全开放（Hugging Face），SWE-Bench 80.6%"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3️⃣ GPT-5.5 成为 ChatGPT 默认模型**\n• Terminal-Bench 2.0：82.7%（所有公开模型最高）\n• AIME 数学：95.2% | SWE-Bench：85.1%\n• 长上下文推理 MRCR v2：74.0%（5.4 仅 36.6%）\n• 标准定价：输入 $5/百万 token，输出 $30/百万 token\n• 105 万 token 上下文，Token 效率提升 40%\n\n**4️⃣ iOS 27 开放第三方 AI 模型**\n苹果将通过 Extensions 机制让用户在 Siri、写作工具等系统功能中选择 Claude、Gemini 或 ChatGPT。ChatGPT 从\\\"独家合作\\\"变\\\"多选一\\\"，20 亿设备用户成新战场。\n\n**5️⃣ NVIDIA AI 股权投资超 $400 亿**\nOpenAI $300 亿 | Corning $32 亿 | IREN $21 亿 | 另参投约 24 轮私募"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**🌟 热门开源项目 Top 3**\n\n| 项目 | Star 数 | 亮点 |\n|------|--------|------|\n| OpenClaw | 347K+ | 本地 AI 助手，GitHub 历史最高星 |\n| Dify | 100K+ | 一站式 LLM 应用开发平台 |\n| TradingAgents | 62.6K+ | 多 Agent 金融交易框架 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**💰 资本动态**\n\n• OpenAI Deployment Co.：$40 亿（TPG 领投）\n• Sierra Series E：$9.5 亿（估值 $150 亿+）\n• DeepSeek 首轮融资：估值 $450 亿（大基金领投）\n• Project Prometheus（Bezos）：融资 $100 亿（估值 $380 亿）\n• Profluent × Lilly：$22.5 亿合作\n• BMW i Ventures Fund III：$3 亿\n• Sereact（具身 AI）：$1.1 亿 Series B"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**💡 趋势洞察**\n\n1. **落地为王**：OpenAI 成立部署公司，AI 竞争从模型能力转向落地能力\n2. **开源逼近临界点**：DeepSeek V4 Flash 价格仅为 GPT-5.5 的 1/107\n3. **苹果重构分发**：iOS 27 Extensions 让 20 亿用户直接选 AI 模型\n4. **Agent 标准化**：从热门概念变成标准工作模式，MCP 成为事实标准"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "📖 [查看完整日报 →](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-05-12.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'

echo ""
echo "=== 飞书推送完成 ==="
echo ""

echo "=== 推送 Bark iPhone 通知 ==="

curl -s 'https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-05-12/OpenAI%E6%88%90%E7%AB%8B40%E4%BA%BF%E7%BE%8E%E5%85%83Deployment%20Company%EF%BC%8C%E6%A0%87%E5%BF%97AI%E4%BB%8E%E5%8D%96API%E8%BD%AC%E5%90%91%E5%8D%96%E8%90%BD%E5%9C%B0%E6%9C%8D%E5%8A%A1%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%AE%8C%E6%95%B4%E6%97%A5%E6%8A%A5%E2%86%92?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-05-12.md&group=AI%E6%97%A5%E6%8A%A5'

echo ""
echo "=== Bark 推送完成 ==="
echo ""
echo "全部推送完成！"
