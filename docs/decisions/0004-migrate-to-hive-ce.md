---
type: Decision
title: "ADR-0004: Migrate from hive/hive_flutter/hive_generator to Hive CE"
description: The original Hive packages are unmaintained and their generator cannot resolve on Dart 3.13; Hive CE is a drop-in continuation with the same box format.
tags: [decision, adr]
timestamp: 2026-09-10T08:30:00Z
date: 2026-09-10
status: accepted
---

# ADR-0004: Migrate from hive/hive_flutter/hive_generator to Hive CE

**Date:** 2026-09-10 · **Status:** accepted

## Context
Upgrading to Flutter 3.47 / Dart 3.13 with current codegen (Freezed 4, json_serializable 6.14) is impossible with `hive_generator` 2.0.1 (pins `analyzer <7`, last release 2023). `hive` 2.x itself is archived.

## Decision
Replace `hive` → `hive_ce` 2.19.3, `hive_flutter` → `hive_ce_flutter` 2.3.4, `hive_generator` → `hive_ce_generator` 1.11.3. Keep the legacy `@HiveType`/`@HiveField` annotations and the existing typeIds; imports become `package:hive_ce/hive.dart` and `package:hive_ce_flutter/hive_flutter.dart`. `hive_test` is replaced by a temp-dir helper (`test/helper/hive.dart`).

## Alternatives rejected
- Pin 2024-era codegen: cannot parse Dart 3.13 language features; keeps abandoned packages.
- Replace Hive with another store (isar, drift, shared_preferences JSON): requires a data migration for ~1k users; no benefit today.

## Consequences
- On-disk boxes and typeIds are unchanged, so existing installs keep their cache and bookmarks. Verify on a device that upgrades from 2.5.6 before rollout.
- Hive CE additionally generates `lib/hive_registrar.g.dart` (`Hive.registerAdapters()`); `main.dart` still registers adapters explicitly — either is fine.
- Learnings: [flutter-3-47-upgrade](../learnings/flutter-3-47-upgrade.md).
