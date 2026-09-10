---
type: Learning
title: Flutter 3.47 upgrade — what bit us
description: Dependency-resolution traps, Freezed/Hive migration notes, Android AGP 9 changes and the fixes applied on 2026-09-10.
tags: [learning, upgrade, flutter, hive, freezed, gradle]
timestamp: 2026-09-10T08:30:00Z
---

# Flutter 3.38.2 → 3.47.3 (2026-09-10)

## Dependency resolution
- **`hive_generator` 2.0.1 is dead** (analyzer <7, needs the removed `_macros` SDK package). Any modern codegen (Freezed 4 → analyzer ≥13) is unsatisfiable with it. Fix: Hive CE ([ADR-0004](../decisions/0004-migrate-to-hive-ce.md)).
- **`flutter_test` pins `test_api`/`matcher`**, which drags `package:test` (via `bloc_test`) to versions requiring `analyzer <14`, while `hive_ce_generator` 1.11.3 wants `analyzer ^14`. They cannot share a pubspec. Fix: keep codegen dev-deps only in `packages/al_quran_api` ([ADR-0008](../decisions/0008-codegen-only-in-api-package.md)).
- `json_serializable` 6.14 requires `json_annotation` 4.12 — bump both together.
- Upgrade order matters with path packages: `al_quran_api` → `al_quran_repo` → root, or the root solve fails on the packages' old pins.
- `pub upgrade --major-versions` rewrites exact pins to carets; we re-pinned exact versions by hand to keep the repo convention.

## Freezed 2 → 4
- Classes must be `abstract class X with _$X`. Everything else (`const X._()`, `@Freezed(makeCollectionsUnmodifiable: false)`, `@HiveType` on the factory) carried over unchanged.
- Generated adapters now type against the private impl (`TypeAdapter<_Chapter>`); reads/writes are byte-identical to the old ones (same field indexes).

## Hive → Hive CE
- Imports: `package:hive_ce/hive.dart` (annotations, `Hive`, `Box`), `package:hive_ce_flutter/hive_flutter.dart` (`Hive.initFlutter`).
- `hive_test` replaced by `test/helper/hive.dart` (`Hive.init(tempDir)`, `deleteFromDisk`).
- Hive CE emits `lib/hive_registrar.g.dart`; harmless alongside explicit `registerAdapter` calls.

## Android (AGP 9.1 / Gradle 9.3.1)
- Manifest `package=` attribute must go (namespace in Gradle) — also in `debug/` and `profile/` manifests.
- Template now sets `android.newDsl=false` and `android.builtInKotlin=false`; keep them until Flutter flips the defaults.
- `isCoreLibraryDesugaringEnabled` is the Kotlin DSL spelling; `desugar_jdk_libs` 2.1.5.
- Flutter's `minSdkVersion` default is 24 now; Play users on Android 5/6 fall off updates.
- Verify the artifact, not the config: `aapt2 dump badging app-release.apk` showed `targetSdkVersion:'36'`, `versionCode='12'`.

## Misc
- `url_strategy` → `flutter_web_plugins` `usePathUrlStrategy()` (SDK package, no pin).
- Lints on Dart 3.13: `prefer_initializing_formals` now suggests private named params (`XBloc({required this._repo})` — public name stays `repo`); `Switch.activeColor` → `activeThumbColor`.
- `flutter pub get` on 3.47 silently appends `build/**`, `android/**`, `ios/**`, `web/**` excludes to `analysis_options.yaml`.
- API base URL was plain `http://`; Dart's HttpClient ignores Android's cleartext policy so it "worked", but it was switched to HTTPS (alquran.cloud supports it).
