#!/bin/bash
# 2026-07-25 AI 日报推送脚本（飞书 + Bark）
# 在本地网络环境下运行此脚本完成推送

# 飞书卡片推送
echo "正在推送到飞书..."
curl -s -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
  -H 'Content-Type: application/json' \
  -d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "tag": "plain_text",
        "content": "📊 AI 技术日报 - 2026年7月25日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "**一、今日要闻**\n\n**1️⃣ Stripe 拟 100 亿美元收购 OpenRouter**\n支付巨头 Stripe 正洽谈收购 AI 模型路由平台 OpenRouter（接入 70+ 供应商的 400+ 个 LLM），估值从 5 月的 13 亿美元飙升至 100 亿美元。OpenRouter 年化收入 5000 万美元。这将是支付行业与 AI 基础设施的首次大规模交叉。\n\n**2️⃣ AMD 发布 Instinct MI455X**\n3200 亿晶体管、台积电 2nm、432GB HBM4、23.3 TB/s 带宽、40.26 PFLOPS（MXFP4）。相比上代 MI355X：显存 1.5x、带宽 2.9x、算力 4x。Helios 机架平台单 pod 72 颗 GPU 达 2.9 exaflops。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3️⃣ Meta 推出 Seller App**\nLlama 驱动的免费 iOS 应用，拍一张商品照片即可自动生成标题、描述、价格、品类标签和物流标签。AI 自动回复买家消息。多模态 AI 落地消费级场景的典型案例。\n\n**4️⃣ Perplexity Brain：AI 搜索长出长期记忆**\n跨会话记忆系统，为用户构建私有上下文图谱。重复任务准确率 +25%、召回率 +16%、成本 -13%。Max 和 Enterprise Max 用户可用。\n\n**5️⃣ 月之暗面冲击 500 亿美元估值**\nKimi K3（2.8T 参数）发布后启动 Pre-IPO，ARR 达 3 亿美元（70%+ B2B API），高盛 + 中金担任顾问，6 个月内赴港上市。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**二、热门开源项目 Top 3**\n\n🔥 **Strix** — AI 自主渗透测试（41K ⭐）\n多 Agent 协作安全测试，提供可复现 PoC\n\n🔥 **Browser Use** — AI 浏览器自动化（97K ⭐）\nLLM 驱动真实浏览器，Y Combinator 支持\n\n🔥 **Orca ADE** — 并行 AI 编码调度（12.5K ⭐）\n同时调度 20+ AI 编码 Agent 并行工作"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**三、资本动态**\n\n| 事件 | 金额 |\n|---|---|\n| Stripe / OpenRouter 收购洽谈 | ~$100 亿 |\n| 月之暗面 Pre-IPO 目标估值 | $500 亿 |\n| AIsphere (PixVerse) C 轮 | $4.39 亿 |\n| Chai Discovery C 轮 | $4 亿 |\n| Nebius 收购 Eigen AI | $6.43 亿 |\n| SAP 收购 Dremio + Prior Labs | €10 亿+ |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**四、趋势洞察**\n\n📌 AI 基础设施进入巨头并购整合期\n📌 开源模型千亿参数百家争鸣\n📌 AI 硬件军备竞赛白热化（AMD vs NVIDIA）\n📌 Microsoft 开始用自研模型替换 OpenAI/Anthropic\n\n👉 [查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-25.md)"
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

# Bark 推送
echo "正在推送到 Bark..."
TITLE=$(python3 -c "import urllib.parse; print(urllib.parse.quote('📊 AI 技术日报 2026-07-25'))")
BODY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('Stripe拟100亿美元收购OpenRouter，AMD发布MI455X（432GB HBM4），Meta推出Llama卖货助手。点击查看全文→'))")
URL=$(python3 -c "import urllib.parse; print(urllib.parse.quote('https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-25.md'))")
GROUP=$(python3 -c "import urllib.parse; print(urllib.parse.quote('AI日报'))")

curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/${TITLE}/${BODY}?url=${URL}&group=${GROUP}"
echo ""

echo "推送完成！"
