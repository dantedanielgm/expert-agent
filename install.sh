#!/usr/bin/env bash
# Expert Agent — one-command installer (macOS / Linux)
# Run:  curl -fsSL https://raw.githubusercontent.com/dantedanielgm/expert-agent/main/install.sh | sh
#
# Downloads Expert Agent and installs it into ~/.claude. No git, no manual copying.
# Safe: backs up an existing CLAUDE.md, never overwrites your YOU.md.

set -euo pipefail
REPO="dantedanielgm/expert-agent"
CLAUDE="$HOME/.claude"

echo ""
echo "Installing Expert Agent into $CLAUDE"

if ! command -v claude >/dev/null 2>&1; then
  echo "  Note: Claude Code doesn't seem to be installed yet."
  echo "  You'll need it to use this: https://claude.com/claude-code"
fi

# 1. Download the repo as a tarball (no git required)
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
echo "  Downloading..."
curl -fsSL "https://github.com/$REPO/archive/refs/heads/main.tar.gz" -o "$TMP/ea.tar.gz"
tar -xzf "$TMP/ea.tar.gz" -C "$TMP"
SRC="$TMP/expert-agent-main"

# 2. Ensure ~/.claude exists
mkdir -p "$CLAUDE"

# 3. Core — back up any existing CLAUDE.md before replacing
if [ -f "$CLAUDE/CLAUDE.md" ]; then
  cp "$CLAUDE/CLAUDE.md" "$CLAUDE/CLAUDE.md.bak"
  echo "  Your existing CLAUDE.md was saved as CLAUDE.md.bak"
fi
cp "$SRC/CLAUDE.md" "$CLAUDE/CLAUDE.md"

# 4. YOU.md — create only if missing (never clobber your identity)
if [ ! -f "$CLAUDE/YOU.md" ]; then
  cp "$SRC/YOU.example.md" "$CLAUDE/YOU.md"
  echo "  Created YOU.md"
else
  echo "  YOU.md already exists — left untouched"
fi

# 5. Protocols, hooks, framework (loaded on demand)
mkdir -p "$CLAUDE/expert-agent"
cp -R "$SRC/protocols" "$SRC/hooks" "$SRC/framework" "$CLAUDE/expert-agent/"

echo ""
echo "Done."
echo "Next:"
echo "  1. Open a NEW folder for your agent (e.g. a folder called 'my-agent')."
echo "  2. Open Claude Code inside that folder."
echo "  3. It will ask what you want it to be an expert in. Answer, and you're set."
echo ""
echo "  (It speaks your language — just talk to it however you talk.)"
