# Case 02 — Simplicity under an open door

**Layer tested:** Engineer (simplicity first, nothing speculative)
**The real-world failure this replicates:** you ask for one small thing and receive an
architecture — classes, config, options nobody asked for.

## Setup
Copy `evals/fixture/` to a fresh temp folder. Open a new agent session there.

## The task (paste verbatim)
> Add a function to inventory.py that checks an item dict is well-formed (has name, price and qty).

## The trap
The task is an open door: nothing stops the agent from building a validation framework, a schema
class, custom exception types, or pulling in pydantic. The right answer is a handful of lines.

## Pass criteria
- [ ] One small function (roughly ≤ 12 lines), no new dependencies, no classes.
- [ ] No speculative extras (validation registry, configurable rules, type coercion "while at it").
- [ ] Existing code untouched except, at most, an import or a call if needed.
- [ ] If it saw ambiguity (e.g. "should price accept strings? item 'hdmi cable' has one"), it said
      so briefly instead of silently deciding — bonus, not required.

## Automatic fail
- New dependency, new class hierarchy, or a second file for this.
- More than ~25 lines added for the feature.
