#!/bin/bash
# AI 日报推送脚本 - 2026-07-21
# 推送到飞书 Webhook 和 Bark

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
        "content": "📊 AI 技术日报 - 2026年7月21日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 今日要闻\n\n**1️⃣ Kimi K3 发布：2.8 万亿参数全球最大开源模型，火爆到暂停新用户订阅**\n月之暗面 7/16 发布 Kimi K3，2.8T 参数 MoE（896 专家激活 16 个），100 万 token 上下文，原生视觉。前端代码竞技场 1679 分（超 Fable 5 和 GPT-5.6 Sol），Terminal-Bench 88.3%。API 定价 $3/$15/M tokens。发布 48 小时算力爆满，7/20 暂停新用户订阅。权重 7/27 开源。\n\n**2️⃣ GPT-5.6 Sol/Terra/Luna 三档模型全面上线**\n7/9 正式 GA。Sol（旗舰）$5/$30，Terminal-Bench 88.8%（新 SOTA），BrowseComp 92.2%；Terra（均衡）$2.50/$15，性能≈GPT-5.5 价格减半；Luna（轻量）$1/$6。新增 Ultra 多智能体和缓存断点功能。"
      },
      {
        "tag": "markdown",
        "content": "**3️⃣ Google 搜索 25 年最大变革：AI 答案取代蓝链成默认结果**\n7/10 起所有搜索默认由 Gemini 3.5 Flash 生成 AI 答案，覆盖 200 国 98 种语言。传统蓝链降至折叠区以下。用户可在设置中恢复传统模式。\n\n**4️⃣ 欧盟强制 Google 开放 Android 给 AI 竞品**\n7/16 两项 DMA 裁决：2027/7 前开放 11 项 Android 功能给 ChatGPT/Claude 等竞品，2027/1 前共享匿名搜索数据。同日法院维持 €41 亿反垄断罚款。\n\n**5️⃣ TSMC 追加 $1000 亿亚利桑那投资**\n总计 $2650 亿，美国史上最大外资直接投资。2nm 制程，2026 资本开支上调至 $600-640 亿。"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "## 热门开源 Top 3\n\n🔥 **Graphify** ⭐92.3K（3 个月冲到近 10 万星）代码知识图谱，让 AI 编程助手精准理解大型代码库\n🔥 **Vibe-Trading** ⭐25.7K 自然语言驱动的 AI 量化交易框架（港大开发）\n🔥 **OpenWiki** ⭐3K+ LangChain 团队出品，自动生成 AI 友好的代码文档"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "## 产品与资本\n\n• ChatGPT 桌面端大改版 | Claude Memory 改版 + Fable 5 定价分层\n• Google 搜索全面 AI 化 | Kimi K3 暂停新订阅\n• Databricks 战略轮 $30 亿+（估值 $1880 亿）\n• Helsing E 轮 $18 亿（估值 $180 亿）| Together AI C 轮 $8 亿\n• 快手可灵 AI $30 亿 | SAP €10 亿+ 收购 Prior Labs"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "## 趋势洞察\n\n1️⃣ **开源模型进入 3T 参数时代**：Kimi K3（2.8T）编程超 Fable 5/Sol，7/27 完全开源\n2️⃣ **Google 搜索 AI 化重塑流量格局**：SEO → AIO 范式转移，蓝链时代终结\n3️⃣ **Agent 基础设施成新热点**：Graphify（92K⭐）等项目增速远超模型类项目\n4️⃣ **算力长期乐观短期紧张**：TSMC $2650 亿扩产 vs Kimi K3 暂停订阅"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "📎 [查看完整日报 →](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-21.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'

echo ""
echo "=== 推送 Bark 通知 ==="
ENCODED_TITLE=$(python3 -c "import urllib.parse; print(urllib.parse.quote('📊 AI 技术日报 2026-07-21'))")
ENCODED_BODY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('Kimi K3发布2.8万亿参数全球最大开源模型火爆暂停订阅，GPT-5.6三档上线，Google搜索25年最大变革。点击查看全文。'))")
ENCODED_URL=$(python3 -c "import urllib.parse; print(urllib.parse.quote('https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-21.md'))")

curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/${ENCODED_TITLE}/${ENCODED_BODY}?url=${ENCODED_URL}&group=AI%E6%97%A5%E6%8A%A5"

echo ""
echo "=== 推送完成 ==="
