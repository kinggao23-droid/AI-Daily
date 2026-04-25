#!/bin/bash
###############################################################################
# AI Daily 主入口脚本 (由 launchd 每天 18:00 北京时间触发)
#
# 流程:
#   1. 加载 ~/.ai-daily.env 中的凭据 (FEISHU_WEBHOOK / BARK_URL)
#   2. cd 到本仓库
#   3. git pull (避免本地落后)
#   4. 调用 claude --print 生成综合版日报 → 写入 <DATE>.md
#   5. 调用 claude --print 生成 LLMOps 专题 → 写入 llmops/<DATE>.md
#   6. git commit & push
#   7. 调用 send_notification.py 通过飞书 + Bark 推送
#
# 日志: ~/Library/Logs/ai-daily/<DATE>.log
###############################################################################

set -uo pipefail

# ---------- 配置 ----------
# 仓库路径 (脚本所在目录的父目录)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
REPO_DIR="$( cd "$SCRIPT_DIR/.." && pwd )"

# Claude Code 命令路径 (尝试多个常见位置)
CLAUDE_BIN=""
for candidate in \
    "$HOME/.claude/local/claude" \
    "/usr/local/bin/claude" \
    "/opt/homebrew/bin/claude" \
    "$(command -v claude 2>/dev/null)"
do
    if [ -x "$candidate" ]; then
        CLAUDE_BIN="$candidate"
        break
    fi
done

if [ -z "$CLAUDE_BIN" ]; then
    echo "❌ 找不到 claude 命令, 请检查 Claude Code 安装" >&2
    exit 1
fi

# 日期变量
DATE=$(date +%Y-%m-%d)
DATE_CN=$(date +%Y年%m月%d日)
WEEKDAY_NUM=$(date +%u)  # 1=周一, 7=周日
WEEKDAYS=("" "周一" "周二" "周三" "周四" "周五" "周六" "周日")
WEEKDAY="${WEEKDAYS[$WEEKDAY_NUM]}"

# 日志目录
LOG_DIR="$HOME/Library/Logs/ai-daily"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/$DATE.log"

# 重定向所有输出到日志 (同时也输出到控制台)
exec > >(tee -a "$LOG_FILE") 2>&1

echo "================================================================"
echo "🚀 AI Daily 启动 — $(date '+%Y-%m-%d %H:%M:%S %Z')"
echo "================================================================"
echo "Repo: $REPO_DIR"
echo "Claude: $CLAUDE_BIN"
echo "Log:   $LOG_FILE"
echo

# ---------- 加载凭据 ----------
if [ -f "$HOME/.ai-daily.env" ]; then
    set -a
    # shellcheck disable=SC1091
    source "$HOME/.ai-daily.env"
    set +a
    echo "✅ 已加载 ~/.ai-daily.env"
else
    echo "⚠️  ~/.ai-daily.env 不存在, 推送通道将跳过"
fi

# ---------- 切到仓库 ----------
cd "$REPO_DIR"

echo
echo "📥 git pull..."
git pull --rebase --autostash || {
    echo "⚠️  git pull 失败, 继续执行 (本地为准)"
}

# ---------- 生成日报: 综合版 ----------
GENERAL_OUTPUT="$REPO_DIR/$DATE.md"
GENERAL_PROMPT_FILE="$SCRIPT_DIR/prompts/general.md"

echo
echo "📰 [1/2] 生成综合版日报 → $GENERAL_OUTPUT"
GENERAL_PROMPT=$(sed -e "s|{OUTPUT_PATH}|$GENERAL_OUTPUT|g" \
                     -e "s|{DATE_CN}|$DATE_CN|g" \
                     -e "s|{DATE}|$DATE|g" \
                     -e "s|{WEEKDAY}|$WEEKDAY|g" \
                     "$GENERAL_PROMPT_FILE")

"$CLAUDE_BIN" \
    --print \
    --permission-mode acceptEdits \
    --allowedTools "WebSearch,WebFetch,Read,Write,Bash" \
    "$GENERAL_PROMPT" || {
    echo "❌ 综合版生成失败" >&2
    exit 2
}

if [ ! -s "$GENERAL_OUTPUT" ]; then
    echo "❌ 综合版输出文件为空: $GENERAL_OUTPUT" >&2
    exit 3
fi
echo "✅ 综合版完成 ($(wc -c < "$GENERAL_OUTPUT" | tr -d ' ') chars)"

# ---------- 生成日报: LLMOps 专题 ----------
LLMOPS_OUTPUT="$REPO_DIR/llmops/$DATE.md"
LLMOPS_PROMPT_FILE="$SCRIPT_DIR/prompts/llmops.md"
mkdir -p "$REPO_DIR/llmops"

echo
echo "📊 [2/2] 生成 LLMOps 竞品情报 → $LLMOPS_OUTPUT"
LLMOPS_PROMPT=$(sed -e "s|{OUTPUT_PATH}|$LLMOPS_OUTPUT|g" \
                    -e "s|{DATE_CN}|$DATE_CN|g" \
                    -e "s|{DATE}|$DATE|g" \
                    -e "s|{WEEKDAY}|$WEEKDAY|g" \
                    "$LLMOPS_PROMPT_FILE")

"$CLAUDE_BIN" \
    --print \
    --permission-mode acceptEdits \
    --allowedTools "WebSearch,WebFetch,Read,Write,Bash" \
    "$LLMOPS_PROMPT" || {
    echo "❌ LLMOps 专题生成失败" >&2
    exit 4
}

if [ ! -s "$LLMOPS_OUTPUT" ]; then
    echo "❌ LLMOps 输出文件为空: $LLMOPS_OUTPUT" >&2
    exit 5
fi
echo "✅ LLMOps 专题完成 ($(wc -c < "$LLMOPS_OUTPUT" | tr -d ' ') chars)"

# ---------- git commit & push ----------
echo
echo "💾 提交到 git..."
git add "$DATE.md" "llmops/$DATE.md"

if git diff --cached --quiet; then
    echo "⚠️  没有变化, 跳过提交"
else
    git commit -m "chore: AI Daily $DATE (auto-generated)"
    git push origin main && echo "✅ 已推送到 GitHub" || {
        echo "⚠️  git push 失败 (本地已 commit, 稍后可手动 push)"
    }
fi

# ---------- 推送通知 ----------
echo
echo "📨 推送通知..."
python3 "$SCRIPT_DIR/send_notification.py" "$DATE.md" "llmops/$DATE.md" || {
    echo "⚠️  通知推送有问题, 但日报已生成"
}

echo
echo "================================================================"
echo "🎉 AI Daily 完成 — $(date '+%Y-%m-%d %H:%M:%S %Z')"
echo "================================================================"
