---
name: brainstorm
description: Explore WHAT to build for The Holy Qur'an app through collaborative dialogue before any planning or code. Use when the user says "brainstorm", "let's explore", "think through this", "what should we build", or when a request is fuzzy enough that jumping to a plan would guess at scope. Produces a brainstorm doc in docs/brainstorm/.
argument-hint: the feature or idea to explore
---

# Brainstorm

You are exploring an idea **before** it becomes a plan. Nail down **WHAT** to build and **WHY** — not HOW. No code, no file lists, no phases; those belong to `/plan`.

Cycle: `/brainstorm → /grill-me → /plan → /build → /review` — every arrow is a human-approval gate. Hand off, never auto-chain. For small, low-risk ideas skip straight to `/plan`.

## Guiding principles
1. **Ruthless YAGNI.** Solo-maintained app with ~1k users and no backend. Solve the problem in front of you, never a hypothetical one. When in doubt, cut.
2. **Prefer existing patterns.** Bloc + get_it + Provider, the two-package data layer, Hive cache-first, the configs token layer. Check `AGENTS.md`, `docs/architecture/overview.md` and `docs/features/` before inventing.
3. **One question at a time.** Ask the single most decision-unblocking question, prefer multiple-choice with a recommended default, wait, then continue.
4. **Look before you ask.** If the answer is in the code or `docs/`, read it.

## Flow
### Step 0 — Scope the idea
Classify what it touches: a screen/widget (`lib/ui/`), a bloc (`lib/blocs/`), the data layer (`packages/al_quran_api` / `al_quran_repo`, Hive schema — typeId implications!), platform/release (`android/`, Play policy), or the web build (currently broken, see `docs/platforms/web.md`). If the request is already crisp and small, say so and recommend `/plan` or just doing it.

### Step 1 — Understand
1. Lightweight codebase pass: read the 1–3 files that matter (the closest screen, the bloc, the data-provider method). Not an audit.
2. Collaborative questioning, one at a time: Who hits this and when (reader, first-time user, offline user)? Smallest version that delivers the value? Does it need new cached data (Hive model → typeId, migration for existing users)? Which existing screen/bloc is closest?
3. Explore 2–3 concrete approaches: one line each, what it reuses, its trade-off, how it fits the layering. Recommend one.

### Step 2 — Write the brainstorm doc
`docs/brainstorm/<kebab-topic>.md` with OKF frontmatter (`type: Brainstorm`, `title`, `description`, `tags`, `timestamp`) and:

```markdown
## Problem
## Goal
## Approaches considered
1. **<Name>** — <one line>. Reuses <X>. Trade-off: <Y>.
**Leaning toward:** <which, why>
## Surfaces touched
## Open questions
- [ ] ...
## Out of scope (YAGNI)
```
Keep it tight — a thinking artifact, not a spec. Add a line to `docs/log.md`.

### Step 3 — Handoff (AskUserQuestion)
- **Grill it** → `/grill-me` (recommended for anything touching Hive schema, navigation, or release).
- **Plan it** → `/plan` for small, low-risk ideas.
- **Refine** → `/refine-approach` on the doc.
- **Pause** → leave the doc and stop.

## What NOT to do
- No implementation phases, file lists, or code.
- Don't invent requirements the user never raised — capture what was discussed, mark the rest as open questions.
- Don't skip the codebase pass; this app almost always has a pattern to lean on.
