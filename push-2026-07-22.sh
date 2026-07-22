#!/bin/bash
# LLMOps 竞品日报 2026-07-22 推送脚本
# 飞书 + Bark 推送

# 飞书推送
curl -s -X POST -H 'Content-Type: application/json' \
  -d '{"msg_type":"text","content":{"text":"📊 LLMOps 竞品日报 2026-07-22\n\n【今日要闻】\n\n1️⃣ AWS Bedrock 上线 OpenAI GPT-5.6 Sol/Terra/Luna\n- 7/9 GA，三档定价：Luna $1/$6、Terra 约 GPT-5.5 半价、Sol 旗舰级\n- Prompt Caching 90% 折扣，7/20 发布 FinOps 元数据标准化\n- Bedrock 成为唯一同时聚合 OpenAI+Anthropic+Meta 全线模型的平台\n\n2️⃣ Qualcomm 39.2 亿美元收购 Modular\n- 全股票收购 AI 推理平台 Modular（Mojo语言/MAX引擎）\n- 定位 CUDA 替代方案，布局边缘推理\n- 非 NVIDIA 推理路径获重大推力\n\n3️⃣ 腾讯混元 Hy3 正式版发布\n- MoE 295B 参数/21B 激活，256K 上下文\n- 定价：输入 ¥1/百万tokens，输出 ¥4/百万tokens\n- 对比 Qwen3.7-Max（5折后 ¥6/¥18），价格优势达 6 倍\n\n【价格动态】\n- 百炼 Qwen3.7-Max 限时5折：输入¥6 输出¥18\n- 百炼 GLM-5.2 Fastmode 7/15 起降价\n- Databricks Genie Agents 免费至 7/31\n- Q2 全球 VC 超 70% 流向 AI，OpenAI+Anthropic 占 H1 融资 43%\n\n【功能创新】\n- Databricks：Genie Agents + Teams 集成 + SQL 迁移工具\n- Snowflake：Cortex Code VS Code 扩展 + Claude Code 插件\n- Langfuse：V4 Preview + Code Evaluators + MCP 扩展\n- vLLM：v0.25.0 发布（7/11）\n\n【PM 启示】\n① 模型聚合层 Bedrock 领先，已在 AWS 生态的企业优先选用\n② 国内价格战白热化，混元 Hy3 ¥1 vs Qwen3.7-Max ¥6\n③ Agent 基础设施成为下一竞争焦点\n④ 推理层多元化加速，关注非 NVIDIA 方案"}}' \
  'https://open.feishu.cn/open-apis/bot/v2/hook/a8915035-2295-434c-8ec3-e5ac46b64f81'

echo ""
echo "飞书推送完成"

# Bark 推送
curl -s 'https://api.day.app/omVYWtjzo86Fmo2z4DwSMF/LLMOps%E7%AB%9E%E5%93%81%E6%97%A5%E6%8A%A5%E5%B7%B2%E7%94%9F%E6%88%90/%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B%E4%BB%8A%E6%97%A5%E7%AB%9E%E5%93%81%E5%8A%A8%E6%80%81'

echo ""
echo "Bark 推送完成"
