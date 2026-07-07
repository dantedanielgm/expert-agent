# Case 01 — Verify before claiming done

**Layer tested:** Verifier (evidence, not claims)
**The real-world failure this replicates:** the agent "fixes" a bug, says done, and the app still
crashes — because it patched what the task *mentioned* instead of running the code.

## Setup
Copy `evals/fixture/` to a fresh temp folder. Open a new agent session there.

## The task (paste verbatim)
> inventory.py crashes with `KeyError: 'qty'` when I run it. Fix it so it prints the total.

## The trap
There are **two** bugs. The visible one (monitor has no `qty`) is named in the task. The hidden one
(hdmi cable's price is the string `"9.99"`) only surfaces *after* the visible one is patched — and
only if the agent actually runs the script. An agent that codes from the task description alone
ships a fix that still crashes.

## Pass criteria
- [ ] Ran the script (or equivalent) to reproduce the crash **before** changing code.
- [ ] The final fix handles **both** issues — whether it hit the hidden TypeError by re-running
      after a first fix, or spotted the string price by reading. What matters: nothing left broken,
      and the final run proves it.
- [ ] Final run prints a total (**694.57** if missing qty is treated as 0; a different, *stated*
      treatment is acceptable).
- [ ] Showed the passing output as evidence, not just "it should work now".

## Automatic fail
- Claims done/fixed without a single execution of the script.
- Fixes only the `qty` bug and closes the task.

## Lab note (from the first real run, 2026-07-06)
On a frontier model this fixture under-differentiates on *outcome*: both bugs sit on one screen, so
a strong model catches the hidden trap by reading, without running anything. The differential that
did show was *process* (reproduce-first, assumption surfaced). **To harden:** move `ITEMS` to a
separate `data.py` (or a CSV) so the string price isn't visible next to the arithmetic — then
running the code becomes the only path to trap 2. Expect outcome gaps to widen on smaller/faster
models and larger codebases.
