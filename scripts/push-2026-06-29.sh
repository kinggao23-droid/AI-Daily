#!/bin/bash
# AI 技术日报 2026-06-29 推送脚本（飞书 + Bark）
# 用法：bash scripts/push-2026-06-29.sh

echo "📤 推送 AI 技术日报 2026-06-29..."

# ===== 飞书推送 =====
echo "📮 发送飞书卡片消息..."
FEISHU_RESULT=$(curl -s -w "\n%{http_code}" -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
  -H 'Content-Type: application/json' \
  -d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "tag": "plain_text",
        "content": "📊 AI 技术日报 - 2026年6月29日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 今日要闻\n\n**1️⃣ OpenAI 发布 GPT-5.6 系列：Sol / Terra / Luna**\nSol（旗舰）Terminal-Bench 91.9% 史上最高，但被美国政府限制发布，仅约 20 家合作伙伴可用。三级定价：Sol $5/$30、Terra $2.50/$15、Luna $1/$6。\n\n**2️⃣ OpenAI × Broadcom 发布 Jalapeño 推理芯片**\n首款定制 ASIC 推理芯片，TSMC 3nm，9 个月设计到流片（业界最快），推理成本比 NVIDIA 低 50%。2026 底部署。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "**3️⃣ Anthropic 指控阿里巴巴大规模蒸馏攻击**\n25,000 假账号、2880 万次 API 交互（44 天），窃取 Claude 编码和 Agent 能力训练 Qwen。美国国会考虑制裁。Mythos 5 向约 100 家企业有限放行，Fable 5 仍暂停。\n\n**4️⃣ 智谱 GLM-5.2 开源：性能超 GPT-5.5，价格 1/6**\nMIT 开源，750B MoE，SWE-bench Pro 62.1%（GPT-5.5 为 58.6%），$1.40/$4.40/百万 token。首个进入全球前三的中国模型。\n\n**5️⃣ SpaceX $600 亿收购 Cursor**\n史上最大 VC 支持公司收购。Cursor ARR 从 $1 亿暴增到 $40 亿，覆盖 50% 财富 500 强开发者。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 热门开源 Top 3\n\n🔥 **Headroom** — AI Agent Token 压缩层，省 60-95% 费用 ⭐23K+（单日 +2,624）\n🔥 **OpenMontage** — 首个开源 Agent 视频制作系统，52 工具 + 12 流水线\n🔥 **DeerFlow**（字节跳动）— 长时 Agent 编排框架 ⭐75K+"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 资本动态\n\nAnthropic 秘密 IPO（$9650 亿估值）| DeepSeek 首轮 $74 亿（$500 亿估值）| SpaceX 收购 Cursor $600 亿 | Qualcomm 收购 Modular $39 亿 + 洽谈 Tenstorrent $80-100 亿 | OpenAI IPO 目标 $1 万亿"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## LLM 价格速览（/百万 token）\n\nDeepSeek V4-Flash $0.14/$0.28 → GLM-5.2 $1.40/$4.40 → Luna $1/$6 → Gemini Flash $1.50/$9 → Terra $2.50/$15 → Opus 4.8 $5/$25 → Sol $5/$30"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 行动建议\n\n1. **多模型后备**：前沿模型进入政府管控时代，至少支持 3 家供应商 + 1 个开源模型\n2. **三层省钱**：选对模型层级 + Headroom 压缩 + API 缓存\n3. **测试中国开源**：GLM-5.2 和 DeepSeek V4 已超闭源旗舰，价格低 6-34 倍\n4. **AI 视频**：OpenMontage 让 Agent 全自动制作视频，评估集成可能\n\n📎 [点击查看完整日报](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-29.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}')

FEISHU_HTTP_CODE=$(echo "$FEISHU_RESULT" | tail -1)
FEISHU_BODY=$(echo "$FEISHU_RESULT" | sed '$d')

if [ "$FEISHU_HTTP_CODE" = "200" ]; then
  echo "✅ 飞书推送成功"
else
  echo "❌ 飞书推送失败 (HTTP $FEISHU_HTTP_CODE): $FEISHU_BODY"
fi

# ===== Bark 推送 =====
echo "📱 发送 Bark 推送..."
BARK_TITLE=$(python3 -c "import urllib.parse; print(urllib.parse.quote('📊 AI 技术日报 2026-06-29'))")
BARK_BODY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('GPT-5.6三级架构发布(Sol/Terra/Luna)但被政府限发；OpenAI发布Jalapeño推理芯片比NVIDIA便宜50%。点击查看全文→'))")
BARK_URL="https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/${BARK_TITLE}/${BARK_BODY}?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-29.md&group=AI%E6%97%A5%E6%8A%A5"

BARK_RESULT=$(curl -s -w "\n%{http_code}" "$BARK_URL")
BARK_HTTP_CODE=$(echo "$BARK_RESULT" | tail -1)

if [ "$BARK_HTTP_CODE" = "200" ]; then
  echo "✅ Bark 推送成功"
else
  echo "❌ Bark 推送失败 (HTTP $BARK_HTTP_CODE)"
fi

echo ""
echo "🎉 推送完成！"
echo "📎 GitHub 日报链接: https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-06-29.md"
