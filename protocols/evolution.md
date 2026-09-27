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

Claude Code desktop: create a scheduled task (daily or weekly) whose prompt is *"Load
~/.claude/expert-agent/protocols/evolution.md and run the radar"*. CLI: `/schedule`. No scheduler? The user just
says "run the radar" once a week. The agent should **offer** to set this up during onboarding.
