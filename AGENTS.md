# The Holy Qur'an — Agent Guide

Flutter app for reading the Qur'an (Uthmani script) fetched from the public [alquran.cloud](https://alquran.cloud/api) API and cached offline in Hive. Live on Google Play (`com.hmz.al_quran`, ~1k users). iOS is kept buildable but not shipped. Web build exists but is broken (out of scope until picked up).

**Branch:** `master` (single branch, PRs target `master`) | **Stack:** Flutter 3.47.3 via FVM · Dart 3.13 · flutter_bloc · Provider · get_it · Hive CE · Dio · Freezed | **Flavors:** none — one production app.

---

## Repo structure

```
lib/                      # App: UI, blocs, providers, configs, router, locator
packages/al_quran_api/    # Data layer: Dio client, Freezed+Hive models, data provider, ALL codegen
packages/al_quran_repo/   # Repository layer: ChapterRepo / JuzRepo / BookmarksRepo
test/                     # bloc tests (bloc_test+mocktail) and widget tests
android/ ios/ web/        # Platform shells (Android is the shipped target)
_templates/ scripts/      # Hygen templates (partly stale) and asset-constant generator
docs/                     # Knowledge base — OKF bundle, start at docs/index.md
.agents/                  # Rules + skills (source of truth; .claude/rules and .claude/skills symlink here)
```

## Critical rules

**Layering — strictly top-down, nothing reaches back up:**
`UI (screens/widgets) → Bloc → Repo (al_quran_repo) → DataProvider (al_quran_api) → Dio API | Hive box`

- **Business state = Bloc** (`lib/blocs/{name}/bloc.dart` + `event.dart` + `state.dart` as `part` files, Equatable states, sealed events). Blocs are singletons registered in `lib/services/locator.dart` (get_it) and exposed via `BlocProvider` in `lib/app.dart`. Read with `context.read<XBloc>()` or `sl<XBloc>()`.
- **Ephemeral/app-wide UI state = Provider** (`lib/providers/`): `AppProvider` (theme, first-open) and `OnBoardingProvider`. Never put HTTP/Hive fetching in a Provider (AppProvider only reads/writes the `app` box).
- **Models are Freezed + `@HiveType`** in `packages/al_quran_api/lib/src/models/`. Hive typeIds live in `AppHiveTypes` — never reuse or renumber a typeId (it breaks users' cached boxes).
- **Codegen only in `packages/al_quran_api`** (Freezed, json_serializable, Hive CE adapters). The root app has no build_runner on purpose (analyzer version conflict with `flutter_test`).
- **Configs layer, not magic numbers:** call `App.init(context)` at the top of every `build()`, then use `AppTheme.c!`, `AppText`, `Space`, `AppDimensions`, `UIProps`. Legacy screens still hardcode `Colors.grey[850]` — don't add more.
- **Widgets are classes**, never `Widget _build...()` functions. Screen-private widgets go in `widgets/` as `part` files.
- **Dependencies are pinned to exact versions** in every pubspec. Bump deliberately, run tests, note it in `docs/log.md`.
- **Errors:** data provider and repos throw `Exception('Internal … Error')`; blocs catch everything and emit a `…Failed(message)` state. UI never sees a raw throw.

## Commands

```bash
fvm flutter run                                   # debug on device/emulator
fvm flutter analyze && fvm flutter test           # gates before any "done"
cd packages/al_quran_api && fvm dart run build_runner build   # after model changes
fvm dart run scripts/assets.dart                  # regenerate lib/static/assets.dart
fvm flutter build appbundle --release             # Play Store artifact (needs android/key.properties)
fvm flutter build apk --release                   # sideload/test artifact
```

## Planning

Work spanning more than 2–3 files or with sequencing risk gets a plan in `docs/exec-plans/backlog/` first (never inline). Lifecycle: `backlog/ → active/ → completed/` (add `Shipped: YYYY-MM-DD`). Keep `docs/exec-plans/index.md` accurate. Isolated fixes skip planning.

## Skills

| Skill | Use when |
|---|---|
| `/brainstorm` → `/grill-me` → `/plan` → `/build` → `/review` | Delivery cycle; every arrow is a human-approval gate |
| `/refine-approach` | Sharpen a brainstorm or plan doc in place |
| `/ui-design` | Any new screen/widget — enforces this app's AppTheme/AppText/Space tokens |
| `/docs-gardening` | Audit `docs/` and this file for drift after architectural changes |

Path-scoped conventions auto-load from `.agents/rules/` (`flutter-dart.md`, `state-management.md`, `data-layer.md`, `testing.md`, `android-release.md`).

## Docs (OKF bundle — `docs/index.md` is the root)

- Architecture + codemap → `docs/architecture/`
- Conventions (Dart, testing, release) → `docs/conventions/`
- ADRs (append-only) → `docs/decisions/`
- Domain glossary + alquran.cloud API → `docs/domain/`
- Features, screens/flows → `docs/features/`, `docs/screens/`
- Tooling (FVM, codegen, hygen, CI) → `docs/tooling/`
- Platforms (Android/iOS/web status) → `docs/platforms/`
- Plans, learnings, change log → `docs/exec-plans/`, `docs/learnings/`, `docs/log.md`
