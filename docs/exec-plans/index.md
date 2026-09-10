---
type: Index
title: Execution plans
description: Registry of plans — backlog (scoped, not started), active (one at a time), completed (shipped).
tags: [plans, index]
timestamp: 2026-09-10T08:30:00Z
---

# Execution plans

New plans land in `backlog/` (via `/plan`), move to `active/` when `/build` starts, and to `completed/` with a `Shipped:` line when done. Keep this table in sync.

## Active
| Plan | Problem | Depends on |
|---|---|---|
| — | | |

## Backlog
| Plan | Problem | Depends on |
|---|---|---|
| — (candidates, unplanned: fix juz-navigation race, readiness-based splash, onboarding first-open flag, web build, bloc hygen templates, iOS bundle id) | | |

## Completed
| Plan | Shipped | Summary |
|---|---|---|
| [flutter-3-47-and-target-api-36.md](completed/flutter-3-47-and-target-api-36.md) | 2026-09-10 | SDK 3.47.3, full dep upgrade incl. Hive CE + Freezed 4, Kotlin DSL Gradle with targetSdk 36, iOS 15 target, agentic + OKF docs setup, release artifacts verified |
