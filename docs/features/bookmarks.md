---
type: Feature
title: Bookmarks
description: Save and remove whole surahs; list them on the Bookmarks screen.
tags: [feature, bookmarks, hive]
timestamp: 2026-09-10T08:30:00Z
---

# Bookmarks

**Entry:** Home → "Bookmarks" or drawer → `AppRoutes.bookmarks` → `BookmarksScreen`; toggle lives in `PageScreen`'s app bar (chapters only).

**Behaviour**
- `PageScreen.initState` dispatches `CheckBookmark(chapter)`; the icon reflects `state.isBookmarked`; tap dispatches `UpdateBookmark(chapter, !isBookmarked)`.
- `BookmarksScreen` dispatches `BookmarksFetch()` on init and renders `SurahTile`s, a "No Bookmarks yet!" empty state, a shimmer while loading, or the failure message.

**Data:** `BookmarksBloc` → `BookmarksRepo` → data provider; list of `Chapter?` under `data.bookmarks`. Membership uses Freezed value equality of the whole `Chapter` (all ayahs compared) — correct because chapter payloads are immutable, but O(n·ayahs).

**Tests:** `test/blocs/bookmarks_bloc_test.dart`.

**Known gaps:** bookmarks are per-surah, not per-ayah; no reorder/notes; every check re-reads and re-emits the full list (fine at this scale).
