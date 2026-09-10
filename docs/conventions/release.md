---
type: Convention
title: Release process (Google Play)
description: Versioning, target API policy, build and signing commands, and the release checklist for the Android app.
tags: [conventions, release, android, play-store]
timestamp: 2026-09-10T08:30:00Z
resource: https://play.google.com/store/apps/details?id=com.hmz.al_quran
---

# Release process

## Versioning
`pubspec.yaml` → `version: MAJOR.MINOR.PATCH+BUILD`. `BUILD` is the Android `versionCode` and must increase for every Play upload; Gradle reads both through `flutter.versionCode`/`flutter.versionName`. Current: **2.6.0+12** (2026-09-10). Patch = fixes/compliance, minor = user-visible feature, major = redesign.

## Google Play target API policy
New apps and updates must target the API level within one year of the latest Android release. Deadlines: **API 36 (Android 16) from 2026-08-31** (extension to 2026-11-01 available in Play Console); API 37 expected from Aug 2027. This app inherits `targetSdk`/`compileSdk` from the Flutter SDK defaults (36 on Flutter 3.47) — bumping Flutter is how we stay compliant. Details: [platforms/android.md](../platforms/android.md).

## Build
```bash
fvm flutter build appbundle --release   # → build/app/outputs/bundle/release/app-release.aab  (upload this)
fvm flutter build apk --release         # → build/app/outputs/flutter-apk/app-release.apk     (sideload test)
```
Signing: `android/app/build.gradle.kts` reads `android/key.properties` (`storeFile`, `storePassword`, `keyAlias`, `keyPassword`) — git-ignored, lives only on the release machine. Without it the release build is unsigned and Play rejects it.

## Checklist
1. `fvm flutter analyze` and `fvm flutter test` green; CI green on the PR.
2. Bump `version` in `pubspec.yaml`; note it in `docs/log.md`.
3. `fvm flutter build appbundle --release`; install the APK on a real device: cold start offline (cached data), Surah/Juz index, bookmark toggle, dark mode, share.
4. Upload the AAB in Play Console → Production (or internal testing first), write release notes.
5. Tag the commit `vX.Y.Z` after the rollout starts.
6. Privacy: the app collects nothing (`Privacy_Policy.md`); any new SDK that changes that needs a Play Data-safety update.
