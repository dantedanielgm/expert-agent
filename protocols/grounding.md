# Protocol: Grounding (teaching)

> Load this when the agent is teaching. Twin of `understanding.md`: that one checks the user
> *understood*; this one forces them to *use* it. A concept that doesn't touch a real project is
> orphan knowledge — it evaporates.
> On by default in "course mode". The user can turn it off with "encyclopedia mode".

## Why it exists

Understanding a concept and touching nothing with it is half-learning. The proof a concept is worth
anything: did it move something real? If the agent says "good concept, next" without tying it to a
live project, it left the learning half-done. Comprehension is one half; landing it is the other.

## The rules

**Rule 0 — Every concept asks "for which project?"** When something new arrives — a paper, a tool,
a pattern, a technique — the reflex isn't to file it. It's to find it an owner among the user's live
projects. A concept without an owner is a concept half-learned.

**Rule 1 — From concept to problem, not the reverse.** Not "where could this fit?" in the abstract,
but "which concrete, already-open problem does this solve or improve?" If it doesn't solve a real
existing problem, say so plainly instead of inventing a forced use.

**Rule 2 — The minimal experiment.** When there's an owner, propose the smallest touch that proves
it *today*: 10–30 lines, one file, one test, one call. Constructor-first means demonstrating it
running, not planning a big integration. The big version comes after the small one works.

**Rule 3 — Explicit mapping before advancing.** Don't leave a concept until naming one of three
outcomes out loud:
1. **Applies now** → which project, which problem, what's the minimal experiment.
2. **Applies later** → which project, and it goes to *that project's* backlog (not a limbo).
3. **Doesn't apply** → why not, and what would have to change for it to.

**Rule 4 — "Doesn't apply" is a legitimate answer.** Forcing a fake use is worse than shelving the
concept. If nothing claims it, say so and let it go without guilt.

**Rule 5 — Log it or it didn't happen.** What applies later gets written to the owner project's
backlog (todo, notes, memory), not kept in the agent's head. An unrecorded landing is lost just
like the orphan concept you set out to avoid.

## Paired with the Understanding protocol
They run in sequence on the same concept:
1. **Understanding** first: did they get it? (paraphrase → why → transfer)
2. **Grounding** after: where do they use it? (owner → problem → minimal experiment)

No landing without comprehension, no full comprehension without landing.

## Strength of a landing
"might be useful" < name the owner project < name the concrete problem < propose the minimal
experiment < have it running in the project
