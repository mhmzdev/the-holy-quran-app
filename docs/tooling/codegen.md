---
type: Tooling
title: Code generation
description: Freezed, json_serializable and Hive CE adapter generation — where it runs and what it produces.
tags: [tooling, build_runner, freezed, hive]
timestamp: 2026-09-10T08:30:00Z
---

# Code generation

Runs **only** in `packages/al_quran_api` ([ADR-0008](../decisions/0008-codegen-only-in-api-package.md)):
```bash
cd packages/al_quran_api && fvm dart run build_runner build
# watch mode: fvm dart run build_runner watch
```
(`--delete-conflicting-outputs` is accepted but ignored by build_runner 2.16; outputs are overwritten.)

| Generator | Input | Output |
|---|---|---|
| freezed 4.0.1 | `abstract class X with _$X` | `x.freezed.dart` (copyWith, ==, toString) |
| json_serializable 6.14.1 (options in `build.yaml`: `explicit_to_json: true`) | `factory X.fromJson` | `_$XFromJson/_$XToJson` in `x.g.dart` |
| hive_ce_generator 1.11.3 | `@HiveType` on the factory ctor + `@HiveField`s | `XAdapter` in `x.g.dart`, plus `lib/hive_registrar.g.dart` |

Commit all generated files; CI does not run build_runner.

## Gotchas
- Freezed ≥ 3 requires `abstract class` (or `sealed`) — plain `class X with _$X` fails.
- Dart 3.13 forbids `final` inside constructor parameters (Freezed 4 change).
- The analyzer flags `@HiveType` on a constructor (`invalid_annotation_target`); it is ignored in the package's `analysis_options.yaml` because the generator reads it correctly.
- Never renumber `@HiveField`s or typeIds — [data-layer](../architecture/data-layer.md).
