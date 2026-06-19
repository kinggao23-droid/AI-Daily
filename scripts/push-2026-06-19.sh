#!/bin/bash
# AI 技术日报 2026-06-19 推送脚本
# 飞书 + Bark 推送

# 飞书卡片推送
curl -s -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
  -H 'Content-Type: application/json' \
  -d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "tag": "plain_text",
        "content": "📊 AI 技术日报 - 2026年6月19日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 一、今日要闻\n\n**1. xAI Grok 4.3 登陆 Amazon Bedrock**\n6月18日，Grok 4.3 正式在 AWS Bedrock 上线。输入价格 $1.25/M tokens，输出 $2.50/M tokens——仅为 GPT-5.5 的 8%。在 Omniscience 基准和 Tau2 工具调用基准中排名第一，幻觉率行业最低。支持可配置推理深度（low/medium/high），按需调节精度与成本。\n\n**2. OpenAI GPT-5.5 Instant 医疗能力超越医生**\n6月18日，OpenAI 宣布 GPT-5.5 Instant 在医生盲评中，健康回答的准确性、完整性和沟通质量首次全面超越医生。错误健康陈述率下降 71%。每周 2.3 亿人使用 ChatGPT 咨询健康问题。"
      },
      {
        "tag": "markdown",
        "content": "**3. Google Gemini CLI 正式退役，Antigravity CLI 接班**\n6月18日，Gemini CLI 停止服务。新工具 Antigravity CLI（命令 `agy`）基于 Go 编写，闭源，支持多 Agent 协作架构。个人免费用户需立即迁移。\n\n**4. Anthropic CEO 呼吁强制第三方安全测试**\nDario Amodei 发表政策长文，主张前沿模型须经独立第三方测试。同时美国政府已限制 Fable 5/Mythos 5 向外国用户开放，这是首次针对特定 AI 模型的出口级限制。\n\n**5. Gemma 4 12B：6.6GB 显存跑赢上代 27B 模型**\nGoogle 开源的 Gemma 4 12B，MMLU Pro 77.2%（上代 27B 仅 67.6%），Apache 2.0 协议可商用，一张消费级显卡即可运行。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 二、热门开源项目 Top 3\n\n| 项目 | Star 数 | 一句话介绍 |\n|------|---------|----------|\n| Langflow | 147K+ | 拖拽式 AI Agent 构建平台，1.9 版支持 AI 自动生成组件 |\n| Ollama | 172K+ | 一条命令本地跑大模型，月下载量 5200 万 |\n| llama.cpp | 100K+ | C++ 高性能推理引擎，让 AI 跑在没有 GPU 的设备上 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 三、前沿模型价格速查\n\n| 模型 | 输入$/M | 输出$/M | 最强项 |\n|------|--------|--------|-------|\n| Fable 5 | 10.00 | 50.00 | 编程 SWE-Bench 80.3% |\n| GPT-5.5 | 5.00 | 30.00 | Terminal-Bench 82.7% |\n| Opus 4.8 | 5.00 | 25.00 | 数学 USAMO 96.7% |\n| Gemini 3.5 Flash | 1.50 | 9.00 | 速度 280 tok/s |\n| Grok 4.3 | 1.25 | 2.50 | 低幻觉 行业第一 |\n| MiniMax M3 | 0.60 | 2.40 | 开源性价比之王 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 四、资本动态\n\n| 事件 | 金额 | 估值 |\n|------|------|------|\n| SpaceX 收购 Cursor | 600亿$ | — |\n| Anduril Series H | 50亿$ | 610亿$ |\n| Anthropic 融资 | 650亿$ | 9650亿$ |\n| Meta-AMD 芯片协议 | 最高1000亿$ | — |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 五、行动建议\n\n1. **模型路由省钱**：简单任务走 Grok 4.3（$2.5/M），复杂任务走旗舰模型，可降低 API 支出 50-80%\n2. **AI 医疗窗口期**：GPT-5.5 Instant 医疗能力过线，健康类产品可评估接入\n3. **Gemini CLI 迁移**：已过截止日，需立即切换到 Antigravity CLI\n4. **供应链安全**：Fable 5 出口管制事件提醒——务必接入 2+ 模型供应商\n5. **本地 AI 产品**：Gemma 4 12B + Ollama = 零成本本地 AI，考虑增加离线模式"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "[📄 查看完整日报 →](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-19.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'

echo ""
echo "---"

# Bark 推送
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-06-19/Grok%204.3%20%E7%99%BB%E9%99%86%20AWS%20Bedrock%EF%BC%8C%E8%BE%93%E5%87%BA%E4%BB%B7%E4%BB%85%E4%B8%BA%20GPT-5.5%20%E7%9A%84%208%25%EF%BC%9BGPT-5.5%20Instant%20%E5%8C%BB%E7%96%97%E5%9B%9E%E7%AD%94%E9%A6%96%E6%AC%A1%E8%B6%85%E8%B6%8A%E5%8C%BB%E7%94%9F%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%85%A8%E6%96%87%E2%86%92?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-19.md&group=AI%E6%97%A5%E6%8A%A5"

echo ""
echo "推送完成"
