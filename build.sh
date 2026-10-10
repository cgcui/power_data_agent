#!/usr/bin/env bash
# 编译《电网 AI 数据智能体：原理、方法与实践》某一章的 LaTeX 源码为 PDF
#
# 用法：
#   ./build.sh "绪论-从电网数据到数据智能体"          # 目录名（.tex 自动识别）
#   ./build.sh "绪论-从电网数据到数据智能体" 绪论      # 指定文件名（不含 .tex）
#
# 引擎选择：
#   - 优先 XeLaTeX（TinyTeX）→ 宋体正文 + 黑体标题（Windows 系统字体）
#   - 未装 TinyTeX 时回退 tectonic → 使用自带的 Fandol 字体（中文正常，非宋体）
set -euo pipefail

TINYTEX_BIN="${TINYTEX_BIN:-$HOME/TinyTeX/bin/windows}"
DIR="${1:?用法: ./build.sh <章节目录> [文件名(不含.tex)]}"

cd "$DIR"
TEX="${2:-$(ls *.tex 2>/dev/null | head -1)}"
[ -n "$TEX" ] || { echo "!! $DIR 下没有 .tex 文件"; exit 1; }
NAME="${TEX%.tex}"

if [ -x "$TINYTEX_BIN/xelatex.exe" ]; then
  export PATH="$TINYTEX_BIN:$PATH"
  echo ">> XeLaTeX（TinyTeX）—— 宋体正文 / 黑体标题"
  xelatex -interaction=nonstopmode -halt-on-error "$TEX" >/dev/null 2>&1
  xelatex -interaction=nonstopmode "$TEX" 2>&1 | grep -E "Output written|^!|Overfull|Underfull" || true
  rm -f "$NAME.aux" "$NAME.log" "$NAME.out"
else
  echo ">> 未找到 TinyTeX，改用 tectonic —— Fandol 字体（非宋体）"
  echo "   安装路径可用 TINYTEX_BIN 指定，当前查找: $TINYTEX_BIN"
  tectonic --keep-logs "$TEX" --outdir . 2>&1 | tail -3
  rm -f "$NAME.log"
fi

echo ">> 完成: $DIR/$NAME.pdf"
