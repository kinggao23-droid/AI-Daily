#!/bin/bash
# 2026-05-15 AI 日报推送脚本（飞书 + Bark）

echo "=== 推送飞书卡片消息 ==="
curl -s -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
-H 'Content-Type: application/json' \
-d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "content": "📊 AI 技术日报 - 2026年5月15日",
        "tag": "plain_text"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "**🔥 今日要闻**\n\n**1. Cerebras 登陆纳斯达克：2026 年最大科技 IPO**\nAI 芯片公司 Cerebras（CBRS）IPO 定价 $185/股，首日开盘 $385（涨108%），收盘 $311，市值约 $660 亿。募资 $55 亿，认购超 20 倍。其晶圆级芯片 WSE-3 面积为 NVIDIA H200 的 56 倍，可在单芯片上运行完整大模型。\n\n**2. 中美 AI 峰会：H200 出口解禁 + AI 安全框架**\n特朗普访问北京，美方批准阿里、腾讯、字节等 10 家企业购买 H200 芯片（每家上限 75,000 块），但尚未实际发货。两国将启动 AI 安全协议谈判。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3. SubQ：首个非 Transformer LLM，1200 万 Token 上下文**\n迈阿密公司 Subquadratic 获 $2900 万种子轮，发布亚二次注意力架构 LLM，100 万 Token 场景下成本和速度优于主流模型 50 倍。\n\n**4. Sierra 完成 $9.5 亿 E 轮，估值 $158 亿**\n企业 AI Agent 平台，Tiger Global 和 GV 领投。ARR 超 $1.5 亿，发布 Ghostwriter（用自然语言创建 Agent）。\n\n**5. GPT-5.5 Instant 成为 ChatGPT 默认模型**\n高风险领域幻觉率降低 52.5%，新增跨对话记忆检索。API 定价：输入 $5/百万 Token，输出 $30/百万 Token。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**📦 热门开源项目 Top 3**\n\n| 项目 | ⭐ Star 数 | 定位 |\n|------|-----------|------|\n| OpenClaw | 369K | 个人 AI 助手框架 |\n| Dify | 139K | LLM 应用开发平台 |\n| Open WebUI | 128K | 自托管 AI 界面 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**💰 资本动态**\n\n• Cerebras IPO 募资 $55 亿，市值 $660 亿\n• Sierra E 轮 $9.5 亿，估值 $158 亿\n• SubQ 种子轮 $2900 万\n• Project Prometheus (Bezos) 已融 $62 亿\n• Q1 2026 全球风投总额破 $3000 亿，AI 占 33%"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**💡 API 价格速览（每百万 Token）**\n\n| 模型 | 输入 | 输出 |\n|------|------|------|\n| GPT-5.5 | $5.00 | $30.00 |\n| Claude Opus 4.7 | $5.00 | $25.00 |\n| DeepSeek V4 Pro | $0.145 | $1.74 |\n| Kimi K2.6 | $0.74 | $3.50 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**🎯 行动建议**\n1. 用 DeepSeek V4 Pro / Kimi K2.6 做 A/B 测试，非关键任务迁移至开源模型可降低成本 70%+\n2. 评估多 Agent 编排场景（审批流、多源数据汇总），选择支持 MCP 协议的框架\n3. 重新审视因\"上下文不够\"搁置的需求（合同审查、代码库分析）\n4. 算力采购策略纳入 Cerebras / 国产替代方案评估\n\n📎 [查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-05-15.md)"
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
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-05-15/Cerebras%20%E7%99%BB%E9%99%86%E7%BA%B3%E6%96%AF%E8%BE%BE%E5%85%8B%EF%BC%8C%E5%8B%9F%E8%B5%8455%E4%BA%BF%E7%BE%8E%E5%85%83%E9%A6%96%E6%97%A5%E6%B6%A8108%25%EF%BC%8C%E4%B8%AD%E7%BE%8EAI%E5%B3%B0%E4%BC%9A%E5%90%AF%E5%8A%A8H200%E8%8A%AF%E7%89%87%E5%87%BA%E5%8F%A3%E8%A7%A3%E7%A6%81%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%85%A8%E6%96%87%E2%86%92?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-05-15.md&group=AI%E6%97%A5%E6%8A%A5"
echo ""

echo "=== 推送完成 ==="
