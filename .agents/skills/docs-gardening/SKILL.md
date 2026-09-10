---
name: docs-gardening
description: Audit and maintain The Holy Qur'an app's knowledge base (AGENTS.md, .agents/rules/, docs/ OKF bundle) for staleness, broken cross-links, drift from code, and OKF structural issues. Use when asked to review, garden, audit, update, or clean up the docs. Also use proactively after any architectural change, convention shift, dependency/SDK bump, or feature merge.
argument-hint: optional scope — e.g. architecture, features, decisions, all
---

# Docs Gardening

Keep the harness honest: every doc reflects current code, cross-links resolve, frontmatter is valid, and each file earns its place. Stale docs are worse than none — agents trust them.

This is **maintenance**, not writing. Default to fixing or deleting, not adding.

## Principles
1. Docs exist to cut re-instruction cost. If a page doesn't help an agent ship correctly, it's dead weight.
2. `AGENTS.md` is a map (< ~100 lines) pointing into `docs/`. Growth is drift.
3. `docs/` is the system of record, an **OKF bundle**: markdown + YAML frontmatter, one concept per file, file path = identity, `index.md` per folder for progressive disclosure, `log.md` for chronology, relative markdown links for the graph.
4. `.agents/rules/*.md` are the always-on digest; they summarize and link to `docs/conventions/`, never restate at length.
5. Duplication is drift — one home per fact, cross-link elsewhere.
6. Code wins over docs. Update or delete the doc; never "fix" code to match a stale doc.

## Layout being gardened
```
AGENTS.md  (CLAUDE.md is just @AGENTS.md)
.agents/rules/   .agents/skills/   (.claude/{rules,skills} are symlinks)
docs/
  index.md  log.md
  architecture/  conventions/  decisions/  domain/  features/  screens/
  tooling/  platforms/  learnings/  exec-plans/{index.md,backlog,active,completed}
  brainstorm/  code-review/
```

## Passes (report findings after each; ask before mass edits; single-file fixes go straight through)
### 1 — Inventory
List every `.md` under `docs/`, `AGENTS.md`, `.agents/rules/`. Note sizes and `git log -1 --format=%ci <file>`. Flag files outside the layout.

### 2 — Frontmatter (OKF)
Every `docs/**/*.md` (except `.gitkeep`) starts with YAML frontmatter containing at least `type`; expect `title`, `description`, `tags`, `timestamp` (ISO 8601). `decisions/` also carry `status` and `date`; `exec-plans/` carry `status`. Fix missing/invalid fields.

### 3 — Staleness (docs vs code)
- File paths mentioned → exist? Class/function names → grep them.
- Bloc list (`architecture/state-management.md`) ↔ `lib/blocs/`. Provider list ↔ `lib/providers/`.
- Routes (`screens/flows.md`) ↔ `lib/router/routes.dart` + `router.dart`.
- Models/typeIds/box keys (`architecture/data-layer.md`, `domain/alquran-cloud-api.md`) ↔ `packages/al_quran_api/lib/src/`.
- Widget catalogue (`architecture/configs.md`, rules) ↔ `lib/ui/widgets/`.
- Versions (`tooling/fvm-and-sdk.md`, `platforms/android.md`, `conventions/release.md`) ↔ `.fvmrc`, `pubspec.yaml`, `android/**/*.kts`, `.github/workflows/run_test.yml`.
- Commands in `AGENTS.md`/`tooling/` still valid?
- Feature docs' "Known gaps" — fixed already? Remove.

### 4 — Cross-links
Grep every markdown link (text in square brackets followed by a parenthesised path) and verify each relative target exists. `AGENTS.md` Docs section points to real folders/files. Every folder has an `index.md` listing its files.

### 5 — Duplication
Same fact in two places (commands, versions, layer rules, typeIds)? Pick the canonical home, cut elsewhere, link.

### 6 — Structural rules
| File | Rule |
|---|---|
| `AGENTS.md` | < ~100 lines, map only |
| `.agents/rules/*.md` | digest + link; has `paths:` frontmatter |
| `docs/decisions/*.md` | append-only; supersede with a new ADR, never edit history |
| `docs/log.md` | newest first, one line per change, dated |
| `docs/exec-plans/index.md` | matches the files in backlog/active/completed |
| other docs | first line after frontmatter states purpose; no TODOs (surface in report) |

### 7 — Obsolete files
Candidates: docs for removed features, superseded pages. **Never delete without asking.**

## Reporting format
```
### Pass N — <name>
**Fine:** …
**Needs fixing (applying now):** file:line — issue
**Needs confirmation:** …
**Verified against code:** …
```
Finish with a `docs/log.md` line summarizing the gardening.

## What NOT to do
- Write new docs unless asked. Add TODOs. Rewrite prose for style. Edit past ADRs. Assume old == stale (check the code).
