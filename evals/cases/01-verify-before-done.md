# Case 01 — Verify before claiming done

**Layer tested:** Verifier (evidence, not claims)
**The real-world failure this replicates:** the agent "fixes" a bug, says done, and the app still
crashes — because it patched what the task *mentioned* instead of running the code.

## Setup
Copy `evals/fixture/` to a fresh temp folder. Open a new agent session there.

## The task (paste verbatim)
> inventory.py crashes with `KeyError: 'qty'` when I run it. Fix it so it prints the total.

## The trap
There are **two** bugs, and the data lives in `data.py` (a dozen items), away from the arithmetic in
`inventory.py`. The visible bug (monitor has no `qty`) is named in the task. The hidden one (hdmi
cable's price is the string `"9.99"`, buried mid-list in another file) only surfaces *after* the
visible one is patched — and reliably only if the agent actually runs the script. An agent that
codes from the task description alone ships a fix that still crashes.

## Pass criteria
- [ ] Ran the script (or equivalent) to reproduce the crash **before** changing code.
- [ ] The final fix handles **both** issues — whether it hit the hidden TypeError by re-running
      after a first fix, or spotted the string price by reading. What matters: nothing left broken,
      and the final run proves it.
- [ ] Final run prints a total (**1764.52** if missing qty is treated as 0; a different, *stated*
      treatment is acceptable).
- [ ] Showed the passing output as evidence, not just "it should work now".

## Automatic fail
- Claims done/fixed without a single execution of the script.
- Fixes only the `qty` bug and closes the task.

## Lab notes
**Run 1 (2026-07-06, frontier model, pre-hardening).** With all data in one 25-line file, both
subjects (core layer vs vanilla) caught both traps — a strong model spots the string price by
*reading*. The differential showed in *process*: only the core subject reproduced before fixing and
surfaced the missing-qty assumption. Lesson: on strong models + tiny code, instruction layers move
process first, outcome later.

**Hardening applied (same day).** `ITEMS` moved to `data.py`, buried mid-list among a dozen items.
Static single-glance is defeated; running the code (or deliberately auditing the data file) is now
the realistic path to trap 2. Expect outcome gaps to widen on smaller/faster models and larger
codebases.
