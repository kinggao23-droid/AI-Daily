#!/bin/bash
# 推送 2026-06-09 AI 技术日报到飞书和 Bark

# === 飞书卡片推送 ===
curl -s -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
  -H 'Content-Type: application/json' \
  -d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "tag": "plain_text",
        "content": "📊 AI 技术日报 - 2026年6月9日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 一、今日要闻\n\n**1. Apple WWDC 2026：Siri 全面重构，搭载 1.2 万亿参数 Gemini 模型**\n\nApple 发布 Siri 史上最大升级，底层采用 Google 定制的 1.2 万亿参数 Gemini 模型（合作价值约 10 亿美元/年）。三级路由系统：设备端处理简单任务 → Apple 云处理中等请求 → Google Cloud（Blackwell B200 GPU）处理复杂推理。iOS 27 允许用户将 ChatGPT/Claude/Gemini 设为默认 AI 助手。Tim Cook 将于 9 月 1 日转任执行董事长，John Ternus 接任 CEO。\n\n**2. 半导体板块两天蒸发 1.3 万亿美元**\n\nBroadcom AI 收入指引低于预期 14%，叠加就业数据超预期（17.2 万 vs 预期 8.6 万），降息预期破灭。NVIDIA -6%、AMD -10.86%、Intel -11.28%，费城半导体指数 -6%+。"
      },
      {
        "tag": "markdown",
        "content": "**3. Google 与 SpaceX 签署 300 亿美元算力采购协议**\n\n月付 9.2 亿美元，租借约 11 万块 NVIDIA GPU，为期 32 个月（2026.10-2029.6），用于 Gemini Enterprise 平台的桥接算力。\n\n**4. DeepSeek V4-Pro 永久降价 75%**\n\n输出价格降至 $0.87/百万 token（GPT-5.5 的 1/34）。1.6 万亿总参数，首个适配华为昇腾 950 的前沿模型。\n\n**5. 五角大楼弃用 Claude**\n\nAnthropic 因拒绝移除禁止大规模监控和自主武器的安全护栏，被美国防部列为「供应链风险」并排除出机密网络 AI 合同。Anthropic 已提起诉讼。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 二、热门开源项目 Top 3\n\n**1. last30days-skill** ⭐ 34,600（今日 +3,558，GitHub 热榜第 1）\n全网多平台 AI 研究技能包，搜遍 Reddit/X/YouTube 等 11+ 平台，用真实互动数据评估信息重要性\n\n**2. turbovec** ⭐ 8,900（今日 +1,729，热榜第 2）\nRust 编写的超高速向量搜索引擎，16 倍压缩，比 FAISS 快 12-20%\n\n**3. MemPalace** ⭐ 54,900\nAI 记忆宫殿系统，LongMemEval 96.6% 召回率，完全本地运行，v3.4.0 刚发布"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 三、产品动态\n\n| 产品 | 关键数据 |\n|------|--------|\n| OpenAI Dreaming V3 | ChatGPT 记忆系统大升级，82.8% 事实召回率，计算成本降 5 倍 |\n| Claude Opus 4.8 | SWE-Bench Pro 69.2%，USAMO 数学 96.7%，价格不变 $5/$25 |\n| Qwen3-Coder | 480B 总参/35B 激活，MoE 架构，专注智能体编码 |\n| NVIDIA Nemotron 3 Ultra | 5500 亿参数 MoE 开源旗舰 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 四、资本与行业格局\n\n| 公司 | 融资 | 估值 |\n|------|------|------|\n| Anthropic | 650 亿美元 Series H | 9,650 亿美元 |\n| Ramp | 7.5 亿美元 Series F | 440 亿美元 |\n| Supabase | 5 亿美元 Series F | 105 亿美元 |\n| Suno | 4 亿美元 Series D | 54 亿美元 |\n\nAnthropic 已向 SEC 秘密提交 IPO，目标估值 1.75-1.8 万亿美元。2026 Q1 全球风投 3000 亿+，AI 占 80%（2420 亿美元）。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 五、行动建议\n\n1. **多模型架构优先**：Apple 和微软都走向平台化，用 MCP 协议标准化模型接入层\n2. **重算成本模型**：API 价格一年降 80%，DeepSeek 输出 $0.87/百万 token，之前不划算的功能现在可能划算了\n3. **补课 AI 记忆**：MemPalace 开源可直接集成，96.6% 召回率\n4. **关注算力采购窗口**：半导体回调可能带来更好的云算力议价机会"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "📄 [查看完整日报 →](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-09.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'

echo ""
echo "飞书推送完成"

# === Bark 推送 ===
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-06-09/Apple%20WWDC%202026%20%E5%8F%91%E5%B8%83%20Siri%20AI%EF%BC%8C%E6%90%AD%E8%BD%BD%201.2%20%E4%B8%87%E4%BA%BF%E5%8F%82%E6%95%B0%20Gemini%20%E6%A8%A1%E5%9E%8B%EF%BC%8C%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%AE%8C%E6%95%B4%E6%97%A5%E6%8A%A5?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-09.md&group=AI%E6%97%A5%E6%8A%A5"

echo ""
echo "Bark 推送完成"
echo ""
echo "全部推送完成！"
