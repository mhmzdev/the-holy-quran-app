---
name: review
description: Review The Holy Qur'an app code against the project's own conventions — layering (UI → Bloc → Repo → DataProvider), bloc anatomy, Provider tier, configs tokens, class widgets, Hive typeId safety, pinned deps, and test coverage. Use when the user says "review this", "code review", "check before merging". Produces one numbered findings report in docs/code-review/. Complements /code-review (generic bug hunting).
argument-hint: optional path(s) or diff scope — defaults to the working tree diff against master
---

# Review

A **convention-aware** review. Generic bug hunting belongs to `/code-review`; this catches what only matters in *this* repo (`AGENTS.md`, `.agents/rules/`, `docs/conventions/`). Output is **one numbered report** the user can act on by id.

Position: last step of `/brainstorm → /grill-me → /plan → /build → **/review**`.

## Step 1 — Scope
- Paths given → review those.
- Else `git diff master --name-only` plus untracked files. Announce the file count and areas.
- Nothing to diff → ask what to review; don't guess.

## Step 2 — Checklist
**Architecture & state**
- Layering strictly top-down (UI → Bloc → Repo → DataProvider → API/Hive)? Any widget calling a repo/provider directly?
- Blocs: 3 part files, sealed events, Equatable states with complete `props`, `await`ed repo calls, loading → success/failed emission, registered in `locator.dart` and `app.dart` markers?
- Providers only hold UI/app state (`AppProvider` may touch the `app` box only)?
- Cache-first honored where data is cacheable?

**Data layer**
- Model edits: new typeId for new classes, no renumbered `@HiveField`s, regenerated `.freezed.dart`/`.g.dart`/`hive_registrar.g.dart` committed, `makeCollectionsUnmodifiable: false` on stored lists?
- Data provider / repo methods wrap errors as `Exception('Internal … Error')`?
- Codegen dev-deps only in `packages/al_quran_api`?

**UI conventions**
- Class widgets, `App.init(context)` first in `build()`, tokens instead of literals, `withValues(alpha:)`, `StaticAssets` for assets, `Screen` wrapper, Arabic text in `Noor`?
- Named routes via `AppRoutes` (except `PageScreen`)?

**Platform / release**
- Version bumped only in `pubspec.yaml` when a release is intended? No new permissions? Gradle still mirrors the Flutter template? `.fvmrc` == CI `FLUTTER_VERSION`? Exact-pinned deps?

**Tests**
- Every new bloc/screen has its `_test.dart`; success + failure + edge; no `skip:`/TODO/empty tests; runs offline?

**Hard gates** — run `fvm flutter analyze` and `fvm flutter test`; any failure is a Critical finding.

## Step 3 — Report
Write `docs/code-review/<slug>.md` with OKF frontmatter (`type: Review`, `title`, `description`, `tags`, `timestamp`) and stable ids, ordered severity → file → line:

```markdown
# Review — <scope>  (<n> critical, <n> important, <n> suggestion)

## FINDING-01 · Critical · lib/blocs/foo/bloc.dart:42
Repo call not awaited — the failure path is swallowed. Rule: state-management/await
```
Print a chat summary: report path, severity counts, Critical + Important rows verbatim, Suggestions as a count. Nothing wrong → say so plainly and skip the file.

## Step 4 — Act (advisory)
Via AskUserQuestion: fix criticals · fix critical+important · fix specific ids · hand to `/code-review` · keep the report and exit. After fixing, re-run analyze + tests and report which ids were fixed. Only touch files in scope.

## What NOT to do
- Don't duplicate `/code-review`'s generic bug hunting.
- Don't fix anything before the user picks an action.
- Don't flag style you merely dislike — every finding maps to a documented rule.
