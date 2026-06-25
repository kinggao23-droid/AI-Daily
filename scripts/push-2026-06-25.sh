#!/bin/bash
# AI 技术日报 2026-06-25 推送脚本（飞书 + Bark）

# === 飞书卡片推送 ===
curl -s -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
  -H 'Content-Type: application/json' \
  -d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "tag": "plain_text",
        "content": "📊 AI 技术日报 - 2026年6月25日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 一、今日要闻\n\n**1️⃣ Google 遭遇"人才地震"**\nTransformer 之父 Noam Shazeer（6/18）离开 Google 加入 OpenAI，AlphaFold 之父 John Jumper（6/20）离开 DeepMind 加入 Anthropic。Alphabet 股价单日最高跌 7.2%，市值蒸发超 2450 亿美元。Google 2024 年花 27 亿美元从 Character.AI 挖回 Shazeer，仅两年后再度流失。\n\n**2️⃣ SpaceX × Reflection AI 签 63 亿美元算力大单**\nReflection AI（估值 250 亿美元）将从 7 月起每月付 SpaceX 1.5 亿美元，使用 Colossus 2 数据中心 NVIDIA GB300 芯片，合同期至 2029 年。SpaceX 近两月累计签约算力合同超 800 亿美元，成为第四大云计算势力。"
      },
      {
        "tag": "markdown",
        "content": "**3️⃣ OpenAI 发布 GPT-5.5-Cyber 网络安全专用模型**\nCyberGym 跑分 85.6%（历史最高），ExploitGym 39.5%，SEC-bench Pro 69.8%。仅对 Cisco、CrowdStrike、Cloudflare 等认证安全机构开放。GPT-5.5 标准版 API：输入 $5/输出 $30 每百万 token。\n\n**4️⃣ Claude Fable 5 免费体验结束，正式付费**\n首个 Mythos 级模型，SWE-Bench Pro ~80%。定价：输入 $10 / 输出 $50（每百万 token），是 Opus 4.8 的 2 倍。网络安全/生物化学类查询自动路由至 Opus 4.8。\n\n**5️⃣ Coralogix 获 2 亿美元 F 轮**\n估值 16 亿美元，Advent 和加拿大养老金 CPPIB 领投。押注 AI Agent 可观测性赛道，年收入增长 60%+，30 家百万美元级客户。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 二、热门开源项目 Top 3\n\n🔥 **OpenClaw** — 347K ⭐（GitHub 历史第一）\n自托管 AI 助手，支持微信/飞书/Slack 等 50+ 平台，4000+ 社区技能插件。数据不经外部服务器。\n[GitHub](https://github.com/openclaw/openclaw)\n\n🔥 **Langflow** — 146K ⭐\nPython 生态可视化 AI Agent 编排工具，深度 LangChain 集成，可视化+代码双模式。\n[GitHub](https://github.com/langflow-ai/langflow)\n\n🔥 **Dify** — 138K ⭐\n可视化 AI Agent 工作流搭建平台，100 万+应用已部署，18 万+活跃开发者。\n[GitHub](https://github.com/langgenius/dify)"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 三、主流大模型 API 定价速查\n\n| 模型 | 输入 $/M token | 输出 $/M token |\n|------|--------------|---------------|\n| Claude Fable 5 | $10.00 | $50.00 |\n| Claude Opus 4.8 | $5.00 | $25.00 |\n| GPT-5.5 | $5.00 | $30.00 |\n| Claude Sonnet 4.6 | $3.00 | $15.00 |\n| Gemini 3 Pro | $2.00 | $12.00 |\n| Gemini 3.5 Flash | $1.50 | $9.00 |\n| Claude Haiku 4.5 | $0.80 | $4.00 |\n| Gemini 3 Flash | $0.50 | $3.00 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 四、资本动态\n\n| 公司 | 事件 | 金额/估值 |\n|------|------|----------|\n| Reflection AI | 新一轮融资 | 估值 250 亿美元 |\n| Reflection AI | SpaceX 算力租赁 | 63 亿美元合同 |\n| SpaceX | 算力平台累计签约 | 800 亿美元+ |\n| Meta × AMD | 芯片采购协议 | 最高 1000 亿美元 |\n| Anthropic | 年化收入 | 300 亿美元 run rate |\n| Coralogix | F 轮融资 | 2 亿美元，估值 16 亿 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 五、产品经理行动建议\n\n📌 **多模型路由策略** — 模型价差达 100 倍，按场景选模型可大幅降本\n📌 **AI Agent 监控** — Agent 可观测性是合规刚需，v1 就要内建\n📌 **缓存降本** — Gemini 缓存仅 $0.15/M token，RAG 场景可降 70-90% 成本\n📌 **关注自托管方案** — OpenClaw 347K Stars 说明企业隐私部署需求巨大\n📌 **安全AI走向专用模型** — GPT-5.5-Cyber 的限制访问模式值得参考\n\n📖 [查看完整日报 →](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-25.md)"
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
echo "飞书推送完成"
echo ""

# === Bark 推送 ===
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-06-25/Google%E4%BA%BA%E6%89%8D%E5%9C%B0%E9%9C%87%EF%BC%9ATransformer%E4%B9%8B%E7%88%B6%E5%8E%BBOpenAI%E3%80%81AlphaFold%E4%B9%8B%E7%88%B6%E5%8E%BBAnthropic%EF%BC%8C%E8%82%A1%E4%BB%B7%E6%9A%B4%E8%B7%8C7.2%25%E3%80%82SpaceX%E7%AD%BE63%E4%BA%BF%E7%BE%8E%E5%85%83AI%E7%AE%97%E5%8A%9B%E5%A4%A7%E5%8D%95%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%85%A8%E6%96%87%E2%86%92?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-25.md&group=AI%E6%97%A5%E6%8A%A5"

echo ""
echo "Bark 推送完成"
