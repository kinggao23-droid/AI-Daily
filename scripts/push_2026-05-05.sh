#!/bin/bash
# 2026-05-05 日报推送脚本 - 飞书 + Bark
# 在本地环境执行此脚本即可推送

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
        "content": "📊 AI 技术日报 - 2026年5月5日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 一、今日要闻\n\n**1. Google 签署五角大楼 AI 机密合同**\nGoogle 允许 Gemini 模型部署于美军机密网络，可用于"任何合法政府目的"。600+ 名 DeepMind/Cloud 员工联名抗议，但管理层未退让。同期 Microsoft、Amazon、NVIDIA、OpenAI 等 8 家公司签署类似协议。Anthropic 因拒绝"任何合法用途"条款被排除。\n\n**2. DeepSeek V4 Pro 75% 折扣延至 5/31**\n折扣期 V4-Pro：输入 $0.435/M，输出 $0.87/M。V4 Flash 更极端：输入 $0.14/M，输出 $0.28/M。对比 GPT-5.5 的 $5/$30，输出价格仅为其 2.9%。缓存命中价降至 $0.036/M。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3. GPT-5.5 正式发布**\nOpenAI 4/23 发布代号 Spud，API 定价 $5/$30 per M tokens（较 GPT-5.4 翻倍）。GDPval 84.9%，OSWorld 78.7%，Tau2-bench 98.0%。已上线 Amazon Bedrock。\n\n**4. Claude Mythos Preview：AI 自主发现零日漏洞**\nAnthropic 发现所有主流 OS/浏览器中的零日漏洞，自主利用 FreeBSD 17 年远程代码执行漏洞。出于安全考虑不公开发布，启动 Project Glasswing 防御计划。\n\n**5. Ineffable Intelligence 获 $11 亿种子轮**\nDeepMind 前强化学习负责人 David Silver 创立，红杉/光速领投，估值 $51 亿，创欧洲 AI 种子轮纪录。目标：构建不依赖人类数据的"超级学习者"。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 二、热门开源项目 Top 3\n\n🦞 **OpenClaw** — 368K Stars\n本地运行的全能 AI 助手网关，连接 50+ 平台。v2026.5.2 集成 Codex 长任务执行和 Grok 4.3。\n\n🧬 **Hermes Agent** — 133K Stars\n会"自我进化"的 AI 智能体，自动提取技能、永久记忆，越用越聪明。\n\n⚡ **n8n** — 187K Stars\nAI 增强的开源工作流自动化平台，400+ 预建集成，拖拽构建 AI 管道。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 三、资本与行业格局\n\n| 事件 | 金额 |\n|------|------|\n| OpenAI 融资（已完成） | $1,220 亿，估值 $8,520 亿 |\n| Anthropic 筹划新轮 | $400-500 亿，目标估值 $9,000 亿 |\n| SpaceX 获 Cursor 收购权 | $600 亿期权 |\n| Cerebras 纳斯达克 IPO（5/14） | 目标募资 $35 亿 |\n| Sierra E 轮 | $9.5 亿，估值 $158 亿 |\n| Meta 裁员 8,000 人 | AI 资本支出上调至 $1,450 亿 |\n\n2026 Q1 全球风投 $3,000 亿创纪录，AI 占 80%。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 四、趋势洞察\n\n📌 **AI 定价剪刀差扩大**：GPT-5.5 涨至 $5/$30，DeepSeek V4 Flash 仅 $0.14/$0.28，差距达 100 倍。建议构建智能路由，按任务复杂度自动选模型。\n\n📌 **AI 安全升级为能力竞赛**：Mythos 可自主发现零日漏洞，28.3% CVE 在 24 小时内被利用。AI 安全审计将成企业刚需。\n\n📌 **本地优先成开源主旋律**：OpenClaw/Ollama/n8n 不绑单一模型、本地运行。"模型无关性"是平台架构方向。\n\n📌 **自进化 Agent 是下一个范式**：Hermes Agent 验证"越用越聪明"的市场需求，持久记忆+技能自提取+跨会话连续性是核心。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "📖 [查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-05-05.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'
echo ""

echo "=== 推送 Bark 通知 ==="
TITLE=$(python3 -c "import urllib.parse; print(urllib.parse.quote('📊 AI 技术日报 2026-05-05'))")
BODY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('Google签署五角大楼AI机密合同，DeepSeek V4 Pro折扣延至5/31定价仅为GPT-5.5的3%，点击查看完整日报'))")
CLICK_URL=$(python3 -c "import urllib.parse; print(urllib.parse.quote('https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-05-05.md'))")
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/${TITLE}/${BODY}?url=${CLICK_URL}&group=AI%E6%97%A5%E6%8A%A5"
echo ""

echo "=== 推送完成 ==="
