# 绪论　从电网数据到数据智能体

> **所属**：全书开篇　｜　**状态**：✅ 初稿完成（LaTeX 源码 + 宋体版 PDF）

## 文件

| 文件 | 说明 |
|---|---|
| `绪论.tex` | LaTeX 源码（ctexart + TikZ，含 4 幅内联图，无外部图片依赖） |
| `绪论.pdf` | 编译产物，共 4 页 A4 ｜ **宋体正文 + 黑体标题**（SimSun / SimHei 子集嵌入） |

## 编译方式

**推荐：XeLaTeX（宋体版）**

```bash
export PATH="$HOME/TinyTeX/bin/windows:$PATH"
cd "绪论-从电网数据到数据智能体"
xelatex -interaction=nonstopmode 绪论.tex
xelatex -interaction=nonstopmode 绪论.tex   # 第二遍生成交叉引用
```

或在仓库根目录直接用脚本：

```bash
./build.sh "绪论-从电网数据到数据智能体"
```

XeLaTeX 下 ctex 会自动选用 `ctex-fontset-windows`：正文 **SimSun**、粗体 **SimHei**、
斜体 **KaiTi**，无需任何额外配置。

**备选：tectonic（Fandol 字体）**

```bash
tectonic 绪论.tex --outdir .
```

tectonic 在 Windows 下无法枚举系统字体，ctex 会回退到自带的 Fandol（FandolSong / FandolKai）——
中文渲染正常、字体同样嵌入，**但不是宋体**。源码无需改动，两种引擎均可编译。

## 小节清单

- 0.1 为什么电网行业需要数据智能体：数据增长与业务智能化的矛盾
- 0.2 从数据工具到数字劳动力：AI 如何改变电网数据工作方式
- 0.3 本书的定位：一本面向电网业务、能够照着实践的技术读物
- 0.4 读者对象与知识基础：电网从业者与 AI 开发人员的共同入门
- 0.5 本书的三条阅读路径：业务应用、技术开发与组织管理
- 0.6 本书的整体技术路线：六类智能体、一条流水线、多个业务场景
- 0.7 配套实践资源：代码、Prompt 模板、样例数据与实验环境

## 插图（TikZ 内联）

- **图 0-1** 电网数据工作的三重矛盾
- **图 0-2** 能力光谱：Assistant → Copilot → Agent
- **图 0-3** 三条阅读路径
- **图 0-4** 全书技术路线（数据源 → 六类智能体 → 自主流水线 → 业务场景）

---

*本目录内容见仓库根目录 `电网AI数据智能体-书籍目录.md`。*
