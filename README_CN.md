# Agent Skills 同步工具

中文文档 | [English](README.md)

一个跨平台工具，可自动将你的技能目录同步到所有已知的 AI 代理平台。

## 🌟 特性

- 🚀 一键同步到多个 AI 代理平台
- 🔍 自动检测已安装的平台
- 📦 支持 9+ 个流行的 AI 编码助手
- 💻 跨平台：macOS/Linux（Bash）和 Windows（PowerShell）
- ⚡ 增量同步 - 仅更新已更改的文件
- 🎯 简单轻量

## 📋 支持的平台

- Claude Code
- GitHub Copilot
- Google Antigravity
- Cursor
- OpenCode
- OpenAI Codex
- Gemini CLI
- Windsurf
- Amp

## 🚀 快速开始

### macOS / Linux

```bash
# 赋予脚本执行权限
chmod +x add-skills.sh

# 同步你的技能目录
./add-skills.sh /path/to/your/skills
```

### Windows

```powershell
# 运行 PowerShell 脚本
.\add-skills.ps1 C:\path\to\your\skills
```

## 📖 使用方法

### 基本用法

**Bash（macOS/Linux）：**
```bash
./add-skills.sh <源目录>
```

**PowerShell（Windows）：**
```powershell
.\add-skills.ps1 <源目录>
```

### 示例

**同步本地技能文件夹：**
```bash
# macOS/Linux
./add-skills.sh ./my-skills

# Windows
.\add-skills.ps1 .\my-skills
```

**从绝对路径同步：**
```bash
# macOS/Linux
./add-skills.sh /Users/username/projects/skills

# Windows
.\add-skills.ps1 C:\Users\username\projects\skills
```

## 🔧 工作原理

1. **验证**源目录是否存在
2. **检测**系统上安装了哪些 AI 代理平台
3. **创建**目标目录（如果不存在）
4. **同步**文件（增量更新，仅同步已更改的文件）
5. **报告**成功同步的平台数量

## 📂 默认平台路径

### macOS / Linux
- Claude Code: `~/.claude/skills`
- GitHub Copilot: `~/.copilot/skills`
- Google Antigravity: `~/.gemini/antigravity/skills`
- Cursor: `~/.cursor/skills`
- OpenCode: `~/.config/opencode/skill`
- OpenAI Codex: `~/.codex/skills`
- Gemini CLI: `~/.gemini/skills`
- Windsurf: `~/.codeium/windsurf/skills`
- Amp: `~/.config/agents/skills`

### Windows
- Claude Code: `%USERPROFILE%\.claude\skills`
- GitHub Copilot: `%USERPROFILE%\.copilot\skills`
- Google Antigravity: `%USERPROFILE%\.gemini\antigravity\skills`
- Cursor: `%USERPROFILE%\.cursor\skills`
- OpenCode: `%USERPROFILE%\.config\opencode\skill`
- OpenAI Codex: `%USERPROFILE%\.codex\skills`
- Gemini CLI: `%USERPROFILE%\.gemini\skills`
- Windsurf: `%USERPROFILE%\.codeium\windsurf\skills`
- Amp: `%USERPROFILE%\.config\agents\skills`

## 🛠️ 系统要求

### macOS / Linux
- Bash 3.0+
- `rsync`（通常已预装）

### Windows
- PowerShell 5.0+（Windows 10+ 自带）

## 🤝 贡献

欢迎贡献！你可以：

- 报告 bug
- 提出新功能建议
- 添加对更多 AI 代理平台的支持
- 改进文档

## 📝 许可证

MIT 许可证 - 欢迎在你的项目中使用此工具！

## ⭐ Star 历史

如果你觉得这个工具有帮助，请考虑给它一个 star！

---

用 ❤️ 为 AI 编码社区打造
