---
type: Convention
title: Dart & Flutter conventions
description: Style rules, widget structure, configs usage, error handling pattern and the pre-completion checklist for app and package code.
tags: [conventions, dart, flutter, style]
timestamp: 2026-09-10T08:30:00Z
---

# Dart & Flutter conventions

## Lints
Root: `package:flutter_lints/flutter.yaml`; packages: `package:lints/recommended.yaml`. Extra rules everywhere: `require_trailing_commas`, `prefer_single_quotes`, `prefer_const_declarations`, `unnecessary_this`, `prefer_final_locals`, `omit_local_variable_types`. Generated files are excluded. The api package ignores `invalid_annotation_target` (Hive CE's Freezed pattern puts `@HiveType` on the factory constructor).

## Structure
- **Screens**: `lib/ui/screens/<name>/<name>_screen.dart` (or `<name>.dart` for older ones) owns `part 'widgets/…'` files; private widgets are classes prefixed `_`. Screens are assemblers; heavy pieces become private widgets.
- **Shared widgets**: `lib/ui/widgets/<category>/`; check the [catalogue](../architecture/configs.md) first.
- **Blocs / providers / data**: see [state-management](../architecture/state-management.md) and [data-layer](../architecture/data-layer.md).
- **Routes**: constants in `AppRoutes`, map in `router.dart`; navigate with `Navigator.pushNamed(context, AppRoutes.x)` or the `String.push(context)` extension.
- **Assets**: `StaticAssets.*` only; regenerate with `fvm dart run scripts/assets.dart` after adding files under `assets/`.

## Widgets
- Classes only — never `Widget _buildX()`; the sole `Widget`-returning method is `build`.
- `App.init(context)` is the first statement of every `build`.
- `const` constructors and `const` widgets wherever possible.
- Tokens: `AppTheme.c!`, `AppText`, `Space`, `AppDimensions`, `UIProps`. No inline hex colours, no raw pixel sizes, no `withOpacity` (use `withValues(alpha:)`). Legacy code still uses `Colors.grey[850]`/`Color(0xffee8f8b)`; migrate opportunistically, never add more.
- Arabic text: `fontFamily: 'Noor'`, right-aligned.

## Async & errors
- Data provider and repos: `try { … } catch (e) { throw Exception('Internal <Area> <API|Hive|Repo> Error'); }`.
- Blocs: always `await` the repo; catch-all emits `…Failed(message: e.toString())`.
- UI: never `try/catch` around bloc dispatch; render the Failed state with a retry action.
- No `print`; there is no logger yet — if you need one, add it as an ADR-backed decision.

## Dependencies
Exact pins in all three pubspecs; bump on purpose with a `docs/log.md` line. Codegen packages only in `packages/al_quran_api` ([why](../decisions/0008-codegen-only-in-api-package.md)).

## Pre-completion checklist
1. `fvm flutter analyze` — zero issues.
2. `fvm flutter test` — green.
3. Models changed? `cd packages/al_quran_api && fvm dart run build_runner build` and commit generated files.
4. Android/Gradle/pubspec changed? `fvm flutter build apk --release` succeeds.
5. Docs: feature/architecture/decision pages updated; `docs/log.md` line added.
