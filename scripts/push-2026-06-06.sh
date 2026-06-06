#!/bin/bash
# AI 技术日报 2026-06-06 推送脚本
# 在本地执行此脚本即可推送飞书卡片和 Bark 通知

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
        "content": "📊 AI 技术日报 - 2026年6月6日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "**一、今日要闻**\n\n**1. Anthropic 秘密提交 IPO 申请，估值 $9650 亿**\nAnthropic 向 SEC 提交 S-1 上市申请，估值达 $9650 亿，首次超越 OpenAI（$8520 亿）。Series H 融资 $650 亿，年化收入约 $470 亿。同时呼吁建立 AI 协调暂停机制——其代码库 80%+ 由 Claude 编写。\n\n**2. MiniMax M3：首个开源前沿模型，成本仅 GPT-5.5 的 5-10%**\n中国 AI 公司 MiniMax 发布 M3，SWE-Bench Pro 59.0% 超越 GPT-5.5（56.2%）。API 促销价仅 $0.30/$1.20（输入/输出每百万 token），而 GPT-5.5 为 $5/$30。核心技术 MSA 架构使长上下文计算量降至 1/20。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3. ChatGPT \"Dreaming V3\" 记忆升级 + GPT-5.6 传闻**\nOpenAI 发布最大记忆架构升级，事实回忆准确率从 41.5% 提升至 82.8%，成本降低 5 倍。GPT-5.6 出现在 Codex 后端日志，Polymarket 给出 80-89% 概率在 6 月底前发布。ChatGPT 广告已在英国上线。\n\n**4. DeepSeek V4-Pro 永久降价 75%**\n输入 $0.435/百万 token vs GPT-5 的 $10——差距 23 倍。首个针对华为昇腾优化的产品线，标志中国 AI 脱离 NVIDIA 依赖。\n\n**5. 微软 Build 2026：MAI-Code-1-Flash + Scout 智能体**\n微软发布 7 个自研模型（不依赖 OpenAI）。MAI-Code-1-Flash 137 亿参数编码模型，输入仅 $0.75/百万 token。Scout 为首个\"始终在线\"个人 AI 智能体，跨 M365 自动执行任务。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**二、热门开源项目 Top 3**\n\n🥇 **OpenClaw** — 本地 AI 助手 | ⭐ 355,000+ | GitHub 历史最高 Star 项目\n数据完全本地处理，支持 50+ 平台（微信/飞书/Slack 等），隐私优先\n\n🥈 **Hermes Agent** — 自进化 Agent 框架 | ⭐ 183,906 | 今日 +1,845\n闭环学习系统：完成任务后自动生成可复用\"技能\"，越用越聪明\n\n🥉 **Headroom** — LLM 输入压缩 | ⭐ 14,937 | 今日 +2,473（增长最快）\n压缩输入 token 60-95%，直接降低 API 成本"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**三、资本动态**\n\n| 公司 | 金额 | 估值 | 领域 |\n|---|---|---|---|\n| Anthropic | $650亿 | $9650亿 | AI基础模型 |\n| Supabase | $5亿 | $105亿 | 开发者基础设施 |\n| Flourish | $5亿 | $25亿 | 类脑AI |\n| Suno | $4亿 | $54亿 | AI音乐 |\n| Generalist AI | $4亿 | $20亿 | 机器人 |\n\n2026 Q1 全球风投 $3009 亿，AI 占 80%（$2420 亿）。AI 独角兽总数达 308 家。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**四、产品经理行动建议**\n\n🔴 **本周必做**：评估 Claude 6/15 计费变更影响；测试 MiniMax M3 超低成本模型\n🟡 **本月关注**：建立多模型成本矩阵（API 价格差距 23 倍）；探索 Headroom 等 token 压缩工具\n🟢 **中期布局**：准备迎接 GPT-5.6；关注 NVIDIA RTX Spark 本地部署趋势；跟踪美/欧 AI 监管合规要求"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "📄 [点击查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-06.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'
echo ""

echo "=== 推送 Bark 通知 ==="
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/$(python3 -c "import urllib.parse; print(urllib.parse.quote('📊 AI 技术日报 2026-06-06'))")/$(python3 -c "import urllib.parse; print(urllib.parse.quote('Anthropic 以 \$9650 亿估值秘密提交 IPO，超越 OpenAI 成全球最贵 AI 公司。点击查看完整日报 →'))")?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-06.md&group=AI%E6%97%A5%E6%8A%A5"
echo ""

echo "=== 推送完成 ==="
