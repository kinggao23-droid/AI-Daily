#!/bin/bash
# AI 日报推送脚本 - 2026-07-20
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
        "content": "📊 AI 技术日报 - 2026年7月20日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 今日要闻\n\n**1️⃣ WAIC 2026 上海闭幕：300+ 全球首发，29 国成立 AI 联盟**\n展览面积 10 万+ 平方米、1,100+ 家企业、3,000+ 件展品。重点首发：华为 Atlas 950 芯片、MiniMax M3 多模态模型、StepStar STEPX Neo（全球首款 Agent 原生操作系统手机）。中国联合 29 国成立\"世界人工智能合作组织\"（WAICO）。\n\n**2️⃣ DeepSeek V4 正式发布：首创峰谷定价，估值 $710 亿筹备 IPO**\nV4-Pro：1.6T 总参、490 亿激活参数、100 万 token 上下文。首创 AI API 峰谷定价——高峰时段（9-12/14-18 点）价格翻倍，其余时段半价。SWE-bench Verified 得分 80.6%。成本仅为 Claude Opus 4.8 的 1/28.7。据彭博社报道正筹备 A 股 IPO。"
      },
      {
        "tag": "markdown",
        "content": "**3️⃣ 中国开源模型首次包揽全球排行榜前六**\nArtificial Analysis 开源智能指数排行榜前六全部是中国模型。GLM-5.2（744B MoE、MIT 协议）以 51 分断层领先。Meta Llama 和 OpenAI 开源线已 11+ 个月未更新。\n\n**4️⃣ 中国 AI 拟人化交互管理办法正式生效**\n五部门联合发布的管理办法 7/15 生效。豆包、通义千问下架自定义 AI 人设功能。同期政策：对国产开源 AI 平台提供税收优惠和研发补贴。\n\n**5️⃣ Gemini 3.5 Pro 延期 + DeepMind 4 位核心研究员离职**\n编程和推理测试未达标再次推迟。一周内 Noam Shazeer（Gemini 联合负责人）转投 OpenAI、诺贝尔奖得主 John Jumper 转投 Anthropic。Alphabet 市值蒸发约 $2,250 亿。"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "## 热门开源 Top 3\n\n🔥 **Strix** ⭐39.4K（周增万星）AI 自主渗透测试\n🔥 **OpenMontage** ⭐29.3K 首个开源 AI 视频制作系统\n🔥 **Hallmark** ⭐11.2K 反 AI 审美同质化设计技能"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "## 产品与资本\n\n• 腾讯混元 Hy-3 开源 | xAI Grok 4.5 发布\n• Apple Intelligence 获批入华 | MS 自研模型替换 OpenAI\n• DeepSeek 估值 $710 亿 | Fireworks AI D 轮 $15 亿\n• SK Hynix 美股 IPO $265 亿 | SpaceX $600 亿收购 Cursor"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "## 趋势洞察\n\n1️⃣ **AI API 进入分时计价时代**：DeepSeek 首创峰谷定价，异步任务错峰执行可省 50%\n2️⃣ **开源模型主导权转移至中国**：排行榜前六全是中国模型，MIT/Apache 2.0 协议\n3️⃣ **Agent 原生 OS 出现**：MCP 成事实标准，Google/OpenAI/Anthropic 全支持\n4️⃣ **AI 监管差异化**：中国限人设 + 补贴开源，Gemini 3.5 延期 + DeepMind 人才流失"
      },
      {"tag": "hr"},
      {
        "tag": "markdown",
        "content": "📎 [查看完整日报 →](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-20.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'

echo ""
echo "=== 推送 Bark 通知 ==="
ENCODED_TITLE=$(python3 -c "import urllib.parse; print(urllib.parse.quote('📊 AI 技术日报 2026-07-20'))")
ENCODED_BODY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('WAIC闭幕300+首发产品，DeepSeek V4首创峰谷定价估值710亿，中国开源模型包揽全球前六。点击查看全文。'))")
ENCODED_URL=$(python3 -c "import urllib.parse; print(urllib.parse.quote('https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-20.md'))")

curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/${ENCODED_TITLE}/${ENCODED_BODY}?url=${ENCODED_URL}&group=AI%E6%97%A5%E6%8A%A5"

echo ""
echo "=== 推送完成 ==="
