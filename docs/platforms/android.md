---
type: Platform
title: Android
description: Gradle (Kotlin DSL) setup, SDK levels, signing, manifest and Play policy for the shipped Android app.
tags: [platform, android, gradle, play-store]
timestamp: 2026-09-10T08:30:00Z
resource: https://play.google.com/store/apps/details?id=com.hmz.al_quran
---

# Android

| Item | Value (2026-09-10) | Where |
|---|---|---|
| applicationId / namespace | `com.hmz.al_quran` | `android/app/build.gradle.kts` |
| Label / icon | "The Holy Qur'an" / `@mipmap/launcher_icon` (from `flutter_launcher_icons`, `assets/logos/app_icon.png`) | `AndroidManifest.xml`, `pubspec.yaml` |
| compileSdk / targetSdk | 36 (from `flutter.compileSdkVersion`/`targetSdkVersion`) | build.gradle.kts |
| minSdk | 24 (`flutter.minSdkVersion`) | build.gradle.kts |
| NDK | `flutter.ndkVersion` | build.gradle.kts |
| AGP / Kotlin / Gradle | 9.1.0 / 2.4.0 / 9.3.1 | `settings.gradle.kts`, `gradle-wrapper.properties` |
| Java | 17 (source/target + `jvmTarget`); core-library desugaring on (`desugar_jdk_libs` 2.1.5) | build.gradle.kts |
| Permissions | `INTERNET` only | manifest |
| Activity | `MainActivity : FlutterActivity`, `singleTop`, launch theme + normal theme | `kotlin/com/hmz/al_quran/MainActivity.kt`, manifest |
| gradle.properties | `android.useAndroidX=true`, `android.newDsl=false`, `android.builtInKotlin=false`, 8 GB JVM heap (Flutter template) | |

## Signing
Release config reads `android/key.properties` (git-ignored; keys `storeFile`, `storePassword`, `keyAlias`, `keyPassword`). If the file is missing the `release` signingConfig is empty and `flutter build` fails at signing — expected on machines without the keystore.

**Play App Signing is enabled**: Google holds the app signing key; our keystore is only the **upload key**.

| Key | Where | Alias | SHA-1 |
|---|---|---|---|
| Upload key (current, since the 2026-09 reset) | `holy-quran.keystore`, kept outside the repo next to the checkout; public cert exported as `holy-quran-upload-certificate.pem` | `holyquran` | `12:11:A7:9A:99:EF:59:8A:68:B0:24:6B:B3:BB:8A:9C:EB:8A:D5:19` |
| Upload key (2020–2025, **lost**) | `alquran.jks` on a Windows machine that was sold | `alquran` | `EB:39:70:BF:73:C8:02:41:21:32:87:68:AA:91:31:4B:0A:0C:0B:3A` |

If Play rejects an AAB with "signed with the wrong key", compare the AAB's certificate (`keytool -printcert -jarfile app-release.aab`) with the upload certificate shown in Play Console → Setup → App signing. A lost upload key is recoverable via **Request upload key reset** on that page (upload the new key's `.pem`, exported with `keytool -export -rfc -keystore holy-quran.keystore -alias holyquran -file upload_certificate.pem`); Google applies it within about two days. Back the keystore and its password up somewhere durable — a second loss means another reset, and the old `key.properties` passwords are in this public repo's git history (2020–2022 commits), so never reuse them.

## Google Play policy
- Target API ≥ 36 required for updates from **2026-08-31** ([policy](https://developer.android.com/google/play/requirements/target-sdk)); extension to 2026-11-01 requestable in Play Console. API 37 expected for Aug 2027.
- Existing apps must target ≥ 35 to stay visible to new users on newer devices.
- Keeping `targetSdk = flutter.targetSdkVersion` and bumping Flutter yearly satisfies this.

## Build outputs
`build/app/outputs/bundle/release/app-release.aab` (upload) · `build/app/outputs/flutter-apk/app-release.apk` (test). Verify: `aapt2 dump badging <apk> | grep -E 'targetSdk|versionCode'`.

## History
2026-09-10: Groovy → Kotlin DSL, AGP 8.2 → 9.1, Gradle 8.4 → 9.3.1, Java 8 → 17, targetSdk 35 → 36, minSdk 21 → 24, manifest `package` attr and `org.apache.http.legacy` removed ([ADR-0005](../decisions/0005-kotlin-dsl-gradle.md)).
