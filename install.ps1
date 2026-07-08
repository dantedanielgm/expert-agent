# Expert Agent — one-command installer (Windows / PowerShell)
# Run:  irm https://raw.githubusercontent.com/dantedanielgm/expert-agent/main/install.ps1 | iex
#
# Downloads Expert Agent and installs it into ~/.claude. No git, no manual copying.
# Safe: backs up an existing CLAUDE.md, never overwrites your YOU.md.

$ErrorActionPreference = "Stop"
$repo   = "dantedanielgm/expert-agent"
$claude = Join-Path $env:USERPROFILE ".claude"

Write-Host ""
Write-Host "Installing Expert Agent into $claude" -ForegroundColor Cyan

# Prerequisite check (a warning, not a blocker)
if (-not (Get-Command claude -ErrorAction SilentlyContinue)) {
    Write-Host "  Note: Claude Code doesn't seem to be installed yet." -ForegroundColor Yellow
    Write-Host "  You'll need it to use this: https://claude.com/claude-code" -ForegroundColor Yellow
}

# 1. Download the repo as a zip (no git required)
$tmp = Join-Path $env:TEMP "expert-agent-install"
if (Test-Path $tmp) { Remove-Item -Recurse -Force $tmp }
New-Item -ItemType Directory -Force $tmp | Out-Null
$zip = Join-Path $tmp "ea.zip"
Write-Host "  Downloading..." -ForegroundColor Gray
Invoke-WebRequest -Uri "https://github.com/$repo/archive/refs/heads/main.zip" -OutFile $zip
Expand-Archive -Path $zip -DestinationPath $tmp -Force
$src = Join-Path $tmp "expert-agent-main"

# 2. Ensure ~/.claude exists
New-Item -ItemType Directory -Force $claude | Out-Null

# 3. Core — back up any existing CLAUDE.md before replacing
$coreDst = Join-Path $claude "CLAUDE.md"
if (Test-Path $coreDst) {
    Copy-Item $coreDst "$coreDst.bak" -Force
    Write-Host "  Your existing CLAUDE.md was saved as CLAUDE.md.bak" -ForegroundColor Yellow
}
Copy-Item (Join-Path $src "CLAUDE.md") $coreDst -Force

# 4. YOU.md — create only if missing (never clobber your identity)
$youDst = Join-Path $claude "YOU.md"
if (-not (Test-Path $youDst)) {
    Copy-Item (Join-Path $src "YOU.example.md") $youDst -Force
    Write-Host "  Created YOU.md" -ForegroundColor Green
} else {
    Write-Host "  YOU.md already exists — left untouched" -ForegroundColor Yellow
}

# 5. Protocols, hooks, framework (loaded on demand)
$eaDst = Join-Path $claude "expert-agent"
New-Item -ItemType Directory -Force $eaDst | Out-Null
foreach ($d in @("protocols", "hooks", "framework")) {
    Copy-Item (Join-Path $src $d) $eaDst -Recurse -Force
}

Remove-Item -Recurse -Force $tmp

Write-Host ""
Write-Host "Done." -ForegroundColor Green
Write-Host "Next:"
Write-Host "  1. Open a NEW folder for your agent (e.g. a folder called 'my-agent')."
Write-Host "  2. Open Claude Code inside that folder."
Write-Host "  3. It will ask what you want it to be an expert in. Answer, and you're set."
Write-Host ""
Write-Host "  (It speaks your language — just talk to it however you talk.)" -ForegroundColor Gray
