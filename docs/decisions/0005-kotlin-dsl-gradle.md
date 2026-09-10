---
type: Decision
title: "ADR-0005: Android Gradle in Kotlin DSL, mirroring the Flutter template"
description: settings/build/app Gradle files are .kts copies of the pinned Flutter SDK's template with only signing, desugaring and namespace added.
tags: [decision, adr]
timestamp: 2026-09-10T08:30:00Z
date: 2026-09-10
status: accepted
---

# ADR-0005: Android Gradle in Kotlin DSL, mirroring the Flutter template

**Date:** 2026-09-10 · **Status:** accepted

## Context
The Groovy Gradle files dated from 2021 (AGP 8.2, Gradle 8.4, Java 8, `package=` in the manifest, `enableJetifier`). AGP 9 rejects several of those, and Play requires targetSdk 36.

## Decision
Rewrite `android/settings.gradle.kts`, `build.gradle.kts`, `app/build.gradle.kts`, `gradle.properties` and the wrapper to match Flutter 3.47's template (AGP 9.1.0, Kotlin 2.4.0, Gradle 9.3.1, Java 17). `compileSdk`/`targetSdk`/`minSdk`/`ndkVersion` come from `flutter.*`. Kept: release signing from `key.properties`, core-library desugaring (`desugar_jdk_libs` 2.1.5). Removed: manifest `package` attribute, `org.apache.http.legacy` uses-library, Jetifier/R8 flags.

## Consequences
- `minSdk` rose from 21 to 24 (Flutter's floor); Android 5/6 devices can no longer update.
- Future SDK bumps: diff against the new template instead of hand-editing.
- Documented in [platforms/android.md](../platforms/android.md).
