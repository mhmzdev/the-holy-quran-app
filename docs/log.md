---
type: Log
title: Change log
description: Newest-first record of knowledge-base changes and notable repo changes (SDK bumps, releases, migrations).
tags: [log]
timestamp: 2026-09-10T08:30:00Z
---

# Log (newest first)

- **2026-09-10** — Flutter 3.38.2 → 3.47.3 (FVM), Dart 3.13; full dependency upgrade; Hive → Hive CE; Freezed 2 → 4; Android Gradle migrated to Kotlin DSL (AGP 9.1.0, Gradle 9.3.1, Kotlin 2.4.0, Java 17); targetSdk/compileSdk 36, minSdk 24; iOS deployment target 15.0; API base URL switched to HTTPS; `url_strategy` replaced by `flutter_web_plugins`; codegen moved to `packages/al_quran_api` only; app version 2.6.0+12. See [learnings/flutter-3-47-upgrade.md](learnings/flutter-3-47-upgrade.md) and [exec-plans/completed/flutter-3-47-and-target-api-36.md](exec-plans/completed/flutter-3-47-and-target-api-36.md).
- **2026-09-10** — Agentic setup created: `AGENTS.md` (imported by `CLAUDE.md`), `.agents/rules` + `.agents/skills` with `.claude` symlinks, `.claude/settings.json` (format-on-stop hook), and this OKF docs bundle. ADRs [0006](decisions/0006-agents-dir-source-of-truth.md), [0007](decisions/0007-okf-docs-bundle.md).
