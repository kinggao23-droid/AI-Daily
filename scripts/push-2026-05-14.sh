#!/bin/bash
# 2026-05-14 AI 日报推送脚本（飞书 + Bark）

echo "=== 推送飞书卡片消息 ==="
curl -s -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
-H 'Content-Type: application/json' \
-d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "content": "📊 AI 技术日报 - 2026年5月14日",
        "tag": "plain_text"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "**🔥 今日要闻**\n\n**1. Google TurboQuant 登场 ICLR 2026**\n3-bit KV Cache 压缩，推理内存直降 **6倍**，H100 注意力加速 **8倍**，无需训练或微调。企业部署 LLM 硬件门槛大幅降低。\n[Google Research Blog](https://research.google/blog/turboquant-redefining-ai-efficiency-with-extreme-compression/)\n\n**2. Google 发布 Gemma 4 开源模型**\n31B 参数 MMLU Pro **85.2%**，Apache 2.0 可商用。MoE 版本 26B 总参/4B 激活，性价比极高。\n[Google Blog](https://blog.google/innovation-and-ai/technology/developers-tools/gemma-4/)\n\n**3. Gartner：50% 企业将流失 AI 人才**\n88% 员工同时使用个人 AI 工具处理工作，仅 27% 高管有全面 AI 战略。\n[Gartner](https://www.gartner.com/en/newsroom/press-releases/2026-05-13-gartner-predicts-by-2027-50-percent-of-enterprises-without-a-people-centric-ai-strategy-will-lose-their-top-ai-talent)"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**4. Novo Nordisk × OpenAI 战略合作**\n全球最大药企从药物发现到供应链全面 AI 化，年底前完成全面整合。\n[CNBC](https://www.cnbc.com/2026/04/14/novo-nordisk-openai-ai-drug-discovery-healthcare-nvo.html)\n\n**5. Gemini 3.1 Pro 全面上线**\nARC-AGI-2 得分 **77.1%**，GPQA **94.3%**，100万 Token 上下文，输入 $2.00/M（GPT-5.5 的 40%）。\n[Google Blog](https://blog.google/innovation-and-ai/models-and-research/gemini-models/gemini-3-1-pro/)"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**⭐ 热门开源项目 Top 3**\n\n🥇 **OpenClaw** — 355K⭐ GitHub 史上最多 Star，本地 AI 助手支持 20+ 渠道\n🥈 **DeepSeek-TUI** — 24K⭐ 终端编程 Agent，单周增长 22K Star\n🥉 **HF ml-intern** — 6.3K⭐ 自动化 ML 工程师，读论文→训模型全自动"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**💰 资本动态**\n\n| 公司 | 金额 | 估值 |\n|---|---|---|\n| Anthropic | Google $400亿 + Amazon $50亿 | $3,500亿 |\n| Sierra | $9.5亿 | $150亿+ |\n| 月之暗面 | ~$20亿 | $200亿+ |\n\n**并购**: Cohere 合并 Aleph Alpha（$200亿）| Roche 收购 PathAI（$10.5亿）| OpenAI 收购 Tomoro"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**💡 API 价格速览（每百万 Token）**\n\n| 模型 | 输入 | 输出 |\n|---|---|---|\n| GPT-5.5 | $5.00 | $30.00 |\n| Claude Opus 4.7 | $5.00 | $25.00 |\n| Gemini 3.1 Pro | $2.00 | $12.00 |\n| DeepSeek V4 Pro | $0.14 | $0.28 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**🎯 趋势洞察**\n1. 推理效率革命降低部署门槛（TurboQuant 6× 压缩）\n2. 开源模型逼近闭源性能（Gemma 4 MMLU Pro 85.2%）\n3. AI 人才争夺核心是\"赋能\"不是\"高薪\"（88% 员工偷用个人AI）\n4. 医药行业成 AI 落地下一爆发点（Novo Nordisk + Roche PathAI）\n\n📖 [查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-05-14.md)"
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

echo "=== 推送 Bark 通知 ==="
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-05-14/Google%20TurboQuant%20%E5%8F%91%E5%B8%83%EF%BC%9A3-bit%20KV%20Cache%20%E5%8E%8B%E7%BC%A9%E6%8E%A8%E7%90%86%E5%86%85%E5%AD%98%E7%9B%B4%E9%99%8D6%E5%80%8D%EF%BC%8CGemma%204%20%E5%BC%80%E6%BA%90%E6%A8%A1%E5%9E%8B%E5%8F%91%E5%B8%83%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%85%A8%E6%96%87%E2%86%92?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-05-14.md&group=AI%E6%97%A5%E6%8A%A5"
echo ""

echo "=== 推送完成 ==="
