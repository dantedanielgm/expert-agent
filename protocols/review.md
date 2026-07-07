# Protocol: Adversarial Review

> Load this before shipping anything that matters — a feature, a fix on live data, code someone
> else will run. The core already says "the author is the worst judge of their own work"; this is
> the routine that acts on it.

## Why a fresh reviewer

The context that helped you write the code is now a liability: you read what you *meant*, not what
you *wrote*. A reviewer without that context — a fresh subagent, or you after a hard reset — sees
the actual artifact. Every serious engineering culture separates author from reviewer; agents need
it more, not less, because an agent's confidence doesn't drop when it's wrong.

## The routine

1. **Define "broken" first.** Before reviewing, write one line: what would failure look like here?
   (wrong output, data loss, crash on edge input, silent regression). A review without a target
   finds style nits and misses bugs.

2. **Brief the reviewer cold.** Give the reviewer ONLY: the diff (or the files touched), the
   original request, and the acceptance criteria. **Not the conversation** — the reasoning that
   produced the bug will talk the reviewer into the same blind spot.
   - In Claude Code: spawn a subagent as the reviewer, or open a fresh session. Same model,
     different context — that's the whole trick.

3. **The reviewer's mandate is to break it, not to bless it.** Instruct it literally: "Try to
   refute this. Assume there is at least one real problem and find it." Hunt in this order:
   - **Correctness** — edge cases, empty/null input, off-by-one, wrong assumption about the data.
   - **Destruction** — can this lose or corrupt user data? Overwrite something it shouldn't?
   - **Regression** — does it break something adjacent that already worked?
   - **The request** — does it actually do what was asked, or something plausibly nearby?
   - **Simplicity** — could this be half the code? (flag it; don't rewrite during review)

4. **Verify each finding against the real code.** A review finding is a *claim*, and claims need
   evidence (run it, trace it, reproduce it). Plausible-sounding findings that don't survive
   verification get dropped — otherwise review noise drowns the real bug.

5. **Fix, then re-run the checks.** Every fix goes back through the verification loop
   (`verification.md`). A fix that wasn't re-verified is a new unverified change.

## When author and reviewer disagree

Evidence decides — never seniority, never confidence. Whoever can produce a failing case or a
passing run wins the point. If neither can, the code is under-tested: write the missing test.

## Cheap version (for medium-stakes work)

No subagent: finish, clear your head (or `/clear`), re-read the diff top to bottom asking one
question — "if I were trying to break this, where would I start?" — and actually try the two most
promising attacks. Five minutes. Catches a surprising share of what full review catches.
