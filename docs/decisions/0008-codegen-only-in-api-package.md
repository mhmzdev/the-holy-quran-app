---
type: Decision
title: "ADR-0008: Code generation lives only in packages/al_quran_api"
description: build_runner, freezed, json_serializable and hive_ce_generator are dev-deps of the api package only; the root app has no codegen.
tags: [decision, adr]
timestamp: 2026-09-10T08:30:00Z
date: 2026-09-10
status: accepted
---

# ADR-0008: Code generation lives only in packages/al_quran_api

**Date:** 2026-09-10 · **Status:** accepted

## Context
With Flutter 3.47, `flutter_test` pins `test_api`/`matcher`, which forces `package:test` (via `bloc_test`) onto `analyzer <14`, while `hive_ce_generator` 1.11.3 needs `analyzer ^14`. The two cannot coexist in one pubspec. The root app has no annotated classes anyway.

## Decision
Keep all annotated models and every codegen dev-dependency in `packages/al_quran_api`. Run `cd packages/al_quran_api && fvm dart run build_runner build`. The root pubspec documents this in a comment.

## Consequences
- New Freezed/Hive models must be created in the api package (they belong there by [ADR-0002](0002-two-package-data-layer.md) anyway).
- If a root-level generator is ever needed, revisit once `bloc_test`/`test` catch up with analyzer 14.
