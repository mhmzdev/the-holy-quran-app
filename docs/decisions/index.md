---
type: Index
title: Architecture Decision Records
description: Append-only log of decisions — what was chosen, why, and what it rules out. Supersede, never edit.
tags: [decisions, adr, index]
timestamp: 2026-09-10T08:30:00Z
---

# Decisions (ADRs)

| ADR | Title | Date | Status |
|---|---|---|---|
| [0001](0001-bloc-for-business-state.md) | Bloc for business state, Provider for app state | ~2023 | accepted |
| [0002](0002-two-package-data-layer.md) | Two-package data layer (al_quran_api, al_quran_repo) | 2025-02 | accepted |
| [0003](0003-hive-offline-cache.md) | Hive as the offline cache, cache-first reads | ~2023 | accepted |
| [0004](0004-migrate-to-hive-ce.md) | Migrate to Hive CE | 2026-09-10 | accepted |
| [0005](0005-kotlin-dsl-gradle.md) | Android Gradle in Kotlin DSL mirroring the Flutter template | 2026-09-10 | accepted |
| [0006](0006-agents-dir-source-of-truth.md) | .agents/ as source of truth, .claude/ symlinks | 2026-09-10 | accepted |
| [0007](0007-okf-docs-bundle.md) | docs/ as an OKF bundle | 2026-09-10 | accepted |
| [0008](0008-codegen-only-in-api-package.md) | Codegen only in packages/al_quran_api | 2026-09-10 | accepted |

New ADR: next number, kebab slug, frontmatter `type: Decision`, `date`, `status: proposed|accepted|superseded`. To change a decision, add a new ADR that supersedes the old one and update both `status` fields.
