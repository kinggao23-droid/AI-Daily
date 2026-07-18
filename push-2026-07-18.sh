#!/bin/bash
# AI 日报推送脚本 - 2026-07-18
# 在本地执行此脚本以推送到飞书和 Bark

# 推送到飞书
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
        "content": "📊 AI 技术日报 - 2026年7月18日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 🔥 今日要闻\n\n**1. Gemini 3.5 Pro 三度跳票**\nGoogle DeepMind 原定 7/17 发布的 Gemini 3.5 Pro 再次延期，模型仍未通过可靠性标准（频繁幻觉、基准落后 GPT-5.6）。泄露定价：输入 $15/M、输出 $60/M tokens，200 万上下文窗口。截至今日无官方模型卡或 API 文档。\n\n**2. 台积电 Q2 利润暴增 77%**\n净利润 ~$220 亿（+77%），营收 $402 亿（+34%）。全年资本支出上调至 $600-640 亿，亚利桑那追加 $1000 亿投资。AI 芯片需求持续井喷。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3. Kimi K3 发布：2.8T 参数最大开源模型**\nMoE 架构（激活 16/896 专家），综合排名 #4（80.96/100），前端代码 Arena #1。定价 $3/$15（仅 Fable 5 的 1/3）。开放权重 7 月 27 日前发布。\n\n**4. DeepSeek V4 即将正式上线**\n7/24 旧版 API 全面退役。V4-Pro $0.435/$0.87，V4-Flash $0.14/$0.28。新增高峰时段 2× 定价。缓存命中价低至 $0.0028/M。\n\n**5. ChatGPT Work 全面推送**\nAI 从聊天助手进化为工作代理，独立完成文档/表格/PPT/Web 应用。GPT-5.6 Sol 代理任务 token 效率 +54%。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 🌟 热门开源 Top 3\n\n| 项目 | Star 数 | 一句话简介 |\n|------|---------|----------|\n| OpenClaw | 350.6K | 全平台自托管个人 AI 助手（GitHub 历史最高 Star） |\n| Dify | 147K | 可视化 LLM 应用搭建平台（v1.8 新增多模态知识库） |\n| Open WebUI | 124K | 自托管 ChatGPT 风格界面（2.82 亿下载） |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 💰 资本动态\n\n| 公司 | 轮次 | 金额 | 领域 |\n|------|------|------|------|\n| Helsing | E 轮 | $18 亿 | AI 国防（欧洲最大 VC 轮） |\n| Fireworks AI | D 轮 | $15 亿 | AI 推理平台 |\n| AIsphere | C 轮 | $4.39 亿 | AI 视频（阿里领投） |\n| Chai Discovery | C 轮 | $4 亿 | AI 药物研发 |\n| Harvey AI | C 轮 | $2 亿 | AI 法律 |\n\n2026 H1 全球创业融资 $5100 亿，OpenAI+Anthropic 占 43%。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 🎯 PM 行动建议\n\n1. **代理式 AI 时代到来**：审视产品中哪些功能可从「AI 辅助」升级为「AI 自主完成+人工审核」\n2. **开源模型性价比碾压**：Kimi K3 权重开放后做私有化部署 POC，中文场景优先\n3. **算力成本优化**：混合架构（关键任务用 Sol，常规用 V4-Flash）+ 缓存策略降本\n4. **EU AI Act 8/2 收紧**：盘点高风险分类、建立模型使用日志"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "📄 [查看完整日报 →](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-18.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'
echo ""

# 推送到 Bark
echo "正在推送到 Bark..."
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-07-18/Gemini%203.5%20Pro%20%E4%B8%89%E5%BA%A6%E8%B7%B3%E7%A5%A8%EF%BC%8CKimi%20K3%20%E5%8F%91%E5%B8%83%202.8T%20%E5%8F%82%E6%95%B0%E6%9C%80%E5%A4%A7%E5%BC%80%E6%BA%90%E6%A8%A1%E5%9E%8B%EF%BC%8C%E5%8F%B0%E7%A7%AF%E7%94%B5%20Q2%20%E5%88%A9%E6%B6%A6%E6%9A%B4%E5%A2%9E%2077%25%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%85%A8%E6%96%87%20%E2%86%92?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-18.md&group=AI%E6%97%A5%E6%8A%A5"
echo ""
echo "推送完成！"
