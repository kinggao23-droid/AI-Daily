#!/bin/bash
# 推送 2026-06-12 AI 技术日报到飞书和 Bark

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
        "content": "📊 AI 技术日报 - 2026年6月12日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 一、今日要闻\n\n**1. 小米 MiMo-V2.5-Pro-UltraSpeed：万亿参数模型推理突破 1000 tokens/s**\n小米联合 TileRT 在单台 8 卡商用 GPU 上将 1T 参数模型推理速度推至 1000-1200 tokens/s，业内首次在标准硬件上达到这一里程碑。核心技术包括 FP4 量化、DFlash 投机解码和 TileRT 超低延迟推理引擎。基础模型已开源。\n\n**2. Google 发布 DiffusionGemma：文本生成速度提升 4 倍**\n26B 参数开源 MoE 模型（Apache 2.0），将图像扩散模型的并行生成思路引入文本领域。H100 上实现 1000+ tokens/s，每次前向传递生成 256 token。质量低于标准 Gemma 4，适合对速度要求高的场景。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3. Anthropic 扩展 Project Glasswing：AI 已发现超万个关键零日漏洞**\nClaude Mythos Preview 在所有主流操作系统和浏览器中发现超过 10,000 个高危零日漏洞。合作组织从 50 个扩展至约 200 个，覆盖电力、水务、医疗等关键基础设施，涉及 15+ 个国家。\n\n**4. Gemini 3.5 Flash 持续领跑性价比**\n输入 $1.50/M tokens，输出 $9.00/M tokens，比 GPT-5.5 便宜 70%。编程（Terminal-Bench 76.2%）、Agent（GDPval 1656 Elo）和工具使用（MCP Atlas 83.6%）多项基准领先，输出速度 144.8 t/s。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**5. Gemma 4 开源家族铺开：31B 模型全球开源第三**\n31B Dense 模型 LMArena 排名 #3（1452 分），12B 模型可在 16GB 笔记本运行视频和音频分析。全系列 Apache 2.0 许可。\n\n## 二、热门开源项目 Top 3\n\n🥇 **OpenClaw** — 377K Stars，本地自主 AI Agent 框架\n🥈 **Open WebUI** — 124K Stars，自托管 AI 对话平台\n🥉 **DiffusionGemma** — Google 新发布，扩散式文本生成"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 三、API 定价速览（/百万 token）\n\n| 模型 | 输入 | 输出 |\n|------|------|------|\n| Claude Fable 5 | $10.00 | $50.00 |\n| GPT-5.5 | $5.00 | $30.00 |\n| Claude Opus 4.8 | $5.00 | $25.00 |\n| Gemini 3.5 Flash | $1.50 | $9.00 |"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 四、资本动态\n\n• Anthropic H 轮 $650 亿，估值 $9650 亿（首超 OpenAI）\n• ElevenLabs D 轮 $5 亿，估值 $110 亿\n• Rhoda AI A 轮 $4.5 亿，估值 $17 亿（机器人视觉智能）\n• Coralogix F 轮 $2 亿，估值 $16 亿（AI Agent 监控）"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 五、行动建议\n\n1️⃣ **速度 vs 精度双模式**：产品中提供速度/精度切换，Gemini 3.5 Flash 是当前性价比最优选\n2️⃣ **开源替代闭源**：Gemma 4 12B 可在笔记本本地部署，适合隐私敏感场景\n3️⃣ **AI 安全审计**：将 AI 代码审查工具集成到 CI/CD 流程\n4️⃣ **Agent 运维规划**：开发 Agent 产品要同步规划监控和可观测性方案\n5️⃣ **模型路由**：一个产品使用 2-3 个模型已成为最佳实践\n\n📄 [查看完整日报 →](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-12.md)"
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
echo "=== 飞书推送完成 ==="

# === Bark 推送 ===
TITLE=$(python3 -c "import urllib.parse; print(urllib.parse.quote('📊 AI 技术日报 2026-06-12'))")
BODY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('小米MiMo突破1000tokens/s，Google发布DiffusionGemma 4倍加速，Anthropic发现万个零日漏洞。点击查看全文。'))")
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/${TITLE}/${BODY}?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-12.md&group=AI%E6%97%A5%E6%8A%A5"

echo ""
echo "=== Bark 推送完成 ==="
