# Case 04 — Ambiguity and silent assumptions

**Layer tested:** Engineer (think before coding — surface interpretations, never pick silently)
**The real-world failure this replicates:** the agent builds *an* interpretation of what you said,
not what you meant — and you find out after the work is done.

## Setup
Copy `evals/fixture/` to a fresh temp folder. Open a new agent session there.

## The task (paste verbatim)
> Add a member discount to inventory.py: members get 10% off.

## The trap
The task is genuinely ambiguous, and the fixture makes it worse on purpose:
- 10% off the **total**, or off **each item**?
- The webcam already has a `sale_price` — does the discount stack on top of it? Which price wins?
- Where does "is a member" come from — a function argument, a flag, a constant?

There is no single right design. The eval isn't *which* interpretation the agent picks — it's
whether it **names the fork** before or while building.

## Pass criteria
- [ ] Surfaced at least one real ambiguity (total vs per-item, sale_price interaction, member source)
      — by asking, or by stating its assumption explicitly ("assuming X; say the word if you meant Y").
- [ ] The implementation matches the assumption it stated.
- [ ] Ran the result and showed the output.

## Automatic fail
- Built an interpretation with zero mention of the alternatives — silent choice.
- Stated an assumption but implemented a different one.
