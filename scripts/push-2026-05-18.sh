#!/bin/bash
# 2026-05-18 AI 技术日报推送脚本
# 推送到飞书 Webhook 和 Bark

# ========== 飞书卡片推送 ==========
curl -s -X POST 'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81' \
-H 'Content-Type: application/json' \
-d '{
  "msg_type": "interactive",
  "card": {
    "header": {
      "template": "blue",
      "title": {
        "tag": "plain_text",
        "content": "📊 AI 技术日报 - 2026年5月18日"
      }
    },
    "elements": [
      {
        "tag": "markdown",
        "content": "## 一、今日要闻\n\n**1️⃣ OpenAI 三线合一打造"超级应用"**\nGreg Brockman 挂帅，将 ChatGPT + Codex + Atlas 浏览器合并为统一平台。首个预览版预计 2026 年底前推出。目标：一个可以在用户电脑上自主写代码、分析数据、浏览网页的 AI 代理平台。\n\n**2️⃣ Recursive Superintelligence 出隐身，融资 $6.5 亿**\n估值 $46.5 亿，由前 Salesforce 首席科学家 Richard Socher 创立。投资方：GV、NVIDIA、AMD Ventures。目标：打造"自己改进自己"的递归自进化 AI。"
      },
      {
        "tag": "markdown",
        "content": "**3️⃣ DeepSeek V4 Pro：开源最强推理模型**\n1.6T 总参数，49B 激活参数，100 万上下文。API 价格：输入 $1.74、输出 $3.48/百万 Token。对比 GPT-5.5（输入 $5、输出 $30），价格仅为其 11.6%。MRCR 1M 得分 83.5%，超 GPT-5.5 的 74.0%。\n\n**4️⃣ NVIDIA Nemotron 3 Nano Omni：边缘多模态新王者**\n30B 总参/3B 激活参数，集成视觉+音频+文字。多文档效率比同类高 7.4 倍，视频效率高 9.2 倍。可在手机/IoT 设备运行。\n\n**5️⃣ 微软 MDASH：多模型 AI 安全防御系统**\n多个 AI 模型组团协同扫描安全威胁，登顶行业基准，验证"Agent 团队 > 单个超级 Agent"趋势。"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 二、热门开源 Top 3\n\n🥇 **OpenClaw** ⭐ 210,000+ — 自托管 AI 管家，连接 50+ 应用 24/7 自动执行任务，MIT 许可\n\n🥈 **RAGFlow** ⭐ 80,600+ — 企业级 RAG 引擎，让 AI 回答有据可查，消除幻觉\n\n🥉 **Dify** ⭐ 100,000+ — 拖拽式 AI 应用构建平台，50+ 工具集成，非技术人员也能搭 AI 工作流"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 三、资本动态\n\n| 公司 | 融资 | 估值 |\n|---|---|---|\n| OpenAI | $1220 亿 | $8520 亿 |\n| Sierra | $9.5 亿 E 轮 | $158 亿 |\n| Recursive | $6.5 亿 | $46.5 亿 |\n| Prometheus | 筹 $100 亿 | $380 亿 |\n\n2026 年至今 VC 累计投入 AI 初创 **$188 亿**"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "## 四、行动建议（给产品经理）\n\n✅ **多 Agent 协作** > 单模型，为不同功能选用不同模型+路由调度\n✅ 100 万 Token 上下文成标配，重新评估"文档拆分"策略\n✅ 开源模型（DeepSeek V4）逼近闭源，成本敏感场景优先评估\n✅ 边缘多模态 AI 即将落地，移动端/IoT 产品可开始调研\n✅ AI 正从"工具"变"平台"，考虑接入多模型框架避免供应商锁定"
      },
      {
        "tag": "hr"
      },
      {
        "tag": "markdown",
        "content": "📄 [查看完整日报 →](https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-05-18.md)\n\n💡 长按本消息可收藏 | 群内搜索关键词可查历史日报"
      }
    ]
  }
}'

echo ""
echo "飞书推送完成"

# ========== Bark 推送 ==========
curl -s "https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/%F0%9F%93%8A%20AI%20%E6%8A%80%E6%9C%AF%E6%97%A5%E6%8A%A5%202026-05-18/OpenAI%E4%B8%89%E7%BA%BF%E5%90%88%E4%B8%80%E6%89%93%E9%80%A0%E8%B6%85%E7%BA%A7%E5%BA%94%E7%94%A8%EF%BC%8CDeepSeek%20V4%20Pro%E4%BB%B7%E6%A0%BC%E4%BB%85%E4%B8%BAGPT-5.5%E7%9A%8411.6%25%EF%BC%8CRecursive%E8%9E%8D%E8%B5%846.5%E4%BA%BF%E7%BE%8E%E5%85%83%E6%89%93%E9%80%A0%E8%87%AA%E8%BF%9B%E5%8C%96AI%E3%80%82%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E5%85%A8%E6%96%87%E2%86%92?url=https://github.com/kinggao23-droid/AI-Daily/blob/main/2026-05-18.md&group=AI%E6%97%A5%E6%8A%A5"

echo ""
echo "Bark 推送完成"
echo "全部推送完成！"
