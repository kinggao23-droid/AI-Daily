#!/bin/bash
# 飞书推送 + Bark 推送脚本 - 2026-07-03
# 在本地环境（非受限网络）中运行此脚本即可推送

# === 飞书卡片推送 ===
echo "📤 推送飞书卡片..."
curl -s -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
  -H 'Content-Type: application/json' \
  -d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "tag": "plain_text",
        "content": "📊 AI 技术日报 - 2026年7月3日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 今日要闻\n\n**1. Meta 进军云计算：推出 Meta Compute 出售 AI 剩余算力**\n2026 年资本开支预算高达 1450 亿美元。Meta 股价上涨 8.8%。\n\n**2. Together AI 完成 8 亿美元 C 轮，估值 83 亿美元**\nAramco Ventures 领投。开源模型云需求三倍增长。\n\n**3. 智谱 GLM-5.2 编码击败 GPT-5.5，价格仅 1/6**\nSWE-bench Pro: 62.1% vs 58.6%。输入 $0.95/M vs $5.00/M。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**4. Claude Sonnet 5 发布：Agent 超越 Opus 4.8**\nTerminal-Bench 80.4% 超 Opus 74.6%，促销价 $2/$10 至 8 月底。\n\n**5. OpenAI Jalapeno 芯片发布，GPT-5.6 被政府延迟**\n与 Broadcom 合作 9 个月完成流片。GPT-5.6 成首个被政府推迟的前沿模型。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 热门开源 Top 3\n\n- **OpenClaw** 355K Stars - 本地 AI 助手框架\n- **Dify** 138K Stars - AI Agent 工作流平台\n- **Open WebUI** 124K Stars - 自托管 AI 对话界面"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 资本动态\n\n- Together AI C 轮 8 亿美元 估值 83 亿\n- Qualcomm 收购 Modular 39.2 亿美元\n- Blackstone 日本 AI 数据中心 300 亿美元\n- SpaceX/xAI 算力年化收入 260 亿美元"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 行动建议\n\n1. 算力多元化：Meta Compute 入场，建立多供应商策略\n2. 试点开源：GLM-5.2 价格仅 GPT-5.5 的 1/6\n3. 抓 Sonnet 5 促销：$2/$10 测试 Agent 场景\n4. 防范模型供应风险：产品需支持模型降级"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "[查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-03.md)\n\n长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'
echo ""

# === Bark 推送 ===
echo "📱 推送 Bark 通知..."
curl -s -G 'https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-07-03/Meta%E8%BF%9B%E5%86%9B%E4%BA%91%E8%AE%A1%E7%AE%97%EF%BC%8CTogether%20AI%E8%9E%8D%E8%B5%848%E4%BA%BF%E7%BE%8E%E5%85%83%EF%BC%8CGLM-5.2%E7%BC%96%E7%A0%81%E5%87%BB%E8%B4%A5GPT-5.5%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%AE%8C%E6%95%B4%E6%97%A5%E6%8A%A5%E2%86%92' \
  --data-urlencode 'url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-03.md' \
  --data-urlencode 'group=AI日报'
echo ""
echo "✅ 推送完成"
