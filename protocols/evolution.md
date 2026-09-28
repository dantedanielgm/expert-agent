# Evolution — the agent updates itself (like an OS)

> Load this when running the **radar** (on a schedule or when the user says "run the radar" / "what's new?"),
> right after a new Claude model ships, and **before building any new pipeline** (video, audio, images, apps).

An agent that never looks outside freezes on the day it was created. Tools, skills and best practices change
every week. The user should never discover by accident — in a random reel — something their own agent
should have brought them.

## The radar (what to check)

| Source | How | What you're looking for |
|---|---|---|
| Anthropic's YouTube channels `@claude` and `@anthropic-ai` (videos **and** shorts) | `yt-dlp --flat-playlist` to list; `--skip-download --write-auto-subs --sub-langs en` to get transcripts; `--print "%(description)s"` for demos without voice | new features, recommended practices, demos that inspire |
| Claude Code changelog | `https://raw.githubusercontent.com/anthropics/claude-code/main/CHANGELOG.md` | new commands, settings, skills, hooks |
| Most-installed / trending skills | `https://skills.sh` (or the `find-skills` skill) | a ready-made skill for something you're doing by hand |
| The specialty's own sources | listed in `SPECIALTY.md` under **Radar sources** (add them during onboarding) | what's moving in the user's field |

Window: everything new since the last radar. Never download videos — transcripts and metadata only.
Read-only on the web: no logging in, no posting, no buying.

## What you bring back (the report)

1. **What's new**, one short block per item, with date and source URL. Quote the key sentence.
2. **Proposed changes to me** — numbered, each one concrete: *what* changes (a line in CLAUDE.md, a new skill, a
   setting, a hook, a routine), *why* (the source), and *how to test it in ≤30 min*.
3. **Top 3 to try** for the user's own work.

## The rules

- **Propose, don't apply.** The user decides. Nothing is installed or rewritten without an explicit yes.
- **Applied changes leave a trace**: a dated line in memory (or `EVOLUTION.md` in the agent's folder) with the source.
  That log is how the user can *see* the agent evolving.
- **Recon before building.** Before writing your own pipeline, search whether a skill/tool already does it better.
  Hand-building what already exists is debt.
- **Every repeated mistake becomes a check or a skill** — a measurable verification step, not an apology.
- **New model → re-tune.** When a new Claude model ships, propose running `/doctor prompt-audit` (Claude Code ≥ 2.1.283)
  on CLAUDE.md, SPECIALTY.md and the skills, after backing them up.

## Scheduling it

A scheduled radar **only writes a report** — `RADAR-YYYY-MM-DD.md` in the agent's folder — and never applies
anything: nobody is watching the run, so the proposals wait there for the user's yes. Whatever the scheduler, it
must start **in the agent's folder**, so the run loads its CLAUDE.md, SPECIALTY.md and memory.

**Claude Code desktop:** create a scheduled task (weekly is enough) in the agent's folder, with the prompt:
*"Load ~/.claude/expert-agent/protocols/evolution.md, run the radar and save the report as RADAR-<today's date>.md.
Don't apply anything."*

**Terminal (CLI):** use the operating system's scheduler to run Claude headless (`claude -p`).

- Windows (Task Scheduler) — save this as `radar.ps1` in the agent's folder:
  ```powershell
  Set-Location $PSScriptRoot
  $today = Get-Date -Format "yyyy-MM-dd"
  claude -p "Load ~/.claude/expert-agent/protocols/evolution.md, run the radar and save the report as RADAR-$today.md. Don't apply anything." --allowedTools "Read,Write,WebFetch,Bash(yt-dlp:*)" *> "radar-$today.log"
  ```
  Register it once, then test it right away instead of waiting for Monday:
  ```powershell
  schtasks /create /tn "Expert-agent radar" /sc weekly /d MON /st 07:00 /tr "powershell -NoProfile -ExecutionPolicy Bypass -File C:\path\to\agent\radar.ps1"
  schtasks /run /tn "Expert-agent radar"
  ```
- macOS / Linux (cron): `0 7 * * 1 cd /path/to/agent && claude -p "<same prompt>" --allowedTools "Read,Write,WebFetch,Bash(yt-dlp:*)" > radar.log 2>&1`
- `--allowedTools` matters: a headless run has nobody to approve permissions, so grant only what the radar needs.
- The computer has to be on at that time. No report? Read the log.

**Not `/schedule`:** those routines run in Anthropic's cloud, not on the user's machine — they can't read
`~/.claude`, the agent's memory or its folders.

**No scheduler?** The user just says "run the radar" once a week. The agent should **offer** to set one of these
up during onboarding.
