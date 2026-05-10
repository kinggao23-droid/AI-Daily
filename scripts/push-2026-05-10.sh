#!/bin/bash
# 2026-05-10 AI 技术日报推送脚本
# 用法: bash scripts/push-2026-05-10.sh

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
        "content": "📊 AI 技术日报 - 2026年5月10日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 一、今日要闻\n\n**1. Apple 宣布 iOS 27 将开放第三方 AI 模型**\nApple 将通过 \\"Extensions\\" 系统允许用户选择第三方 AI 模型驱动 Siri、Writing Tools 等系统功能。Google Gemini 和 Anthropic Claude 已在测试中，预计 2026 秋季随 iOS 27 发布。\n- 15 亿活跃设备的 Apple 生态开放，AI 竞争从\\"参数之争\\"进入\\"分发渠道之争\\"\n- 产品经理需开始规划多模型适配架构\n\n**2. NVIDIA 发布 Nemotron 3 Nano Omni**\n30B 总参数仅激活 3B（MoE 架构），在视频/音频/图像/文本四种模态统一推理：\n- 吞吐量比同级开源模型提高 **9 倍**\n- 文档智能：6 个榜单排名第一\n- 视频处理成本：每小时仅 **$14.27**\n- 硬件需求：4-bit 量化仅需 25GB RAM"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3. Cloudflare 开源 Unweight —— LLM 无损压缩 22%**\n将模型权重缩小 15%–22%，输出与原始模型比特级一致。在 GPU 共享内存中完成解压直接送入 Tensor Core，无需主存往返。GPU 内核已开源。\n\n**4. Mistral 发布 Medium 3.5**\n128B 参数开源权重模型，SWE-bench 77.6%。API 价格仅 $1.50/$7.50（输入/输出），约为 Claude Opus 4.7 的 30%。\n\n**API 价格速查（每百万 token）**\n| 模型 | 输入 | 输出 |\n|---|---|---|\n| Claude Opus 4.7 | $5.00 | $25.00 |\n| GPT-5.5 | $5.00 | $30.00 |\n| Gemini 3.1 Pro | $2.00 | $12.00 |\n| Mistral Medium 3.5 | $1.50 | $7.50 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 二、热门开源项目 Top 3\n\n🥇 **OpenClaw** — 本地 AI 助手 | ⭐ 250K+ | 支持语音对话+本地模型推理\n🥈 **TradingAgents** — 多 Agent 金融交易框架 | ⭐ 62K+ | 7 种角色 Agent 模拟交易公司\n🥉 **Open WebUI** — 自托管 AI 平台 | ⭐ 135K+ | 企业内网\\"自己的 ChatGPT\\""
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 三、资本与行业格局\n\n| 公司 | 金额 | 估值 | 方向 |\n|---|---|---|---|\n| Sierra | $9.5 亿 | $158 亿 | AI 客户体验代理 |\n| Parallel | $2.3 亿 | $20 亿 | AI Agent 搜索基础设施 |\n| Sereact | $1.1 亿 | — | 机器人 AI |\n\n**Cohere + Aleph Alpha 合并**：估值 $200 亿，打造跨大西洋\\"主权 AI\\"联盟，获加拿大和德国政府背书。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 四、趋势洞察\n\n1️⃣ **AI 分发权之争**：Apple 开放生态，模型竞争从\\"谁最强\\"转向\\"谁体验最好\\"\n2️⃣ **MoE + 本地部署**：30B 参数只需激活 3B，消费级硬件也能跑大模型\n3️⃣ **推理成本持续下降**：Unweight 无损压缩 + Flex 模式半价 + Mistral 性价比路线\n4️⃣ **主权 AI 实体化**：Cohere-Aleph Alpha 合并获政府背书，合规成为新竞争维度\n\n📖 [查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-05-10.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'

echo ""
echo ""
echo "=== 推送 Bark 通知 ==="

curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-05-10/Apple%20%E5%AE%A3%E5%B8%83%20iOS%2027%20%E5%BC%80%E6%94%BE%E7%AC%AC%E4%B8%89%E6%96%B9%20AI%20%E6%A8%A1%E5%9E%8B%EF%BC%8CAI%20%E5%88%86%E5%8F%91%E6%9D%83%E4%B9%8B%E4%BA%89%E6%AD%A3%E5%BC%8F%E6%89%93%E5%93%8D%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%AE%8C%E6%95%B4%E6%97%A5%E6%8A%A5%E2%86%92?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-05-10.md&group=AI%E6%97%A5%E6%8A%A5"

echo ""
echo ""
echo "=== 推送完成 ==="
