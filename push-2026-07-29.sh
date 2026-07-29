#!/bin/bash
# 2026-07-29 AI 日报推送脚本（飞书 + Bark）
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
        "content": "📊 AI 技术日报 - 2026年7月29日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "**一、今日要闻**\n\n**1️⃣ Claude Opus 5 发布：登顶智能排行榜**\nAnthropic 发布 Claude Opus 5，Intelligence Index 61分登顶第一（170个模型），超越 Fable 5（60分）。定价 $5/$25 per M token，仅为 Fable 5（$10/$50）的一半但性能更强。Frontier-Bench 得分超 Opus 4.8 两倍，ARC-AGI 3 得分是第二名三倍。\n\n**2️⃣ Moonshot 开源 Kimi K3：全球最大开源LLM**\n7月27日正式发布开源权重，2.7万亿参数MoE架构，每次激活1040亿参数。MXFP4权重约1.4TB。日销售额飙升6倍+，正以$500亿估值融资并计划港股IPO。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3️⃣ Nvidia 成立开放安全AI联盟（OSAA）**\n37家公司加入，含Microsoft、IBM、SpaceX、CrowdStrike、Hugging Face。开源NOOA安全框架。OpenAI、Google、Anthropic三大闭源厂商缺席。Microsoft贡献MDASH多模型扫描工具。\n\n**4️⃣ EU AI Act 8月2日生效**\n透明度和高风险系统条款即将生效。AI生成内容须标注为\"AI生成\"，深度伪造需明确标识，高风险场景（招聘、信贷、执法）须风险评估和人工审核。监管机构可要求访问模型细节并召回不合规系统。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**二、热门开源项目 Top 3**\n\n🥇 **OpenClaw** — 355K+ Stars，史上增长最快开源项目，个人AI助手框架，60天超越React十年Star数\n🥈 **Browser Use** — 97K+ Stars，AI浏览器自动化框架，让AI像人一样操作浏览器\n🥉 **Poolside Laguna** — 开源编程MoE模型家族(3B~225B参数)，最小可单GPU运行"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**三、LLM API 价格速览（$/百万token）**\n\n| 模型 | 输入 | 输出 |\n|---|---|---|\n| Claude Opus 5 | $5.00 | $25.00 |\n| Claude Fable 5 | $10.00 | $50.00 |\n| GPT-5.6 Sol | $5.00 | $30.00 |\n| GPT-5.6 Terra | $2.50 | $15.00 |\n| GPT-5.6 Luna | $1.00 | $6.00 |\n| Grok 4.5 | $2.00 | $6.00 |\n| Gemini 3.6 Flash | $1.50 | $7.50 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**四、重大融资**\n\n| 公司 | 金额 | 方向 |\n|---|---|---|\n| Atoms(Kalanick) | $17亿 | 物理AI/机器人 |\n| cusp.ai | $4.5亿 | AI材料发现 |\n| AIsphere | $4.39亿 | AI视频 |\n| Rhoda AI | $4.5亿 | 机器人智能 |\n| Etched | $3亿 | AI推理芯片($103亿估值) |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**五、趋势洞察**\n\n1. **价格与性能脱钩** — Opus 5半价超Fable 5，\"更便宜=更聪明\"成新常态\n2. **开源逼近闭源** — K3(2.7T)、Laguna、Qwen 3.8降低私有部署门槛\n3. **AI安全成准入门槛** — Agent逃逸+OSAA联盟+EU AI Act三重催化\n4. **物理AI爆发** — 本周机器人领域融资超$24亿\n\n📄 [查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-29.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'

echo ""

# Bark 推送
echo "正在推送到 Bark..."
TITLE=$(python3 -c "import urllib.parse; print(urllib.parse.quote('📊 AI 技术日报 2026-07-29'))")
CONTENT=$(python3 -c "import urllib.parse; print(urllib.parse.quote('Claude Opus 5 登顶Intelligence Index第一(61分)，$5/$25仅为Fable 5一半价格但性能更强。点击查看完整日报。'))")
GITHUB_URL="https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-29.md"

curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/${TITLE}/${CONTENT}?url=${GITHUB_URL}&group=AI日报"

echo ""
echo "推送完成！"
