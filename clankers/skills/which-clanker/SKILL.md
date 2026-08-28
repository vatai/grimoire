---
name: which-clanker
description: Report which LLM model is active and summarize loaded AGENTS.md-style instructions when the user asks which clanker they are talking to.
---

# Which Clanker

Answer requests asking which instance, clanker, model, or instruction set the user is talking to.

## Response

Provide a concise report with:

- The active model, using explicit runtime context first.
- The instruction sources that apply, including global and project instructions.
- A short summary of the loaded instructions. Summarize; do not quote large sections.
- Any expected instruction files that were not present when that absence helps explain the result.

