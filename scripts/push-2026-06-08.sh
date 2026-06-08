#!/bin/bash
# 2026-06-08 AI 技术日报推送脚本
# 用法：在可访问外网的环境中运行 bash scripts/push-2026-06-08.sh

echo "=== 推送飞书卡片消息 ==="
curl -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
  -H 'Content-Type: application/json' \
  -d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "tag": "plain_text",
        "content": "📊 AI 技术日报 - 2026年6月8日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 一、今日要闻\n\n**1. MiniMax M3 发布：超越 GPT-5.5，价格仅 1/10**\n\nMiniMax Sparse Attention 架构实现 100 万 token 上下文下计算量降至 1/20。SWE-Bench Pro 编码基准 59.0%（GPT-5.5 为 58.6%），输出价格仅 $1.20/百万 token（GPT-5.5 为 $30.00）。即将开放权重上线 Hugging Face。\n\n**2. Google 开源 Gemma 4 12B：首个原生音频开源模型**\n\n12B 参数、256K 上下文、140+ 语言、Apache 2.0 协议。首个支持原生音频输入的开源中等模型，16GB 显存即可本地运行。无编码器统一架构直接处理图像和音频。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3. 微软发布 MAI 自研模型家族，战略脱钩 OpenAI**\n\nMAI-Thinking-1 推理旗舰：AIME 2025 得分 97.0%。MAI-Code-1-Flash 编码模型：SWE-Bench Pro 51.2%（Haiku 4.5 仅 35.2%），定价 $0.75 输入/$4.50 输出。微软 AI 模型实现\"自主可控\"。\n\n**4. NVIDIA Cosmos 3：首个物理 AI 开放前沿模型**\n\n混合 Transformer 架构，融合视觉推理+世界模拟+动作生成。Nano(8B+8B) 和 Super(32B+32B) 两个版本，已上线 Hugging Face。将机器人训练周期从月缩短至天。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**5. Anthropic 秘密提交 IPO：估值 9650 亿美元**\n\nSeries H 融资 650 亿美元。年化收入约 470 亿美元，Claude Code 单品 25 亿美元 ARR。目标 2026 年 10 月上市，IPO 估值 1.75-1.8 万亿美元，或成史上最大科技 IPO。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 二、热门开源项目 Top 3\n\n🔥 **OpenClaw** | ⭐ 250K+ | 全渠道个人 AI 助手，连接 50+ 消息平台，数据完全本地\n\n🔥 **Understand-Anything** | ⭐ 29K+（周榜#1）| 代码库交互式知识图谱，自动生成可视化架构地图\n\n🔥 **Browser Use** | ⭐ 92K+ | AI 浏览器自动化标准，让 Agent 像人一样操作网页"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 三、产品动态\n\n• **ChatGPT Dreaming V3**：史上最大记忆升级，时间感知记忆自动更新事实\n• **Zoom ZoomMate**：AI 会议同事，$20/用户/月，集成 Salesforce/Jira/ServiceNow\n• **百度文心 5.1**：预训练成本仅行业 6%，LMArena 国内第一全球第四\n• **字节豆包付费订阅**：68-500 元/月三档，月活 3.45 亿，日均 Token 超 1.2 千万亿"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 四、资本动态\n\n| 公司 | 事件 | 金额/估值 |\n|---|---|---|\n| Anthropic | IPO + Series H | 650亿美元/9650亿 |\n| Alphabet | 股权融资 | 800亿美元 |\n| Cerebras | IPO | 55.5亿/700亿 |\n| DeepSeek | 首轮融资 | 70-100亿/590亿 |\n| 月之暗面 | 新一轮 | 20亿/200亿 |\n\n2026 Q1 全球风投 3009 亿美元（历史最高），AI 占 80%。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 五、行动建议\n\n1️⃣ **立即评估 MiniMax M3**：输出成本仅 GPT-5.5 的 1/25，开源权重即将发布\n2️⃣ **部署 Gemma 4 12B 到内网**：16GB 显存本地运行多模态 AI，零 API 成本\n3️⃣ **建立模型路由层**：支持多模型切换，每月做性价比审计\n4️⃣ **Agent 产品优先投资安全能力**：权限管理是企业客户采购决策关键\n\n📖 [查看完整日报 →](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-08.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'

echo ""
echo "=== 推送 Bark 通知 ==="
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-06-08/MiniMax%20M3%20%E8%B6%85%E8%B6%8A%20GPT-5.5%20%E4%BB%B7%E6%A0%BC%E4%BB%85%201%2F10%EF%BC%8CGoogle%20%E5%BC%80%E6%BA%90%20Gemma%204%2012B%EF%BC%8C%E5%BE%AE%E8%BD%AF%E5%8F%91%E5%B8%83%E8%87%AA%E7%A0%94%20MAI%20%E6%A8%A1%E5%9E%8B%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%AE%8C%E6%95%B4%E6%97%A5%E6%8A%A5%20%E2%86%92?url=https%3A%2F%2Fgithub.com%2Fkinggao23-droid%2FAI-Daily%2Fblob%2Fmain%2F2026-06-08.md&group=AI%E6%97%A5%E6%8A%A5"

echo ""
echo "=== 推送完成 ==="
