---
type: Plan
title: "chore: Flutter 3.47.3 upgrade, target API 36, agentic setup"
description: Retroactive record of the 2026-09-10 session that upgraded the SDK and dependencies, migrated Android to Kotlin DSL for Play's API 36 requirement, and bootstrapped AGENTS.md, rules, skills and the OKF docs bundle.
tags: [plan, upgrade, android, docs]
timestamp: 2026-09-10T08:30:00Z
status: completed
---

Shipped: 2026-09-10

# chore: Flutter 3.47.3 upgrade, target API 36, agentic setup

## Problem
Play Console warned that the app (targetSdk 35) must target API 36 by 2026-08-31 to keep publishing updates. The project was on Flutter 3.38.2 with 2024-era dependencies, an abandoned Hive generator, Groovy Gradle from 2021, and no agent/docs setup at all.

## Approach
Bump FVM to the latest stable and take every dependency to its latest major, accepting the Hive → Hive CE migration; rewrite Android Gradle as Kotlin DSL mirroring the new Flutter template so SDK levels track Flutter defaults; keep iOS compiling; then add the agentic layer (AGENTS.md + rules + skills, .claude symlinked to .agents) and an OKF knowledge base.

## Success criteria
- [x] `fvm flutter analyze` clean — `verify: fvm flutter analyze`
- [x] All tests pass (23) — `verify: fvm flutter test`
- [x] Release APK and AAB build and are signed — `verify: fvm flutter build apk --release && fvm flutter build appbundle --release`
- [x] APK reports targetSdk 36 / versionCode 12 — `verify: aapt2 dump badging build/app/outputs/flutter-apk/app-release.apk`
- [ ] Upgrade-from-2.5.6 device test keeps cached surahs and bookmarks — `verify: manual` install 2.5.6, bookmark a surah, install 2.6.0 APK over it, confirm bookmark + offline data survive
- [ ] Play Console accepts the AAB — `verify: manual` upload to internal testing

## Phases
### Phase 1 — SDK & dependencies  **Status:** Done
`.fvmrc` 3.47.3; sdk `^3.13.0` in 3 pubspecs; version 2.6.0+12; all deps latest majors; Hive CE; Freezed 4; codegen confined to `packages/al_quran_api`; `url_strategy` → `flutter_web_plugins`; HTTPS base URL; lint fixes.
### Phase 2 — Android / iOS / CI  **Status:** Done
Kotlin DSL Gradle (AGP 9.1.0, Kotlin 2.4.0, Gradle 9.3.1, Java 17), targetSdk/compileSdk 36, minSdk 24, manifests cleaned; iOS deployment target 15.0; CI Flutter 3.47.3, checkout@v4.
### Phase 3 — Agentic setup  **Status:** Done
`AGENTS.md`, `.claude/settings.json`, `.agents/rules/*` (5), `.agents/skills/*` (8, adapted from app_flight), symlinks.
### Phase 4 — Knowledge base  **Status:** Done
`docs/` OKF bundle: architecture, conventions, decisions (8 ADRs), domain, features, screens, tooling, platforms, learnings, exec-plans, log.

## Risks & open questions
- minSdk 24 drops Android 5/6 users (Flutter floor; unavoidable).
- Hive CE reads existing boxes by design; manual upgrade test still recommended before production rollout.

## Out of scope
Web build fix; onboarding/juz-navigation gaps (documented as known gaps); iOS release.
