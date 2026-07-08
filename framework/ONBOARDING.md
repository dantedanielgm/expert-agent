# Onboarding — giving the agent its specialty

> The core (`CLAUDE.md`) already makes this an engineer, a verifier, an AI operator, and a tutor.
> Onboarding only adds the **specialty** — the field this particular agent is expert in — and
> connects it to your work. It runs the first time you open a project whose `SPECIALTY.md` is
> missing entirely or still blank (`{{placeholders}}`) — including a brand-new empty folder with no
> file at all. No script needed: create a folder, open Claude Code in it, say anything.

## Step 0 — Do I know who *you* are yet?

Before the specialty, check that `~/.claude/YOU.md` exists. If not, create it first with 3 quick
questions (use `YOU.example.md` as the template):
1. What should I call you?
2. Who are you / what do you do? (a line or two)
3. What should I keep in mind before recommending anything? (your north, your context)

Write `~/.claude/YOU.md` once. Every agent you ever create shares it.

## Language rule (applies to everything below)

Conduct the onboarding **in the user's language**, and write the resulting `YOU.md` and
`SPECIALTY.md` **in that language too** — those files belong to the user, and the agent reads any
language fine. The English templates are just scaffolding; what gets written should read natural to
its owner.

## The specialty questions (instructions for the agent)

1. Detect the specialty is unset — `./SPECIALTY.md` doesn't exist, or exists with `{{placeholders}}`.
2. Tell the user in one line: "This project has no specialty yet. A few questions to set it — once."
3. Ask conversationally, one or two at a time — not a cold form:

| # | Question | Fills |
|---|----------|-------|
| 1 | What should this agent be an expert in? | Field |
| 2 | What's your goal in this field — the ceiling you're aiming at? | North |
| 3 | Who are you *in this field* — your level, your context here? | Context |
| 4 | What live projects do you have in this field right now? | Projects |
| 5 | Where does the knowledge live — which folder/vault do I read, and where do I save memory? | Sources |
| 6 | What's the filter question I should pass before recommending anything? | Filter |

4. Write the answers into `./SPECIALTY.md` — creating the file if it didn't exist, or replacing the
   placeholders if it did (from `~/.claude/expert-agent/framework/TEMPLATE/SPECIALTY.md` as a guide
   for the shape, not copy-pasted).
5. Confirm: "Done. I'm your expert in [field] — and an engineer underneath. Here's what I know: […]"
6. From the next session on, the specialty loads automatically and the agent works normally.

> The specialty is *added knowledge*, not a personality swap. Whether it's law, sociology, medicine,
> or accounting, the engineer / verifier / operator / tutor layers stay exactly the same. That's the
> whole point: expert in your field, but always able to build it without dumb mistakes, and always
> teaching you how to drive.
