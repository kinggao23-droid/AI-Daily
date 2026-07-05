#!/bin/bash
# AI 技术日报 2026-07-05 推送脚本（飞书+Bark）
# 在本地网络环境下执行此脚本

echo "📤 正在推送 2026-07-05 AI 技术日报..."

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
        "content": "📊 AI 技术日报 - 2026年7月5日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "**🔥 今日要闻**\n\n**1. 美团开源 LongCat-2.0：1.6万亿参数编程模型**\n全程用5万张国产芯片训练，MIT许可证，100万token上下文。SWE-bench Pro 59.5%超越GPT-5.5(58.6%)。促销价仅$0.30/$1.20（输入/输出每百万token），为GPT-5.5的6%。\n\n**2. Together AI 完成8亿美元C轮，估值83亿美元**\nAramco Ventures领投，年化订单超11.5亿美元。开源模型推理基础设施赛道爆发，获500兆瓦算力承诺。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3. Palantir+Nvidia发布主权AI方案**\n数据完全不出客户机房，用开源Nemotron模型替代闭源API。CEO Karp怒斥AI行业疯狂至极，称OpenAI和Anthropic对企业征财富税。Palantir市值一日增217亿。\n\n**4. TwelveLabs融资1亿美元打造视频超级智能**\nNEA+NAVER领投，Amazon和Red Bull跟投。不是看视频的语言模型，是生于视频的原生多模态模型。\n\n**5. Anthropic发布Claude Science公测版**\n面向科学家的多智能体AI工作台，60+预配置技能，覆盖基因组学蛋白质组学结构生物学。集成NVIDIA BioNeMo。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**🌟 热门开源 Top 3**\n- Dify 145K⭐ 可视化AI Agent工作流平台\n- Langflow 149K⭐ 低代码AI Agent构建器\n- LongCat-2.0 万亿参数开源编程模型"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**💰 模型价格速览（$/百万token 输入/输出）**\n- Fable 5: $10/$50 SWE-Pro 80.3%\n- Opus 4.8: $5/$25 SWE-Pro 69.2%\n- GPT-5.6 Sol: $5/$30 限定预览\n- Sonnet 5促销: $2/$10 SWE-Pro 63.2%\n- GLM-5.2: $0.95/$3 SWE-Pro 62.1%\n- LongCat-2.0促销: $0.30/$1.20 SWE-Pro 59.5%\n- DeepSeek V4-Pro: $0.435/$0.87"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**📈 资本动态**\n- Together AI: 8亿C轮 83亿估值\n- TwelveLabs: 1亿B轮\n- Venice AI: 6500万A轮 10亿估值\n- Anthropic与三星讨论定制2nm AI芯片\n- Reflection AI+SpaceX: 63亿算力协议"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**🎯 PM行动建议**\n1. 模型价格崩塌——编程类任务迁移到中国模型可省80-95%成本\n2. 数据主权三条路线并行——评估本地私有部署可行性\n3. 视频AI是下一个金矿——评估业务中的视频结构化机会\n4. Agent开发民主化——用Dify或Langflow半天搭原型验证想法\n\n[📖 查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-05.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
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
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-07-05/%E7%BE%8E%E5%9B%A2%E5%BC%80%E6%BA%90LongCat-2.0%EF%BC%881.6%E4%B8%87%E4%BA%BF%E5%8F%82%E6%95%B0%E7%BC%96%E7%A8%8B%E6%A8%A1%E5%9E%8B%EF%BC%89%EF%BC%8C%E4%BF%83%E9%94%80%E4%BB%B7%E4%BB%85%E4%B8%BAGPT-5.5%E7%9A%846%25%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%AE%8C%E6%95%B4%E6%97%A5%E6%8A%A5?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-07-05.md&group=AI%E6%97%A5%E6%8A%A5"

BARK_RESULT=$?
if [ $BARK_RESULT -eq 0 ]; then
  echo "✅ Bark 推送成功"
else
  echo "❌ Bark 推送失败 (exit code: $BARK_RESULT)"
fi

echo ""
echo "🎉 推送完成！"
