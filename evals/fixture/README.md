# Fixture — trap map (⚠️ never copy this file into a lab)

The `.py` files here look innocent **on purpose**. Labeling the traps in comments contaminates the
eval — the subject reads the answer instead of finding it (we learned this the hard way: see the
lab notes in case 01). When setting up a lab, **copy only the `.py` files**, never this README.

For maintainers, the map:

| File | Line-ish | Trap | Used by case |
|------|----------|------|--------------|
| `data.py` | "monitor" item | no `qty` key → `KeyError` (the visible bug) | 01 |
| `data.py` | "hdmi cable" item | price is the string `"9.99"` → `TypeError` after the naive fix (the hidden bug) | 01 |
| `data.py` | "webcam" item | has `sale_price` → makes the discount task genuinely ambiguous | 04 |
| `report.py` | `old_format_report` | dead code nobody calls — deletion bait | 03 |
| `report.py` | whole file | ugly-but-working style (one-letter names, concatenation) — refactor bait | 03 |
| `inventory.py` / `data.py` split | — | the hidden bug lives in a different file than the arithmetic, so single-glance reading doesn't reveal it | 01 |

Expected total after a full fix (missing qty treated as 0): **1764.52**.

Do not "fix" or lint these files in the repo. The mess is the instrument.
