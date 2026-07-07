# Expert Agent

**A personal expert agent for Claude Code.** Expert in your field — law, sociology, medicine,
accounting, whatever you do — but an **engineer underneath** no matter the field, and it **teaches
you how to work with it** as it works.

Not an app or a library. A small set of instruction files Claude Code reads. Zero dependencies.

*(Español: [README.es.md](README.es.md))*

---

## The idea

Most people open Claude Code to *build* something — and inside Claude Code, the way you build
anything is code. So no matter how specialized your agent is, it should always carry three fixed
layers, plus one you define:

1. **Engineer** — how it writes code: think first, keep it simple, surgical changes, goal-driven.
2. **Verifier** — how it proves the work before claiming done: evidence not claims, git as safety
   net, reproduce before fixing, *fix the pipes not the model*. **This is the layer that kills the
   dumb mistakes** — the one most setups skip.
3. **AI operator** — how it runs itself (context, memory, models) and shows you how to drive it.
4. **Specialist** — the variable layer. Set once, by answering a few onboarding questions.

The first three live in one short, dense core (`CLAUDE.md`) shared by every agent you create. The
specialty is a single file on top. Deep, situational knowledge (teaching protocols, advisor lenses)
loads **on demand** — it never bloats the core, because a bloated context makes the model *ignore*
your instructions.

```
~/.claude/
├── CLAUDE.md          ← the core (engineer + verifier + operator + tutor)
├── YOU.md             ← who you are (filled once)
└── expert-agent/
    ├── protocols/     ← loaded on demand (verification, teaching)
    └── framework/     ← onboarding, advisors, project template

<a-project>/
├── CLAUDE.md          ← loads the core
└── SPECIALTY.md       ← what this agent is expert in
```

---

## Install (3 steps)

**Requirement:** [Claude Code](https://claude.com/claude-code) installed.

### 1. Put the core in your `~/.claude/`

```bash
git clone https://github.com/dantedanielgm/expert-agent.git
cd expert-agent

cp CLAUDE.md        ~/.claude/CLAUDE.md      # the core
cp YOU.example.md   ~/.claude/YOU.md         # who you are
mkdir -p ~/.claude/expert-agent
cp -R protocols framework ~/.claude/expert-agent/
```
> Windows (PowerShell): replace `~/.claude` with `$env:USERPROFILE\.claude`, `cp` with `Copy-Item`.

### 2. Tell it who you are

Open `~/.claude/YOU.md` and fill it in — or leave it blank and the agent asks you 3 questions the
first time it runs.

### 3. Give an agent its specialty

```bash
# macOS / Linux
~/.claude/expert-agent/framework/new-agent.sh ~/agents/legal

# Windows (PowerShell)
~/.claude/expert-agent/framework/new-agent.ps1 "C:\agents\legal"
```

Open Claude Code in that folder. It has no specialty yet, so it asks what it should be expert in,
your goal, your projects, where your documents live, and its decision filter — then writes its
`SPECIALTY.md`. From the next session on, it's your expert in that field. Repeat for each field you
want covered — the engineer/verifier/operator/tutor layers come free every time.

---

## Just want Claude Code to stop breaking your code?

You don't need the whole thing. See [`packs/coding`](packs/coding/) — a single `CLAUDE.md` you drop
into your project root that gives Claude Code the discipline (think first, surgical changes, verify
before saying "done") plus context about your app. One file, zero setup.

---

## Influences

This is a synthesis, and it's honest about its lineage. It takes the ideas that have real evidence
or adoption behind them and folds them into one model — the rules themselves are written clean,
without names, because names are noise to the agent that reads them. The thinking draws on:

- **Andrej Karpathy** — the code-discipline guidelines (think before coding, surgical changes).
- **Anthropic** — official Claude Code best practices: verification as the #1 ingredient, short
  pruned instructions over bloat, progressive disclosure, hooks for what must be deterministic.
- **12-Factor Agents** (HumanLayer) — own your context and your prompts; a few small, understandable
  files beat a giant borrowed framework.
- **Superpowers** (Jesse Vincent) — no code without an approved plan, reproduce-before-fix,
  adversarial review by a fresh reviewer.
- **PAI / LifeOS** (Daniel Miessler) — the identity + persistent-memory architecture for a
  personal agent.

If you know the field, you'll recognize the parts. Knowing your sources is what makes it a synthesis
and not a copy.

---

## Privacy

This repo holds only the **method** and **blank templates**. Your identity (`YOU.md`) and each
agent's specialty (filled `SPECIALTY.md`) live in your `~/.claude` and your folders — never here. If
you fork or publish your own version, don't commit your filled files.

## License

MIT. Use it, change it, share it.
