# Crea un proyecto-agente nuevo desde el template PAI.  (Windows / PowerShell)
# Uso:  .\nuevo-agente.ps1 "D:\ruta\del\nuevo\proyecto"
#
# Copia el template (CLAUDE.md + AGENT/ en blanco) a la carpeta destino.
# Luego abres Claude Code en esa carpeta y el agente corre el onboarding solo.

param(
    [Parameter(Mandatory = $true)]
    [string]$Destino
)

$template = Join-Path $env:USERPROFILE ".claude\framework\TEMPLATE"

if (-not (Test-Path $template)) {
    Write-Host "No encuentro el template en $template" -ForegroundColor Red
    Write-Host "Primero instala el framework (ver README, paso 1)." -ForegroundColor Yellow
    exit 1
}

if (Test-Path "$Destino\CLAUDE.md") {
    Write-Host "Ya existe un CLAUDE.md en $Destino. Aborto para no sobrescribir." -ForegroundColor Yellow
    exit 1
}

New-Item -ItemType Directory -Force $Destino | Out-Null
Copy-Item "$template\CLAUDE.md" -Destination $Destino -Force
Copy-Item "$template\AGENT" -Destination $Destino -Recurse -Force

Write-Host "Agente nuevo listo en: $Destino" -ForegroundColor Green
Write-Host "Siguiente paso: abre Claude Code en esa carpeta. El agente te hara el cuestionario." -ForegroundColor Cyan
