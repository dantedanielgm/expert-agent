#!/usr/bin/env bash
# Crea un proyecto-agente nuevo desde el template PAI.  (macOS / Linux)
# Uso:  ./nuevo-agente.sh ~/ruta/del/nuevo/proyecto
#
# Copia el template (CLAUDE.md + AGENT/ en blanco) a la carpeta destino.
# Luego abres Claude Code en esa carpeta y el agente corre el onboarding solo.

set -euo pipefail

DESTINO="${1:-}"
if [ -z "$DESTINO" ]; then
  echo "Uso: ./nuevo-agente.sh <ruta-del-nuevo-proyecto>"
  exit 1
fi

TEMPLATE="$HOME/.claude/framework/TEMPLATE"

if [ ! -d "$TEMPLATE" ]; then
  echo "No encuentro el template en $TEMPLATE"
  echo "Primero instala el framework (ver README, paso 1)."
  exit 1
fi

if [ -f "$DESTINO/CLAUDE.md" ]; then
  echo "Ya existe un CLAUDE.md en $DESTINO. Aborto para no sobrescribir."
  exit 1
fi

mkdir -p "$DESTINO"
cp "$TEMPLATE/CLAUDE.md" "$DESTINO/"
cp -R "$TEMPLATE/AGENT" "$DESTINO/"

echo "Agente nuevo listo en: $DESTINO"
echo "Siguiente paso: abre Claude Code en esa carpeta. El agente te hara el cuestionario."
