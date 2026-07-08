# Protocol: Knowledge Base (working from the user's files)

> Load this when `SPECIALTY.md` points at a knowledge folder — an Obsidian vault, a library of
> books and notes, any folder of documents. This is how the agent feeds on that knowledge without
> drowning its context, and how the folder stays ready for RAG the day it's actually needed.

## What an Obsidian vault actually is

A folder of plain Markdown files. Nothing more. The Obsidian app is a nice editor *on top of* that
folder — the agent doesn't need it installed, doesn't need a plugin, doesn't need an integration.
Point the agent at the folder path and every file tool (read, search) works natively. This is the
whole trick: **knowledge that lives as plain text is knowledge the agent can already use.**

## The ladder — always use the cheapest tier that works

**Tier 1 — search + read (the default).** Search the folder for keywords, read only the files that
matter, answer with citations. This works far longer than people assume — grep over thousands of
markdown files is fast, exact, and costs nothing. Don't skip past this tier because "RAG sounds
more serious." Plain search IS retrieval.

**Tier 2 — structure.** When the folder grows, add navigation, not technology:
- An `INDEX.md` (map of content): what lives where, one screen. The agent reads it first on broad
  questions. If the folder has none, offer to build it — that's an afternoon, not a project.
- Inbox → distilled: a raw-captures folder (`01_raw/`, `_inbox/`) where anything gets dumped, and a
  distilled layer of permanent notes (one concept per note). Messy inbox is fine; the distilled
  layer is what answers questions.

**Tier 3 — RAG (embeddings + vector DB).** Only when Tier 1 demonstrably fails — the honest signs:
- Keyword search misses content that says the same thing in different words (semantic paraphrase),
  and it happens often enough to hurt.
- The corpus is whole *books* (thousands of pages) where the answer's location is unknowable.
- Cross-language retrieval (question in Spanish, source in English).

A local stack that works and costs nothing to run: Chroma (local vector DB) + a multilingual
embedding model + a re-ranker, with **structure-aware chunking** (never split a section or verse
mid-thought — chunk quality is retrieval quality). Build it as a real project when the pain is
real, with retrieval evals — not on day one because it sounds powerful. A vector index is a second
copy of your knowledge that can drift stale; plain files are the source of truth.

## Working rules (any tier)

1. **Search before answering from memory.** If the folder exists, the folder wins over the model's
   general knowledge. Quote and cite the file used (`path/to/note.md`).
2. **Read the INDEX first** on broad questions; targeted search on narrow ones. Never bulk-load the
   folder into context — context is finite and degrades.
3. **Write back.** New distilled knowledge from a session (a summary, a connection, a decision)
   goes *into* the folder, in the user's structure. A knowledge base the agent only reads is half
   alive.
4. **Respect the owner's structure.** Never reorganize, rename, or "clean up" the vault unasked.

## RAG-ready hygiene (the real foundation to lay TODAY)

The best preparation for RAG later is not installing anything — it's keeping the folder in a shape
that chunks well. If the user asks "how do I prepare for RAG":

- **Markdown over PDF** where possible; when PDFs arrive (books, papers), extract to markdown on
  ingest, keep the PDF as source.
- **One concept per note**; split books by chapter, not one 900-page file.
- **Frontmatter** on distilled notes: title, source, tags, date.
- **Descriptive filenames** (`fotosintesis-fase-oscura.md`, not `nota27.md`).
- **Inbox pattern**: raw dumps in one place, distilled notes elsewhere.

Do this and the future RAG inherits clean structure. Skip it and no embedding model saves you —
garbage chunks in, garbage retrieval out.
