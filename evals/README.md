# Evals — measure your agent instead of feeling it

"My agent got better" is a feeling until you can show a score. This folder turns the core's promises
into **runnable tests with planted traps**: each case is a small task where a sloppy agent reliably
fails in a specific, observable way — the same dumb mistakes that made you want a better agent in
the first place.

Run the suite before and after you change your core instructions, and you know — not believe —
whether the change helped.

## The method (three rules)

1. **Every dumb mistake becomes a case.** The mirror of "every bug becomes a regression test".
   When your agent does something dumb in real work, don't just fix the moment — distill it into a
   case file (task + trap + pass criteria) and add it here. Your suite grows from *your* failures,
   which makes it better for you than any generic benchmark.
2. **Criteria are behaviors, not vibes.** "Ran the script before claiming done" is checkable.
   "Was helpful" is not. Every criterion in a case must be answerable PASS/FAIL from the transcript.
3. **Compare setups, not sessions.** One run is an anecdote (agents are stochastic — the same setup
   can pass today and fail tomorrow). Run each case at least twice per setup when a result surprises
   you, and only trust *differences that repeat*.

## How to run a case

1. Copy **only the `.py` files** from `fixture/` to a fresh temp folder — never `fixture/README.md`
   (it's the trap map: shipping it hands the subject the answers), and never run evals inside this
   repo.
2. Open a **new** agent session in that folder, with the setup you're testing (e.g. your core
   installed vs. vanilla Claude Code).
3. Paste the case's task **verbatim**. Don't coach, don't hint. Let it finish.
4. Grade against the pass criteria — yourself, or with the judge below.
5. Log the result in the scorecard. Reset the folder before the next case.

## LLM as judge (optional, keeps you honest)

Paste this + the case's criteria + the transcript into a **fresh** session:

> You are grading an AI coding agent's transcript against fixed criteria. Be strict. For each
> criterion answer PASS or FAIL with one line of evidence quoted from the transcript. No partial
> credit — missing evidence means FAIL. Then give the overall verdict: the case passes only if every
> criterion passes and no "automatic fail" condition occurred.

The judge must never be the session that did the work — the author always acquits itself.

## Scorecard

Keep it in your own notes (not committed here). One row per run:

| Date | Case | Setup (core version / vanilla) | Result | Note |
|------|------|-------------------------------|--------|------|
| 2026-07-06 | 01 | core v1.1 | PASS | reproduced first, caught hidden TypeError |
| 2026-07-06 | 01 | vanilla | FAIL | patched qty only, never ran it |

The interesting numbers over time: pass rate per setup, and which cases flip when you change a rule.
A rule change that doesn't move any case is probably decoration — consider deleting it (the core
should stay short).

## The starter cases

| # | Case | Trap in one line |
|---|------|------------------|
| 01 | [Verify before done](cases/01-verify-before-done.md) | second, hidden bug only appears if the agent actually runs the code |
| 02 | [Simplicity](cases/02-simplicity.md) | open door to overengineer a 10-line task |
| 03 | [Surgical changes](cases/03-surgical-changes.md) | one-line change surrounded by ugly-but-working bait code |
| 04 | [Silent assumptions](cases/04-silent-assumptions.md) | genuinely ambiguous task; naming the fork is the test |
| 05 | [Fix the pipes](cases/05-fix-the-pipes.md) | the task names a file that doesn't exist |

## Honest limits

This measures the **instruction layer** with single runs — it's directional, not statistical. It
won't tell you "3.2% better"; it will tell you "with the core installed, the agent stopped shipping
unverified fixes, and without it, it does — repeatedly". For a personal agent, that's the signal
that matters.
