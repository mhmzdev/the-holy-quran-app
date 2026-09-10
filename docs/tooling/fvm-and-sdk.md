---
type: Tooling
title: FVM & Flutter SDK
description: The project pins Flutter with FVM; how to install, run, and upgrade the SDK safely.
tags: [tooling, fvm, flutter, sdk]
timestamp: 2026-09-10T08:30:00Z
resource: https://fvm.app
---

# FVM & Flutter SDK

Pinned in `.fvmrc`: **Flutter 3.47.3** (stable, Dart 3.13.3). Always prefix commands with `fvm` (`fvm flutter …`, `fvm dart …`); `.fvm/` is git-ignored.

```bash
fvm install            # installs the pinned version
fvm flutter pub get && (cd packages/al_quran_api && fvm dart pub get) && (cd packages/al_quran_repo && fvm dart pub get)
fvm flutter run
```

## Upgrading the SDK (checklist)
1. `fvm releases` → pick the stable; `fvm use <version>` (updates `.fvmrc`).
2. Bump `environment: sdk:` in all three pubspecs to the new Dart caret.
3. `FLUTTER_VERSION` in `.github/workflows/run_test.yml`.
4. Diff `android/` against `<sdk>/packages/flutter_tools/templates/app/android*.tmpl` and `gradle_utils.dart` constants (AGP/Kotlin/Gradle); diff iOS deployment target against `templates/app/ios.tmpl`.
5. `fvm flutter pub upgrade --major-versions` in api → repo → root; regenerate codegen; `analyze`; `test`; `build apk --release`.
6. Log it in [docs/log.md](../log.md); write a learning if something bit ([example](../learnings/flutter-3-47-upgrade.md)).
