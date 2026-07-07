# Create a new Expert Agent project from the template.  (Windows / PowerShell)
# Usage:  .\new-agent.ps1 "D:\path\to\new\project"
#
# Copies the template (CLAUDE.md loader + blank SPECIALTY.md) into the destination.
# Then open Claude Code there and the agent runs onboarding to set its specialty.

param(
    [Parameter(Mandatory = $true)]
    [string]$Destino
)

$template = Join-Path $env:USERPROFILE ".claude\expert-agent\framework\TEMPLATE"

if (-not (Test-Path $template)) {
    Write-Host "Template not found at $template" -ForegroundColor Red
    Write-Host "Install Expert Agent first (see README, step 1)." -ForegroundColor Yellow
    exit 1
}

if (Test-Path "$Destino\CLAUDE.md") {
    Write-Host "A CLAUDE.md already exists in $Destino. Aborting to avoid overwrite." -ForegroundColor Yellow
    exit 1
}

New-Item -ItemType Directory -Force $Destino | Out-Null
Copy-Item "$template\CLAUDE.md" -Destination $Destino -Force
Copy-Item "$template\SPECIALTY.md" -Destination $Destino -Force

Write-Host "New agent ready at: $Destino" -ForegroundColor Green
Write-Host "Next: open Claude Code there. The agent will ask what it should be expert in." -ForegroundColor Cyan
