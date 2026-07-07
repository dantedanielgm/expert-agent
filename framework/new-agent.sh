#!/usr/bin/env bash
# Create a new Expert Agent project from the template.  (macOS / Linux)
# Usage:  ./new-agent.sh ~/path/to/new/project
#
# Copies the template (CLAUDE.md loader + blank SPECIALTY.md) into the destination.
# Then open Claude Code there and the agent runs onboarding to set its specialty.

set -euo pipefail

DEST="${1:-}"
if [ -z "$DEST" ]; then
  echo "Usage: ./new-agent.sh <path-to-new-project>"
  exit 1
fi

TEMPLATE="$HOME/.claude/expert-agent/framework/TEMPLATE"

if [ ! -d "$TEMPLATE" ]; then
  echo "Template not found at $TEMPLATE"
  echo "Install Expert Agent first (see README, step 1)."
  exit 1
fi

if [ -f "$DEST/CLAUDE.md" ]; then
  echo "A CLAUDE.md already exists in $DEST. Aborting to avoid overwrite."
  exit 1
fi

mkdir -p "$DEST"
cp "$TEMPLATE/CLAUDE.md" "$DEST/"
cp "$TEMPLATE/SPECIALTY.md" "$DEST/"

echo "New agent ready at: $DEST"
echo "Next: open Claude Code there. The agent will ask what it should be expert in."
