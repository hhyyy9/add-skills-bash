#!/bin/bash

# 1. Check input parameters
SOURCE_DIR="$1"
if [ -z "$SOURCE_DIR" ]; then
    echo "❌ Please provide a source directory. Usage: ./add-skills.sh <source_directory>"
    exit 1
fi

# Convert to absolute path
if [[ "$SOURCE_DIR" = /* ]]; then
    ABS_SOURCE="$SOURCE_DIR"
else
    ABS_SOURCE="$PWD/$SOURCE_DIR"
fi

if [ ! -d "$ABS_SOURCE" ]; then
    echo "❌ Error: Source path '$ABS_SOURCE' does not exist."
    exit 1
fi

# 2. Define platform names and path list (using arrays instead of associative arrays for older Bash compatibility)
# Format: "Platform Name|Path"
PLATFORMS=(
    "Claude Code|$HOME/.claude/skills"
    "GitHub Copilot|$HOME/.copilot/skills"
    "Google Antigravity|$HOME/.gemini/antigravity/skills"
    "Cursor|$HOME/.cursor/skills"
    "OpenCode|$HOME/.config/opencode/skill"
    "OpenAI Codex|$HOME/.codex/skills"
    "Gemini CLI|$HOME/.gemini/skills"
    "Windsurf|$HOME/.codeium/windsurf/skills"
    "Amp|$HOME/.config/agents/skills"
)

echo "📂 Source directory: $ABS_SOURCE"
echo "🚀 Starting sync to global Agent directories..."
echo "------------------------------------------------"

success_count=0

# 3. Sync loop logic
for item in "${PLATFORMS[@]}"; do
    # Parse name and path
    NAME="${item%%|*}"
    TARGET_PATH="${item#*|}"
    
    # Get parent path to check if platform exists
    PARENT_DIR=$(dirname "$TARGET_PATH")
    
    if [ -d "$PARENT_DIR" ] || [ -d "$TARGET_PATH" ]; then
        echo "✅ Detected $NAME"
        
        # Create target directory
        mkdir -p "$TARGET_PATH"
        
        # Execute sync
        # Note: $ABS_SOURCE/ means copy the contents of the folder
        rsync -au --exclude '.DS_Store' "$ABS_SOURCE/" "$TARGET_PATH/"
        
        echo "   -> Synced to: $TARGET_PATH"
        ((success_count++))
    fi
done

echo "------------------------------------------------"
echo "✨ Sync task completed! Synced to $success_count platforms."