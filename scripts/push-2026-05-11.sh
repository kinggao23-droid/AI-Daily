#!/bin/bash
# 2026-05-11 AI 技术日报推送脚本（飞书 + Bark）

# === 飞书卡片推送 ===
echo "🚀 推送飞书卡片消息..."
curl -s -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
-H 'Content-Type: application/json' \
-d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "tag": "plain_text",
        "content": "📊 AI 技术日报 - 2026年5月11日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 一、今日要闻\n\n**1. OpenAI 发布三款实时语音模型**\nRealtime API 正式 GA，三款模型覆盖对话、翻译、转写：\n- GPT-Realtime-2：$32/$64 per M token，GPT-5 级推理+实时语音\n- GPT-Realtime-Translate：$0.034/分钟，70+语言实时翻译\n- GPT-Realtime-Whisper：$0.017/分钟，流式转写\n\n💡 1小时实时翻译仅$2.04，人工同传成本的1/25\n\n**2. Qualcomm CEO 透露 AI 可穿戴设备计划**\nOpenAI、Meta 等几乎所有AI公司正与高通合作开发智能眼镜/戒指/胸针等设备，2026下半年-2027上市，目标替代智能手机。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3. Microsoft Copilot Cowork 发布**\nAI可在M365中自主执行跨应用多步骤任务（后台运行）。GitHub Copilot 6月1日转向使用量计费。\n\n**4. Roche $10.5亿收购 PathAI**\n$7.5亿预付+$3亿里程碑。Science杂志研究：OpenAI o1诊断准确率67%，超越医生（50-55%）。\n\n**5. Anthropic Claude Managed Agents 更新**\n新增\"Dreaming\"（Agent自主复盘学习）、多Agent协调、代码安全扫描。Claude Mythos Preview 定价$25/$125 per M token（邀请制）。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 二、热门开源项目 Top 3\n\n| 项目 | Star | 亮点 |\n|------|------|------|\n| [pi-mono](https://github.com/badlogic/pi-mono) | 44.3K | 极简AI Agent全栈工具包 |\n| [Pixelle-Video](https://github.com/AIDC-AI/Pixelle-Video) | 14.6K | AI全自动短视频引擎 |\n| [ml-intern](https://github.com/huggingface/ml-intern) | 6.3K | HuggingFace开源ML工程师Agent |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 三、模型价格对比（每百万token）\n\n| 模型 | 输入 | 输出 | 基准 |\n|------|------|------|------|\n| Claude Opus 4.7 | $5.00 | $25.00 | SWE-bench 87.6% |\n| GPT-5.5 | $5.00 | $30.00 | 幻觉率降52.5% |\n| Gemini 3.1 Pro | $2.00 | $12.00 | GPQA 94.3% |\n| DeepSeek V4 Pro | $1.74 | $3.48 | SWE-bench 80.6% |\n| DeepSeek V4 Flash | $0.14 | $0.28 | 极致性价比 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 四、资本动态\n\n- Roche收购PathAI：$10.5亿（AI病理诊断）\n- SoftBank缩减OpenAI贷款：$100亿→$60亿（-40%）\n- Sierra融资$9.5亿，估值$158亿\n- Cursor拟融$20亿，估值$500亿+（ARR $20亿）\n- Anthropic拟融~$500亿，估值$9000亿\n- 企业AI推理成本同比下降67%\n- Q1全球AI并购266笔（同比+90%）"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 五、趋势洞察\n\n1. **AI从对话→自主执行**：Copilot Cowork、Cloudflare+Stripe让Agent能\"花钱办事\"\n2. **语音AI爆发**：实时翻译$2/小时，AI可穿戴设备下半年上市\n3. **推理成本暴跌67%**：DeepSeek V4 Flash仅$0.14/$0.28，GitHub Copilot转用量计费\n4. **垂直AI收购潮**：数据壁垒>模型能力，医疗/金融AI估值最高\n\n📎 [查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-05-11.md)"
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
echo "飞书推送结果: $?"

# === Bark 推送 ===
echo ""
echo "🚀 推送 Bark 通知..."
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-05-11/OpenAI%E5%8F%91%E5%B8%83%E4%B8%89%E6%AC%BE%E5%AE%9E%E6%97%B6%E8%AF%AD%E9%9F%B3%E6%A8%A1%E5%9E%8B%EF%BC%8C1%E5%B0%8F%E6%97%B6%E5%AE%9E%E6%97%B6%E7%BF%BB%E8%AF%91%E4%BB%85%242.04%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%AE%8C%E6%95%B4%E6%97%A5%E6%8A%A5%E2%86%92?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-05-11.md&group=AI%E6%97%A5%E6%8A%A5"

echo ""
echo "Bark推送结果: $?"
echo ""
echo "✅ 全部推送完成！"
