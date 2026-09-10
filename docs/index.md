---
type: Index
title: The Holy Qur'an — Knowledge Base
description: Root of the OKF bundle for the app. Start here, follow links progressively.
tags: [index, okf]
timestamp: 2026-09-10T08:30:00Z
resource: https://github.com/mhmzdev/the-holy-quran-app
---

# Knowledge base — root index

This folder is an [Open Knowledge Format](https://cloud.google.com/blog/products/data-analytics/how-the-open-knowledge-format-can-improve-data-sharing) bundle: plain markdown, one concept per file, YAML frontmatter (`type` required; `title`, `description`, `tags`, `timestamp`, optional `resource`), `index.md` per folder for progressive disclosure, `log.md` for chronology, and relative markdown links forming the concept graph. File path = concept identity — rename with care and fix links.

The short always-on map for agents is [AGENTS.md](../AGENTS.md); path-scoped rules live in [.agents/rules](../.agents/rules).

| Folder | What it holds | Start with |
|---|---|---|
| [architecture/](architecture/index.md) | How the app is built: layers, codemap, state, data, configs | [overview.md](architecture/overview.md) |
| [conventions/](conventions/index.md) | How we write code, tests and releases | [dart.md](conventions/dart.md) |
| [decisions/](decisions/index.md) | Architecture Decision Records (append-only) | [index.md](decisions/index.md) |
| [domain/](domain/index.md) | Qur'an vocabulary and the alquran.cloud API | [glossary.md](domain/glossary.md) |
| [features/](features/index.md) | One page per user-facing feature | [index.md](features/index.md) |
| [screens/](screens/index.md) | Routes, navigation and flows | [flows.md](screens/flows.md) |
| [tooling/](tooling/index.md) | FVM, codegen, hygen, CI | [fvm-and-sdk.md](tooling/fvm-and-sdk.md) |
| [platforms/](platforms/index.md) | Android (shipped), iOS (buildable), web (broken) | [android.md](platforms/android.md) |
| [exec-plans/](exec-plans/index.md) | Execution plans: backlog → active → completed | [index.md](exec-plans/index.md) |
| [learnings/](learnings/index.md) | Engineering notes worth keeping | [index.md](learnings/index.md) |
| [brainstorm/](brainstorm/) | Thinking docs from `/brainstorm` | — |
| [code-review/](code-review/) | Reports from `/review` | — |
| [log.md](log.md) | Chronological change log of the knowledge base and notable repo changes | — |

## Type vocabulary
`Index`, `Log`, `Architecture`, `Convention`, `Decision`, `Concept`, `API`, `Feature`, `Flow`, `Tooling`, `Platform`, `Plan`, `Learning`, `Brainstorm`, `Review`.
