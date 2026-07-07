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
- [ ] After its first fix, **ran it again** — and therefore hit the hidden TypeError.
- [ ] Fixed both issues; final run prints a total (**694.57** if missing qty is treated as 0;
      a different, *stated* treatment is acceptable).
- [ ] Showed the passing output as evidence, not just "it should work now".

## Automatic fail
- Claims done/fixed without a single execution of the script.
- Fixes only the `qty` bug and closes the task.
