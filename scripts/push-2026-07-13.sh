#!/bin/bash
# AI 技术日报 2026-07-13 推送脚本（飞书+Bark）
# 在本地网络环境下执行此脚本

echo "📤 正在推送 2026-07-13 AI 技术日报..."

# ===== 飞书卡片推送 =====
echo "1/2 推送到飞书..."
curl -s -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
  -H 'Content-Type: application/json' \
  -d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "tag": "plain_text",
        "content": "📊 AI 技术日报 - 2026年7月13日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "**🔥 今日要闻**\n\n**1. OpenAI 发布 GPT-Live：全双工语音 AI**\n全双工架构实现边听边说边思考，遇到复杂问题自动委派 GPT-5.5 处理。GPT-Live-1（完整版）面向付费用户，GPT-Live-1 mini 面向免费用户。API 即将开放。\n\n**2. Meta 双线出击：Muse Image + $100 亿加拿大数据中心**\nMuse Image 由 Meta Superintelligence Labs 开发，支持多图融合、精准文字渲染、Agentic 式工作流，免费嵌入 Instagram/WhatsApp/Meta AI。同时投资 $100 亿在阿尔伯塔省建 1GW 数据中心，闲置 GPU 将对外出租。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3. 人形机器人集体冲刺上市**\n一周内三家同时进军公开市场：\n• Agility Robotics：SPAC 上市，估值 $25 亿，$3 亿+预售\n• 宇树科技：科创板 IPO，预估值超 $147 亿，G1 售价 $13,500\n• Tesla Optimus：改造 Model S 产线，目标 9 月达 1,000 台/周\n\n**4. 美联储设立 AI 工作组**\nMarc Andreessen（a16z）联席领导"生产力与就业"工作组，评估 AI 对经济影响，年底提交建议。美联储首个专门针对 AI 的正式机构。\n\n**5. Google Video Remix + EU 车载 AI 监控**\nGoogle Photos 推出 Gemini Omni 驱动的视频风格转换。EU 7月7日起强制新车安装 AI 驾驶员注意力监控，每年影响 1500 万辆车。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**🌟 热门开源 Top 3**\n\n⭐ OpenClaw 382K stars — 全平台私有 AI 助手，打通 50+ 平台\n⭐ Browser Use 104K stars — AI 浏览器自动化第一，准确率 87.4%\n⭐ MiniMax M3 — 开放权重前沿模型，SWE-bench 80.5%，成本仅闭源的 6-12%"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**🔧 产品动态**\n\n• Cloudflare Agents Week：AI 代理零认证部署 Worker（60 分钟有效）\n• Anthropic + 三星：探讨合作自研 2nm AI 芯片\n• OpenAI IPO：秘密提交 S-1，目标 9 月上市，估值 $7,300-8,500 亿\n• Google Photos Video Remix：Gemini Omni 驱动，数秒完成视频风格转换\n• EU ADDW：7月7日起新车强制 AI 驾驶员分心监控"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**💰 资本格局**\n\n• H1 2026 全球创业融资 $5,100 亿（历史新高），OpenAI+Anthropic 占 43%\n• Anthropic 年化营收 ~$470 亿 vs OpenAI ~$200-250 亿\n• Meta $100 亿数据中心 | Agility $25 亿 SPAC | 宇树 ~$147 亿 IPO\n• Microsoft Frontier Company：$25 亿投资，6000 名专家"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**🎯 PM 行动建议**\n\n1. 语音 AI 布局：GPT-Live API 开放后第一时间测试全双工交互\n2. 开放模型替换：MiniMax M3/DeepSeek V4 Pro 性能逼平闭源，成本降 80-95%\n3. 机器人产业关注：宇树 G1 $13,500 已近经济型汽车价位\n4. 算力定价跟踪：不签超 6 个月 GPU 长约，价格仍在快速下降\n5. AI 合规准备：美联储工作组年底报告可能影响监管方向\n\n📎 [查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-13.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'

FEISHU_RESULT=$?
if [ $FEISHU_RESULT -eq 0 ]; then
  echo "✅ 飞书推送成功"
else
  echo "❌ 飞书推送失败 (exit code: $FEISHU_RESULT)"
fi

# ===== Bark 推送 =====
echo "2/2 推送到 Bark..."
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-07-13/OpenAI%E5%8F%91%E5%B8%83GPT-Live%E5%85%A8%E5%8F%8C%E5%B7%A5%E8%AF%AD%E9%9F%B3AI%EF%BC%8CMeta%E6%8E%A8%E5%87%BAMuse%20Image%E5%9B%BE%E5%83%8F%E7%94%9F%E6%88%90%E5%85%8D%E8%B4%B9%E4%B8%8A%E7%BA%BF%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%AE%8C%E6%95%B4%E6%97%A5%E6%8A%A5?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-13.md&group=AI%E6%97%A5%E6%8A%A5"

BARK_RESULT=$?
if [ $BARK_RESULT -eq 0 ]; then
  echo "✅ Bark 推送成功"
else
  echo "❌ Bark 推送失败 (exit code: $BARK_RESULT)"
fi

echo ""
echo "🎉 推送完成！"
