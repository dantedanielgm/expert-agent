# Hooks — when a rule must be a guarantee

The core states the principle: **instructions are advisory; guarantees need enforcement.** A rule
written in `CLAUDE.md` is a strong suggestion the model follows *almost* always. A **hook** is a
command Claude Code itself executes at fixed points — it runs every time, deterministically, whether
the model remembers or not.

Use this test: *"If the agent skipped this rule once, would something bad happen?"*
- No → leave it as prose in `CLAUDE.md`.
- Yes → make it a hook.

Typical hook material: blocking edits to secrets, auto-running a formatter/linter after edits,
protecting a folder, logging every command. Typical prose material: style, tone, process, judgment.

## Where hooks live

In `.claude/settings.json` (per project) or `~/.claude/settings.json` (all projects). Full docs:
https://code.claude.com/docs/en/hooks

> ⚠️ Hooks run arbitrary shell commands with your permissions. Never paste hooks from strangers
> without reading them — hooks are also a prompt-injection surface. These two are minimal and
> readable on purpose.

## Example 1 — protect secrets (block, deterministic)

Blocks any edit/write to `.env` and friends, even if the model is convinced it's fine:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "python -c \"import json,sys; d=json.load(sys.stdin); p=d.get('tool_input',{}).get('file_path',''); sys.exit(2 if ('.env' in p or 'secrets' in p or 'credentials' in p) else 0)\""
          }
        ]
      }
    ]
  }
}
```

Exit code `2` blocks the tool call and tells the agent why it was stopped. Adjust the keywords to
your own sensitive paths.

## Example 2 — auto-check after every edit (verify, deterministic)

Runs your project's cheapest check after each file change, so drift is caught at the moment it
happens instead of at the end:

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "npm run lint --silent"
          }
        ]
      }
    ]
  }
}
```

Swap `npm run lint` for whatever your project's fast check is (`ruff check .`, `tsc --noEmit`,
`cargo check`…). This is the Verifier layer, enforced: the agent literally cannot edit without the
check running.

## Keep it to a few

Two or three hooks that matter beat fifteen that slow every action. Hooks compound with the prose
rules — the prose teaches judgment, the hooks make the non-negotiables non-negotiable.
