# PowerShell script to sync skills directory to all known agent platforms

# 1. Check input parameters
param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$SourceDir
)

# Convert to absolute path
if ([System.IO.Path]::IsPathRooted($SourceDir)) {
    $AbsSource = $SourceDir
} else {
    $AbsSource = Join-Path $PWD $SourceDir
}

if (-not (Test-Path -Path $AbsSource -PathType Container)) {
    Write-Host "❌ Error: Source path '$AbsSource' does not exist." -ForegroundColor Red
    exit 1
}

# 2. Define platform names and paths
# Using hashtable for better readability in PowerShell
$Platforms = @{
    "Claude Code" = "$env:USERPROFILE\.claude\skills"
    "GitHub Copilot" = "$env:USERPROFILE\.copilot\skills"
    "Google Antigravity" = "$env:USERPROFILE\.gemini\antigravity\skills"
    "Cursor" = "$env:USERPROFILE\.cursor\skills"
    "OpenCode" = "$env:USERPROFILE\.config\opencode\skill"
    "OpenAI Codex" = "$env:USERPROFILE\.codex\skills"
    "Gemini CLI" = "$env:USERPROFILE\.gemini\skills"
    "Windsurf" = "$env:USERPROFILE\.codeium\windsurf\skills"
    "Amp" = "$env:USERPROFILE\.config\agents\skills"
}

Write-Host "📂 Source directory: $AbsSource" -ForegroundColor Cyan
Write-Host "🚀 Starting sync to global Agent directories..." -ForegroundColor Cyan
Write-Host "------------------------------------------------"

$successCount = 0

# 3. Sync loop logic
foreach ($platform in $Platforms.GetEnumerator()) {
    $name = $platform.Key
    $targetPath = $platform.Value
    
    # Get parent path to check if platform exists
    $parentDir = Split-Path -Parent $targetPath
    
    if ((Test-Path -Path $parentDir) -or (Test-Path -Path $targetPath)) {
        Write-Host "✅ Detected $name" -ForegroundColor Green
        
        # Create target directory if it doesn't exist
        if (-not (Test-Path -Path $targetPath)) {
            New-Item -ItemType Directory -Path $targetPath -Force | Out-Null
        }
        
        # Execute sync
        # Copy all items from source to target, excluding .DS_Store files
        Get-ChildItem -Path $AbsSource -Recurse | Where-Object {
            $_.Name -ne '.DS_Store'
        } | ForEach-Object {
            $relativePath = $_.FullName.Substring($AbsSource.Length)
            $destination = Join-Path $targetPath $relativePath
            
            if ($_.PSIsContainer) {
                # Create directory if it doesn't exist
                if (-not (Test-Path -Path $destination)) {
                    New-Item -ItemType Directory -Path $destination -Force | Out-Null
                }
            } else {
                # Copy file only if it's newer or doesn't exist
                $destDir = Split-Path -Parent $destination
                if (-not (Test-Path -Path $destDir)) {
                    New-Item -ItemType Directory -Path $destDir -Force | Out-Null
                }
                
                if (-not (Test-Path -Path $destination) -or 
                    ($_.LastWriteTime -gt (Get-Item $destination).LastWriteTime)) {
                    Copy-Item -Path $_.FullName -Destination $destination -Force
                }
            }
        }
        
        Write-Host "   -> Synced to: $targetPath" -ForegroundColor Gray
        $successCount++
    }
}

Write-Host "------------------------------------------------"
Write-Host "✨ Sync task completed! Synced to $successCount platforms." -ForegroundColor Green
