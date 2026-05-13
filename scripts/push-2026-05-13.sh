#!/bin/bash
# AI 技术日报 2026-05-13 推送脚本
# 包含飞书卡片推送和 Bark iPhone 通知

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
        "content": "📊 AI 技术日报 - 2026年5月13日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "**🔥 今日要闻**\n\n**1. 马斯克正式解散 xAI，整合为 SpaceXAI，22 万块 GPU 租给 Anthropic**\nxAI 停止独立运营，整合至 SpaceX 旗下 SpaceXAI。合并后估值达 1.25 万亿美元，11 位联合创始人全部离职。Colossus 1 数据中心超 22 万块 NVIDIA GPU（300+ 兆瓦算力）全部提供给 Anthropic，用于 Claude 系列模型训练和推理。\n\n**2. OpenAI 成立 Deployment Company，斥资 $40 亿收购 Tomoro**\nOpenAI 从\"卖 API\"转向\"帮企业落地 AI\"，收购拥有 150+ 前沿部署工程师的 Tomoro，TPG 领投。学习 Palantir 模式，用驻场工程师帮企业将 AI 嵌入核心业务。"
      },
      {
        "tag": "markdown",
        "content": "**3. Anthropic Code with Claude 2026 开发者大会**\n核心发布：多智能体编排（拆分任务并行执行）、Outcomes（定义成功标准自主迭代）、Dreaming（跨会话记忆）、Routines（异步自动化）、Advisor（Sonnet 执行 + Opus 会诊）。Claude Code 限额翻倍，取消高峰期降速。\n\n**4. Cerebras 上调 IPO 定价至 $150-160，估值 $490 亿**\n明日（5/14）纳斯达克上市，认购超 20 倍，2026 年最热 IPO。核心产品晶圆级引擎面积是 NVIDIA H100 的 57 倍，与 OpenAI 签有 $10 亿大单。\n\n**5. 大模型价格战两极分化**\nDeepSeek V4-Flash 输入仅 0.02 元/百万 Token，较 GPT-5.5 Pro 低超 700 倍。另一端智谱年内三次涨价，腾讯云两次涨价。豆包推出 68/200/500 元三档付费订阅，C 端免费时代退潮。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**🏆 热门开源项目 Top 3**\n\n| 项目 | Star 数 | 亮点 |\n|------|---------|------|\n| [Hermes Agent](https://github.com/NousResearch/hermes-agent) | 146,900+ | 自我进化型 AI 智能体，持久记忆 + 自动技能生成 |\n| [PageIndex](https://github.com/VectifyAI/PageIndex) | 30,851 | 无向量推理式 RAG，FinanceBench 准确率 98.7% |\n| [DeepSeek-TUI](https://github.com/Hmbown/DeepSeek-TUI) | 26,457 | 终端编程智能体，本周 +20,835 星，增长最猛 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**💰 资本与行业格局**\n\n• DeepSeek 完成 $73.5 亿融资（中国 AI 史上最大），估值 $500 亿\n• Anthropic 年化营收突破 $300 亿，Q1 同比增长 80 倍\n• Anthropic 考虑新一轮融资，估值或超 $9,000 亿\n• Google 计划投资 Anthropic 最高 $400 亿\n• Sierra 完成 $9.5 亿 D 轮，估值超 $158 亿\n• Cerebras IPO 募资最高 $48 亿，明日上市\n• Alphabet 市值达 $4.8 万亿，一年涨 160%"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**📈 趋势洞察**\n\n1️⃣ **落地服务竞赛**：模型厂商亲自下场做部署，LLMOps 价值从\"接入模型\"转向\"业务落地加速\"\n2️⃣ **算力商品化**：SpaceXAI 租 GPU 给 Anthropic，算力从自建壁垒变为可交易商品\n3️⃣ **合规即产品**：Take It Down Act (5/19)、欧盟 AI 法案 (8/2)、清朗行动多线并进\n4️⃣ **中国开源领跑**：全球前五开源模型均为中国制造，推理成本低于西方竞品 700 倍"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "📄 [查看完整日报 →](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-05-13.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'

echo ""
echo "飞书推送完成"

echo ""
echo "=== 推送 Bark iPhone 通知 ==="

curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-05-13/%E9%A9%AC%E6%96%AF%E5%85%8B%E8%A7%A3%E6%95%A3xAI%E6%95%B4%E5%90%88%E4%B8%BASpaceXAI%EF%BC%8C22%E4%B8%87GPU%E7%A7%9F%E7%BB%99Anthropic%EF%BC%9BCerebras%E6%98%8E%E6%97%A5IPO%E4%BC%B0%E5%80%BC490%E4%BA%BF%E7%BE%8E%E5%85%83%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%85%A8%E6%96%87%E2%86%92?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-05-13.md&group=AI%E6%97%A5%E6%8A%A5"

echo ""
echo "Bark 推送完成"
echo ""
echo "=== 全部推送完成 ==="
