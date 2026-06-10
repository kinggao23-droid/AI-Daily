#!/bin/bash
# 推送 2026-06-10 AI 技术日报到飞书和 Bark

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
        "content": "📊 AI 技术日报 - 2026年6月10日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 📰 今日要闻\n\n**1. OpenAI 秘密提交 IPO 申请，目标估值 8500 亿美元**\nOpenAI 于 5 月 22 日向 SEC 秘密提交 S-1 招股书，高盛/摩根士丹利/摩根大通承销。目标 2026 年 9 月上市，估值 7300-8500 亿美元。当前年化收入约 250 亿美元，但预计 2026 年亏损 140 亿美元。\n\n**2. 中国启动 2 万亿元 AI 基建计划**\n国家发改委牵头，未来 5 年投资约 2950 亿美元建设全国算力网络。要求核心技术 80% 国产化，NVIDIA/AMD 被排除。含私企投资总额可达 5 万亿元。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3. Anthropic 年化收入突破 300 亿美元**\n80 倍增长（从 2024.1 的 8700 万到 2026.4 的 300 亿美元）。Claude Code 年化收入 25 亿美元，超 1000 家企业年消费超 100 万美元。正筹备 10 月 IPO。\n\n**4. Google Gemma 4 开源：12B 模型可在笔记本运行多模态任务**\nApache 2.0 协议。12B Unified 模型原生处理图像+音频+视频，仅需 16GB VRAM。Codeforces ELO 从 110 跃升至 2150。\n\n**5. NVIDIA Nemotron 3 Nano Omni：30B 参数仅激活 3B**\n混合专家架构，多模态推理吞吐量比同类快 9 倍，视频处理效率高 9.2 倍。256K 上下文，开源可用。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 🔥 热门开源 Top 3\n\n| 项目 | Star | 亮点 |\n|------|------|------|\n| OpenClaw | 375K+ | 本地 AI 助手平台，GitHub 历史最高 Star |\n| Dify | 138K+ | 可视化 AI 应用开发，拖拽搭建 Agent |\n| Headroom | 新兴 | LLM Token 压缩 60-95%，大幅降低成本 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 💰 资本动态\n\n| 公司 | 事件 | 金额/估值 |\n|------|------|----------|\n| OpenAI | IPO 申请 | 估值 7300-8500 亿美元 |\n| Anthropic | 筹备 IPO | 估值 3800 亿美元 |\n| Thinking Machines Lab | Series B | 20 亿美元 / 100 亿估值 |\n| Glean | Series F | 1.5 亿美元 / 72 亿估值 |\n| Rhoda AI | Series A | 4.5 亿美元 / 17 亿估值 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 💡 行动建议\n\n1. **模型成本审计**：简单任务用 Gemini 3.5 Flash（$1.5/M token），复杂任务用 GPT-5.5 或 Claude Opus\n2. **多模型路由**：用 Dify/LangChain 按任务类型自动选择最优模型\n3. **关注本地化 AI**：Gemma 4 12B 可在笔记本运行多模态任务，离线 AI 产品成为可能\n4. **Agent 先内后外**：先用 Claude Code 优化团队效率，再向外拓展 Agent 场景"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "📎 [查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-10.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'

echo ""
echo "飞书推送完成"

# === Bark 推送 ===
curl -s 'https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-06-10/OpenAI%20%E7%A7%98%E5%AF%86%E6%8F%90%E4%BA%A4IPO%E7%9B%AE%E6%A0%87%E4%BC%B0%E5%80%BC8500%E4%BA%BF%E7%BE%8E%E5%85%83%EF%BC%8C%E4%B8%AD%E5%9B%BD%E5%90%AF%E5%8A%A82%E4%B8%87%E4%BA%BF%E5%85%83AI%E5%9F%BA%E5%BB%BA%E8%AE%A1%E5%88%92%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%AE%8C%E6%95%B4%E6%97%A5%E6%8A%A5%E2%86%92?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-10.md&group=AI%E6%97%A5%E6%8A%A5'

echo ""
echo "Bark 推送完成"
