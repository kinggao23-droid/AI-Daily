#!/bin/bash
# AI 技术日报 2026-07-04 推送脚本（飞书+Bark）
# 在本地网络环境下执行此脚本

echo "📤 正在推送 2026-07-04 AI 技术日报..."

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
        "content": "📊 AI 技术日报 - 2026年7月4日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "**🔥 今日要闻**\n\n**1. 微软投入 25 亿美元成立 Frontier Company**\n6,000 名工程师以\"前置部署\"模式嵌入客户企业，帮助 AI 落地。首批客户：联合利华、诺和诺德。MIT 研究发现 95% 的企业 AI 试点对损益无可衡量影响。\n\n**2. OpenAI 提议向美国政府出让 5% 股权**\n按 8,520 亿美元估值，价值约 426 亿美元。Sam Altman 推动建立\"公共财富基金\"。背景：GPT-5.6 因国安审查被延迟发布。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3. 联合国成立首个 AI 治理委员会**\n成员包括黄仁勋、Andy Jassy、Brad Smith、Jack Clark。7月8日日内瓦首次会议。\n\n**4. Venice AI 成为隐私优先 AI 首个独角兽**\n6,500 万美元 A 轮，估值 10 亿美元。350 万用户，月处理 1.3 万亿 token，从不记录用户提示。\n\n**5. AI 落地服务成新战场**\n两周内微软（25 亿）、AWS（10 亿）、OpenAI、Anthropic 累计超 40 亿美元组建 AI 实施部队。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**🌟 热门开源 Top 3**\n- OpenClaw 375K⭐ 本地 AI 助手框架\n- opencode 180K⭐ 终端 AI 编程助手（Cursor 开源替代）\n- browser-use 90K⭐ AI 浏览器自动化框架"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**💰 模型价格速览（$/百万 token 输入/输出）**\n- Fable 5: $10/$50 SWE-Pro 80.3%\n- Opus 4.8: $5/$25 SWE-Pro 69.2%\n- Sonnet 5 促销: $2/$10 SWE-Pro 63.2%\n- GPT-5.5: $5/$30 SWE-Pro 58.6%\n- GLM-5.2: $0.95/$3 SWE-Pro 62.1%"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**📈 资本动态**\n- Anthropic 估值 9,650 亿美元，已秘密提交 IPO\n- OpenAI 估值 8,520 亿美元，拟出让 5% 政府股权\n- Venice AI: 6,500 万 A 轮，10 亿美元估值\n- 8090 Solutions: 1.35 亿 A 轮，Salesforce 领投"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**🎯 PM 行动建议**\n1. AI 从模型竞赛转向落地执行——强化产品实施支持\n2. 隐私优先 AI 走向主流——评估零日志功能可行性\n3. 全球 AI 治理加速——预留模型切换能力，关注 7/8 日内瓦会议\n4. 开源编程工具崛起——评估 opencode 替代 Cursor\n\n[📖 查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-04.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
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
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-07-04/%E5%BE%AE%E8%BD%AF%E6%8A%95%E5%85%A525%E4%BA%BF%E7%BE%8E%E5%85%83%E6%88%90%E7%AB%8BFrontier%20Company%EF%BC%8C6000%E5%90%8D%E5%B7%A5%E7%A8%8B%E5%B8%88%E5%B8%AE%E4%BC%81%E4%B8%9AAI%E8%90%BD%E5%9C%B0%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%AE%8C%E6%95%B4%E6%97%A5%E6%8A%A5?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-04.md&group=AI%E6%97%A5%E6%8A%A5"

BARK_RESULT=$?
if [ $BARK_RESULT -eq 0 ]; then
  echo "✅ Bark 推送成功"
else
  echo "❌ Bark 推送失败 (exit code: $BARK_RESULT)"
fi

echo ""
echo "🎉 推送完成！"
