---
type: Feature
title: Juz index & reading
description: Grid of the 30 juz with Arabic names, search by number, read a juz end-to-end.
tags: [feature, juz, reading]
timestamp: 2026-09-10T08:30:00Z
---

# Juz index & reading

**Entry:** Home → "Juz Index" or drawer → `AppRoutes.juz` → `JuzIndexScreen` (`lib/ui/screens/juz/juz_index_screen.dart`).

**Behaviour**
- 3-column `GridView` of `JuzUtils.juzNames` (index + 1 = juz number). Numeric search (max 2 digits) shows a single card for that juz.
- Tap: `juzBloc.add(JuzFetch(juzIndex: n))`, then in a post-frame callback `Navigator.push(PageScreen(juz: juzBloc.state.data))`.
- `PageScreen` renders a synthetic header (`Juz No. n`, Bismillah, Arabic juz name) and the juz ayahs; no bookmark action for juz.

**Data:** `JuzBloc` → `JuzRepo` → `juzFetchHive(n)` else `juzFetchApi(n)`; cached under `data.juz{n}`. Splash preloads all 30 on launch.

**Tests:** `test/blocs/juz_bloc_test.dart`, `test/widget/screens/juz_index_screen_test.dart` (30 cards).

**Known gaps**
- The push reads `juzBloc.state.data` one frame after dispatch; if the juz is not cached yet (first launch, slow network) the page can open with the previously loaded juz or `null` ayahs. A fix is to navigate from a `BlocListener` on `JuzFetchSuccess` for the requested number, or carry the number and let the page own the fetch.
- `JuzState.data` holds only the last fetched juz; there is no per-juz loading state.
