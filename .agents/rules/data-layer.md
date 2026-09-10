---
paths:
  - "packages/**/*.dart"
  - "packages/**/pubspec.yaml"
---

# Data layer rules (`packages/al_quran_api`, `packages/al_quran_repo`)

Full reference: `docs/architecture/data-layer.md`, API notes in `docs/domain/alquran-cloud-api.md`.

## Models (`al_quran_api/lib/src/models/`)
- Freezed (`@Freezed(...)` on an `abstract class X with _$X`, `const X._();`) with `@HiveType(typeId: AppHiveTypes.x, adapterName: 'XAdapter')` on the **factory constructor** and `@HiveField(n)` on each param. Import Hive from `package:hive_ce/hive.dart`.
- **typeIds are permanent** (`ayah = 0`, `chapter = 1`, `juz = 2` in `src/static/hive.dart`). New model → new id; never reuse; never renumber existing `@HiveField`s. Users' on-device boxes depend on them.
- Lists that get stored in Hive use `@Freezed(makeCollectionsUnmodifiable: false)`.
- After any model edit: `cd packages/al_quran_api && fvm dart run build_runner build`, then commit the regenerated `.freezed.dart`, `.g.dart` and `lib/hive_registrar.g.dart`.

## Data provider (`al_quran_api/lib/src/data_providers/`)
- One interface (`IAlQuranDataProvider`) + one impl. HTTP through `Api.ins` (Dio, base `https://api.alquran.cloud`); cache through the Hive box named `data`. Box keys in use: `chapters`, `juz{n}`, `bookmarks`.
- Every method: `try { … } catch (e) { throw Exception('Internal <Area> <API|Hive> Error'); }`. Keep the message pattern — the UI shows it.
- Never open boxes here — `main.dart` opens `app` and `data` before the locator runs.

## Repos (`al_quran_repo`)
- Thin pass-through per domain (`ChapterRepo`, `JuzRepo`, `BookmarksRepo`), each implementing its interface in `src/repos/interfaces/` and re-wrapping errors as `Exception('Internal … Repo Error')`. No caching logic in repos.

## Pubspecs
- Exact version pins, same as the root app. `al_quran_api` is the **only** package with codegen dev-deps (build_runner, freezed, json_serializable, hive_ce_generator). `al_quran_repo` has no codegen.
