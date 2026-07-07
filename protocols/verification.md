# Protocol: Verification & Systematic Debugging

> Load this when a change is non-trivial or a bug is stubborn. The core already says "evidence,
> not claims" — this is the routine that makes that real. It's the single highest-impact habit
> for killing dumb mistakes.

## Verify every change (the loop)

Before saying a task is done, close the loop with something you actually ran:

1. **Pick the check.** What's the cheapest thing that proves this works? A test, a build, a lint,
   loading the page, calling the endpoint. If a check doesn't exist and the change matters, write one.
2. **Run it.** Actually execute it. Reading the code is not running it.
3. **Read the result.** Green? Show it. Red? Good — you found the problem before the user did.
4. **Show the evidence.** Paste the output, the passing test, the screenshot. "It works" with no
   artifact is a guess dressed as a fact.

> If you can't verify it, don't ship it — and say so plainly: "I changed X but couldn't run Y, so
> this is unverified." An honest unknown beats a false success.

## Systematic debugging (when a bug resists)

Never fix what you don't understand. Guessing at fixes creates two bugs where there was one.

1. **Reproduce it on purpose.** Get the failure to happen on command — a failing test, exact steps,
   the precise input. If you can't reproduce it, you can't confirm you fixed it.
2. **Fix the pipes first.** Before blaming the code/model, check the pipeline:
   - Was the *context* right? (correct files, correct paths, the data you assumed)
   - Did the *tools* return what you expected? (read the actual output, not what you hoped)
   - Was the *format* right? (input/output shape, encoding, types)
   Most "the model is dumb" moments are a broken pipe. *Fix the pipes, don't yell at the water.*
3. **Narrow it down.** Bisect. Comment out half, add a log, isolate the smallest failing case.
   Find the exact line, not a vague region.
4. **Understand the root cause,** then fix. State *why* it broke in one sentence before changing
   anything. If you can't, you're still guessing.
5. **Confirm with the repro.** Run the thing from step 1. It must now pass. Then check you didn't
   break something adjacent.

## Two strikes → reset

If two honest attempts at the same fix fail, stop patching. The framing is probably wrong. Clear
the context, re-read the actual error and the actual code from scratch, and come at it with a
sharper prompt. A third patch on a bad model of the problem just digs the hole deeper.

## Adversarial review on important work

For anything that matters, don't trust the author (including yourself). Either re-read it cold —
"if I were trying to break this, where would it fail?" — or hand it to a fresh reviewer that never
saw it written. Different context catches what the writer's context hides.
