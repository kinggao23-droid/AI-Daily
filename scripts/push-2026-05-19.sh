#!/bin/bash
# 2026-05-19 日报推送脚本
# 在本地终端执行此脚本完成飞书和 Bark 推送

echo "=== 推送飞书卡片 ==="
curl -s -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
-H 'Content-Type: application/json' \
-d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "tag": "plain_text",
        "content": "📊 AI 技术日报 - 2026年5月19日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 一、今日要闻\n\n**1. Google I/O 2026 今日开幕**\n今日北京时间凌晨 1 点，Google I/O 2026 正式开幕。核心看点：Gemini 重大版本更新（预计 Gemini 3.5 或 4.0）、Gemini Omni 统一生成模型（单一管线同时生成文本/图像/视频）、Android XR 眼镜首次公开预览。\n\n**2. Anthropic 谈判融资 $300 亿，估值超 $9000 亿**\nAnthropic 正洽谈一轮 $300 亿融资，投后估值超 $9000 亿，将超越 OpenAI（$8520 亿）成全球最贵 AI 公司。投资方：Greenoaks、Sequoia、Altimeter、Dragoneer。2026 Q1 ARR 超 $440 亿，1000+ 客户年消费超 $100 万。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3. Recursive Superintelligence 走出隐身：$6.5 亿融资**\n伦敦初创公司完成 $6.5 亿融资（估值 $46.5 亿），NVIDIA 和 AMD 参投。核心方向：让 AI 自我分析、自我改进，无需人工干预。CEO 为前 Salesforce 首席科学家 Richard Socher。\n\n**4. DeepSeek V4 Pro：编码能力登顶，价格仅 GPT-5.5 的 1/11**\n1.6 万亿参数 MoE 模型，LiveCodeBench 93.5 分（最高），SWE-bench 80.6%。API 定价：输入 $0.435/百万 token，输出 $0.870/百万 token，MIT 开源。\n\n**5. NVIDIA Nemotron 3 Nano Omni：30B 参数多模态模型**\n仅激活 3B 参数，25GB 即可运行。音频/视频/图像/文本单一模型处理。视频吞吐量 9 倍于同类，GUI Agent 准确率从 11.1→47.4 分。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 二、热门开源项目 Top 3\n\n| 项目 | Star 数 | 定位 |\n|------|---------|------|\n| OpenClaw | 347K+ | 本地运行的个人 AI 助手，20+ 平台接入 |\n| Dify | 138K+ | 开源 LLM 应用开发平台，一站式 Agent 构建 |\n| Open WebUI | 124K+ | 自托管 AI 对话界面，2.82 亿+下载 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 三、API 价格对比（每百万 token）\n\n| 模型 | 输入 | 输出 |\n|------|------|------|\n| DeepSeek V4 Flash | $0.14 | $0.28 |\n| DeepSeek V4 Pro | $0.435 | $0.870 |\n| Claude Opus 4.7 | $5.00 | $25.00 |\n| GPT-5.5 Instant | $5.00 | $30.00 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 四、资本动态\n\n| 公司 | 金额 | 估值 |\n|------|------|------|\n| Anthropic | $300 亿（洽谈中） | $9000 亿+ |\n| Sierra | $9.5 亿 | $150 亿 |\n| Recursive | $6.5 亿 | $46.5 亿 |\n| BMW AI Fund | $3 亿 | 汽车 AI 专项 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 五、行动建议\n\n1. **超长上下文替代 RAG**：100 万 token 上下文已商用化，评估哪些 RAG 场景可改为「全文灌入」\n2. **模型价格战红利**：DeepSeek V4 编码登顶但价格仅 GPT-5.5 的 1/34，纳入选型\n3. **多模态原生统一**：关注 Gemini Omni 和 Nemotron 3 Nano Omni 的统一多模态能力\n4. **Agent Builder 趋势**：Sierra Ghostwriter 的「Agent 造 Agent」模式值得借鉴"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "📖 [查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-05-19.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'
echo ""

echo "=== 推送 Bark 通知 ==="
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-05-19/Google%20I%2FO%20%E4%BB%8A%E6%97%A5%E5%BC%80%E5%B9%95%EF%BC%8CAnthropic%20%E4%BC%B0%E5%80%BC%E8%B6%85%249000%E4%BA%BF%E7%99%BB%E9%A1%B6%20AI%20%E5%85%AC%E5%8F%B8%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%AE%8C%E6%95%B4%E6%97%A5%E6%8A%A5%E2%86%92?url=https%3A%2F%2Fgithub.com%2Fkinggao23-droid%2FAI-Daily%2Fblob%2Fmain%2F2026-05-19.md&group=AI%E6%97%A5%E6%8A%A5"
echo ""

echo "=== 推送完成 ==="
