---
type: Feature
title: Offline mode (cache preload)
description: First launch downloads the whole Qur'an and all 30 juz into Hive; afterwards every screen reads from disk.
tags: [feature, offline, hive, splash]
timestamp: 2026-09-10T09:40:00Z
---

# Offline mode

**Where:** `SplashScreen` (`lib/ui/screens/splash/splash.dart`) + the three blocs + Hive box `data`.

**Flow**
1. Splash dispatches `ChapterFetch()` (Hive first), `BookmarksFetch()`, and `JuzFetch(1..30)`. `JuzBloc` handles those **one at a time** (the API allows 12 requests/second) and the HTTP client retries 429s, so a first launch preloads all 30 juz in roughly 30–60 s depending on the network.
2. Shimmer status text: "Getting all Surahs…" / "Setting up Bookmarks…" / "Setting up offline mode…" depending on which bloc is loading.
3. After exactly 1 s the splash navigates on (onboarding or home) — fetches continue in the background.
4. Index screens read whatever the blocs hold; Surah Index shows loading/retry if chapters are still missing.

**Guarantees:** once `chapters` and `juz1..30` exist in Hive the app never needs the network again (no TTL, text is immutable). Upgrades keep the boxes ([ADR-0004](../decisions/0004-migrate-to-hive-ce.md)).

**Known gaps:** the 1 s navigation is time-based, not readiness-based; a first launch offline lands on Home with empty indexes and a retry that only re-fetches chapters (juz retry happens by tapping a juz again). Consider gating on `ChapterFetchSuccess` instead of a timer.
