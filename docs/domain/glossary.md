---
type: Concept
title: Glossary
description: Domain terms as they appear in the code (Chapter = Surah, Ayah, Juz, Uthmani script) and what users expect from them.
tags: [domain, glossary, quran]
timestamp: 2026-09-10T08:30:00Z
---

# Glossary

| Term | In code | Meaning |
|---|---|---|
| **Surah** (سورة) | `Chapter` model; "Surah Index" screen | One of the 114 chapters. Fields: `number` (1–114), `name` (Arabic), `englishName` (transliteration, e.g. "Al-Faatiha"), `englishNameTranslation` (e.g. "The Opening"), `revelationType`, `ayahs`. |
| **Ayah** (آية) | `Ayah` model | A verse. `number` is the verse number within its surah/juz payload; `text` is the Arabic Uthmani text. Rendered right-aligned in the Noor font with a numbered badge. |
| **Juz** (جزء) | `Juz` model; "Juz Index" screen; `JuzUtils.juzNames` | One of 30 roughly equal divisions used for reading the whole Qur'an in a month. `number` 1–30; `ayahs` spans surah boundaries. Each juz is traditionally named by its opening words — the 30 Arabic names in `JuzUtils` (e.g. juz 1 "آلم", juz 30 "عَمَّ"). |
| **Uthmani script** | edition `quran-uthmani` in API paths | The standard Mushaf orthography. The only edition the app fetches; text is immutable, hence the cache-first strategy. |
| **Revelation type** | `Chapter.revelationType` | `Meccan` or `Medinan` — where the surah was revealed. Shown in the surah info dialog. |
| **Bismillah** | literal in `PageScreen` juz header | "بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ", shown as the subtitle for juz pages. |
| **Bookmark** | `bookmarks` Hive key, `BookmarksBloc` | A saved surah (whole `Chapter`), not a verse position. |
| **Sadaqah Jariyah** | share text ("Sadaq-e-Jaria") | Ongoing charity — the motivation line in the share message. |
| **Mushaf / page** | `PageScreen`, route `/page` | The reading view for one surah or one juz. |

## User expectations worth remembering
- Arabic is RTL; verse text must be right-aligned and never truncated.
- Readers use the app daily and often offline — losing the cache or bookmarks on update is the worst regression.
- Surah search is by transliterated English name; juz search is by number (1–30).
