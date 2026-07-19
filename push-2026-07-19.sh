#!/bin/bash
# AI 日报推送脚本 - 2026-07-19
# 在本地运行此脚本推送到飞书和 Bark

# 飞书卡片消息推送
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
        "content": "📊 AI 技术日报 - 2026年7月19日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 今日要闻\n\n**1. PrismML Bonsai 27B：270亿参数模型压缩到3.9GB在手机运行**\n- 基于Qwen3.6 27B，1-bit量化，iPhone 17 Pro 11 tokens/秒\n- 支持多模态、工具调用、262K上下文，精度保留90%\n\n**2. NVIDIA Nemotron 3 Embed：开源嵌入模型RTEB排行榜第一**\n- 8B版RTEB得分78.5%，开源可商用\n- 适用于RAG、Agent记忆、代码检索"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3. OpenAI GPT-5.6 Sol/Terra/Luna 三级定价发布**\n- Sol $5/$30 | Terra $2.50/$15 | Luna $1/$6（每百万token）\n- 100万token上下文，可编程工具调用\n\n**4. Together AI $8亿C轮，估值$83亿**\n- 沙特阿美领投，年化预订$11.5亿\n\n**5. 台积电Q2利润+77%，AI芯片占收入66%**"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 热门开源 Top 3\n\n🦞 **OpenClaw** 375K⭐ 本地AI代理操控电脑\n🔗 **Langflow** 149K⭐ 拖拽式Agent构建器\n💬 **Open WebUI** 124K⭐ 自托管AI对话平台"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## PM行动建议\n1. 评估端侧AI：27B模型已能手机运行\n2. 替换付费嵌入API：Nemotron开源免费效果第一\n3. 实现模型路由：按复杂度选模型降本50-70%\n4. 评估开源方案：Together AI让部署≈API调用\n\n📄 [完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-19.md)\n💡 长按收藏 | 搜索关键词查历史日报"
      }
    ]
  }
}'

echo ""

# Bark 推送（iPhone 通知）
echo "正在推送到 Bark..."
curl -s 'https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-07-19/PrismML%20Bonsai%2027B%20%E9%A6%96%E6%AC%A1%E5%AE%9E%E7%8E%B0270%E4%BA%BF%E5%8F%82%E6%95%B0%E6%A8%A1%E5%9E%8B%E5%9C%A8%E6%89%8B%E6%9C%BA%E8%BF%90%E8%A1%8C%EF%BC%8C%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%85%A8%E6%96%87?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-19.md&group=AI%E6%97%A5%E6%8A%A5'

echo ""
echo "推送完成！"
