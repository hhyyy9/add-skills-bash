# Agent Skills Sync Tool

[中文文档](README_CN.md) | English

A cross-platform tool to sync your skills directory to all known AI agent platforms automatically.

## 🌟 Features

- 🚀 One-command sync to multiple AI agent platforms
- 🔍 Auto-detects installed platforms
- 📦 Supports 9+ popular AI coding assistants
- 💻 Cross-platform: macOS/Linux (Bash) and Windows (PowerShell)
- ⚡ Incremental sync - only updates changed files
- 🎯 Simple and lightweight

## 📋 Supported Platforms

- Claude Code
- GitHub Copilot
- Google Antigravity
- Cursor
- OpenCode
- OpenAI Codex
- Gemini CLI
- Windsurf
- Amp

## 🚀 Quick Start

### macOS / Linux

```bash
# Make the script executable
chmod +x add-skills.sh

# Sync your skills directory
./add-skills.sh /path/to/your/skills
```

### Windows

```powershell
# Run PowerShell script
.\add-skills.ps1 C:\path\to\your\skills
```

## 📖 Usage

### Basic Usage

**Bash (macOS/Linux):**
```bash
./add-skills.sh <source_directory>
```

**PowerShell (Windows):**
```powershell
.\add-skills.ps1 <source_directory>
```

### Examples

**Sync a local skills folder:**
```bash
# macOS/Linux
./add-skills.sh ./my-skills

# Windows
.\add-skills.ps1 .\my-skills
```

**Sync from an absolute path:**
```bash
# macOS/Linux
./add-skills.sh /Users/username/projects/skills

# Windows
.\add-skills.ps1 C:\Users\username\projects\skills
```

## 🔧 How It Works

1. **Validates** the source directory exists
2. **Detects** which AI agent platforms are installed on your system
3. **Creates** target directories if they don't exist
4. **Syncs** files incrementally (only updates changed files)
5. **Reports** the number of platforms successfully synced

## 📂 Default Platform Paths

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

## 🛠️ Requirements

### macOS / Linux
- Bash 3.0+
- `rsync` (usually pre-installed)

### Windows
- PowerShell 5.0+ (included in Windows 10+)

## 🤝 Contributing

Contributions are welcome! Feel free to:

- Report bugs
- Suggest new features
- Add support for more AI agent platforms
- Improve documentation

## 📝 License

MIT License - feel free to use this tool in your projects!

## ⭐ Star History

If you find this tool helpful, please consider giving it a star!

---

Made with ❤️ for the AI coding community
