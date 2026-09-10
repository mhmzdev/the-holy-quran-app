---
type: Feature
title: Surah index & reading
description: List, search and read any of the 114 surahs; long-press for surah info.
tags: [feature, surah, reading]
timestamp: 2026-09-10T08:30:00Z
---

# Surah index & reading

**Entry:** Home → "Surah Index" button or drawer → route `AppRoutes.surah` → `SurahIndexScreen` (`lib/ui/screens/surah/`).

**Behaviour**
- Reads `context.read<ChapterBloc>().state.data` in `initState`; if empty, shows a `BlocBuilder`: loading bar while `ChapterFetchLoading`, otherwise an error with **Retry** → `ChapterFetch(api: true)`.
- Search field filters by `englishName` (case-insensitive contains, sorted by match position).
- `SurahTile` (number, English name + translation, Arabic name) → tap pushes `PageScreen(chapter:)` with `MaterialPageRoute`; long-press opens `_SurahInformation` dialog (name, translation, revelation type, ayah count).
- Dark mode adds `Flare` particle decorations.

**Reading (`PageScreen`, `lib/ui/screens/page/page_screen.dart`, a `part` of the surah screen)**
- `SliverAppBar` (pinned, expanded 27% height) with `_SurahAppBar` header; bookmark toggle in actions (chapters only).
- `SliverList` of ayahs: right-aligned Noor text, numbered circular badge, `WidgetAnimator` entrance.

**Data:** `ChapterBloc` → `ChapterRepo` → `getChaptersHive()` / `getChapters()` ([data-layer](../architecture/data-layer.md)).

**Tests:** `test/blocs/chapter_bloc_test.dart`, `test/widget/screens/surah_index_screen_test.dart` (verifies 114 tiles by scrolling).

**Known gaps:** search only matches transliterated names (not Arabic or translation); no verse-level navigation or last-read position.
