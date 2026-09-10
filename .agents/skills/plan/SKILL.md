---
name: plan
description: Turn an idea or brainstorm into an actionable execution plan for The Holy Qur'an app with phases, file changes, and machine-checkable success criteria. Use when the user says "plan this", "write a plan", "how should we build X". Writes the plan into docs/exec-plans/backlog/ and registers it in docs/exec-plans/index.md.
argument-hint: the feature/fix to plan, or a path to a brainstorm doc
---

# Plan

You are turning a WHAT into a HOW. Output is a **plan document**, not code — precise enough that `/build` executes it without re-deciding scope.

**Repo plan rules (AGENTS.md → Planning):** new plans land only in `docs/exec-plans/backlog/`; always add the row to `docs/exec-plans/index.md`; `/build` moves plans `backlog/ → active/ → completed/`.

Position: `/brainstorm → /grill-me → **/plan** → /build → /review`.

## Phase 0 — Clear starting point
1. Given a doc path (`docs/brainstorm/…`), read it and extract settled decisions. Given a bare description, check `docs/brainstorm/` and `docs/exec-plans/` for a related artifact and offer to use it.
2. Fuzzy scope or unresolved approaches → **stop and recommend `/brainstorm`**, then `/grill-me`.
3. Decided but ungrilled and non-trivial (Hive schema, navigation, release, splash preload) → recommend `/grill-me` first.

## Phase 1 — Targeted research (no full audits)
1. Grep/Glob only what the plan touches. New bloc → read `lib/blocs/chapter/` (3 files) + its registration in `locator.dart`/`app.dart` + `test/blocs/chapter_bloc_test.dart`. New screen → read the closest screen folder + `router.dart`/`routes.dart` + its widget test. Data change → `packages/al_quran_api/lib/src/data_providers/impls/…` and the model + `docs/architecture/data-layer.md`.
2. Note exact paths and line refs you'll change.
3. Pull conventions from `.agents/rules/` and `docs/conventions/`.
4. Risk areas (Hive typeIds/fields, permissions, versioning, anything users' cached data depends on) → cite the doc and flag the risk in the plan.

## Phase 2 — Name and locate
Title in conventional-commit form (`feat:`, `fix:`, `refactor:`, `chore:`). File: `docs/exec-plans/backlog/<kebab-topic>.md`, no date prefix.

## Phase 3 — Machine-checkable success criteria
Each criterion carries exactly one `verify:`:
- `verify: fvm flutter analyze` / `fvm flutter test` / `fvm flutter test test/blocs/x_bloc_test.dart`
- `verify: cd packages/al_quran_api && fvm dart run build_runner build` (after model changes; then `git diff --stat` shows regenerated files)
- `verify: fvm flutter build apk --release` (for anything touching Android/Gradle/pubspec)
- `verify: manual <numbered steps>` when no command exists (e.g. airplane-mode launch shows cached surahs).
Rewrite any vacuous criterion into something provable.

## Phase 4 — Write the plan
OKF frontmatter (`type: Plan`, `title`, `description`, `tags`, `timestamp`, `status: backlog`) then:

```markdown
# <conventional-commit title>
## Problem
## Approach
(prose; which existing patterns it reuses; layer boundaries respected)
## Success criteria
- [ ] <criterion> — `verify: <command>`
## Phases
### Phase 1 — <name>
**Status:** Not started
- Files: …
- Tests: …
## Risks & open questions
## Out of scope
```
Sizing: one phase ≈ one context window. Build order Model → DataProvider → Repo → Bloc → UI. Include the build_runner step when models change. Note a split boundary if too big for one PR.

## Phase 5 — Register
Add a Backlog row to `docs/exec-plans/index.md` and a line to `docs/log.md`.

## Phase 6 — Handoff (AskUserQuestion)
Build it now (`/build`) · Refine (`/refine-approach`) · Grill it first (`/grill-me`) · Leave in backlog.

## What NOT to do
- Don't write code. Don't put the plan anywhere but `backlog/`. Don't date-prefix. Don't invent unverifiable criteria. Don't re-audit the whole codebase.
