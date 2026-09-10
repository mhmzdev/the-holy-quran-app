---
paths:
  - "android/**"
  - "ios/**"
  - "pubspec.yaml"
  - ".github/workflows/**"
---

# Platform & release rules

Full reference: `docs/conventions/release.md`, `docs/platforms/android.md`, `docs/platforms/ios.md`.

- **Version** lives only in `pubspec.yaml` (`version: X.Y.Z+N`). Every Play upload needs a higher `+N` (versionCode). Gradle reads it via `flutter.versionCode/versionName` — never hardcode versions in Gradle or Info.plist.
- **Android Gradle is Kotlin DSL** (`settings.gradle.kts`, `build.gradle.kts`, `app/build.gradle.kts`) mirroring the Flutter template of the pinned SDK. `compileSdk`/`targetSdk`/`minSdk`/`ndkVersion` come from `flutter.*` defaults — don't pin numbers unless Play policy forces it (target API ≥ 36 required since 2026-08-31; expect ≥ 37 by Aug 2027).
- Release signing reads `android/key.properties` (git-ignored). Never commit keystores or passwords; never weaken `.gitignore` for them.
- The only Android permission is `INTERNET`. Adding a permission is a product decision — ask.
- iOS: keep it compiling (deployment target 15.0, CocoaPods) but it is not shipped; don't add iOS-only features.
- CI (`.github/workflows/run_test.yml`) pins `FLUTTER_VERSION` — keep it equal to `.fvmrc`.
- When the Flutter SDK is bumped: update `.fvmrc`, `pubspec.yaml` sdk constraint, CI version, re-diff the Android/iOS files against the new template, and log it in `docs/log.md`.
