---
type: Feature
title: Juz index & reading
description: Grid of the 30 juz with Arabic names, search by number, read a juz end-to-end.
tags: [feature, juz, reading]
timestamp: 2026-09-10T09:40:00Z
---

# Juz index & reading

**Entry:** Home → "Juz Index" or drawer → `AppRoutes.juz` → `JuzIndexScreen` (`lib/ui/screens/juz/juz_index_screen.dart`).

**Behaviour**
- 3-column `GridView` of `JuzUtils.juzNames` (index + 1 = juz number). Numeric search (max 2 digits) shows a single card for that juz.
- Tap: `_openJuz(n)` stores the number as `_pendingJuz`, shows a progress overlay and dispatches `JuzFetch(juzIndex: n)`. A `BlocListener<JuzBloc, JuzState>` pushes `PageScreen(juz:)` when a `JuzFetchSuccess` for that number arrives (or shows a snackbar on `JuzFetchFailed`).
- `PageScreen` renders a synthetic header (`Juz No. n`, Bismillah, Arabic juz name) and the juz ayahs; no bookmark action for juz.

**Data:** `JuzBloc` → `JuzRepo` → `juzFetchHive(n)` else `juzFetchApi(n)`; cached under `data.juz{n}`. Splash preloads all 30 on launch.

**Tests:** `test/blocs/juz_bloc_test.dart`, `test/widget/screens/juz_index_screen_test.dart` (30 cards).

**Known gaps**
- `JuzState.data` holds only the last fetched juz; there is no per-juz loading state.
- Because `JuzFetch` is processed sequentially, a tap during the first-launch preload waits behind the remaining preload fetches.
- Backlog idea: derive juz from the already-cached chapters (each ayah in the whole-Qur'an payload carries a `juz` number) and drop the 30 extra requests entirely.
