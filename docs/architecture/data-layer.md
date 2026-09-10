---
type: Architecture
title: Data layer
description: The two local packages (al_quran_api, al_quran_repo), Freezed + Hive models, box/key layout, and the cache-first fetch flow.
tags: [architecture, data, hive, dio, freezed]
timestamp: 2026-09-10T08:30:00Z
---

# Data layer

## Packages
| Package | Role | Depends on |
|---|---|---|
| `packages/al_quran_api` | HTTP client, models, data provider, **all codegen** | dio, freezed_annotation, json_annotation, hive_ce (+ dev: build_runner, freezed, json_serializable, hive_ce_generator) |
| `packages/al_quran_repo` | Repos + interfaces wrapping the data provider | al_quran_api |

Both are path dependencies of the app with exact-pinned versions.

## HTTP
`Api.ins` (singleton) extends sealed `BaseApi` → Dio with `baseUrl = URLs.base = 'https://api.alquran.cloud'`, JSON content type, 30 s connect/receive timeouts. `ApiMethods` extension adds `get/post/put/delete`. Endpoints and payloads: [domain/alquran-cloud-api.md](../domain/alquran-cloud-api.md).

## Models (`al_quran_api/lib/src/models/`)
Freezed + json_serializable + Hive CE adapters, all generated from one declaration:
```dart
@Freezed(makeCollectionsUnmodifiable: false)
abstract class Chapter with _$Chapter {
  const Chapter._();
  @HiveType(typeId: AppHiveTypes.chapter, adapterName: 'ChapterAdapter')
  const factory Chapter({ @HiveField(0) int? number, @HiveField(1) String? name, … @HiveField(5) List<Ayah?>? ayahs }) = _Chapter;
  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);
}
```
| Model | typeId | Fields (HiveField index) |
|---|---|---|
| `Ayah` | 0 | number(0), text(1) |
| `Chapter` | 1 | number(0), name(1), englishName(2), englishNameTranslation(3), revelationType(4), ayahs(5) |
| `Juz` | 2 | number(0), ayahs(1) |

typeIds are declared in `src/static/hive.dart` (`AppHiveTypes`) and mirrored in `lib/static/hive.dart`. **They are part of users' on-disk data — never reuse or renumber.** Generated: `*.freezed.dart`, `*.g.dart` (JSON + adapter), `lib/hive_registrar.g.dart` (`Hive.registerAdapters()` extension — `main.dart` currently registers the three adapters explicitly, which is equivalent).

## Hive boxes and keys
| Box | Opened in | Keys |
|---|---|---|
| `app` | `main.dart` and `AppProvider` | `Cache.theme` → `'light'|'dark'|'system'`, `Cache.firstOpen` → `'true'` |
| `data` | `main.dart` | `chapters` → `List<Chapter>`, `juz{1..30}` → `Juz`, `bookmarks` → `List<Chapter?>` |

## Data provider (`AlQuranDataProviderImpl implements IAlQuranDataProvider`)
- `getChapters()` — GET `/v1/quran/quran-uthmani`, maps `data.surahs`, writes `chapters`.
- `getChaptersHive()` — reads `chapters` or `null`.
- `juzFetchApi(n)` — GET `/v1/juz/{n}/quran-uthmani`, writes `juz{n}`. `juzFetchHive(n)` reads it.
- `fetchBookmarks()` / `addBookmark(c)` / `removeBookmark(c)` / `checkBookmarked(c)` — list stored under `bookmarks`; equality is Freezed value equality on the whole `Chapter` (including ayahs).
Every method wraps failures as `Exception('Internal <Area> <API|Hive> Error')`.

## Repos (`al_quran_repo`)
`ChapterRepo`, `JuzRepo`, `BookmarksRepo` implement `IChapterRepo` / `IJuzRepo` / `IBookmarkRepo`, take the data provider by constructor (default `AlQuranDataProviderImpl()`), delegate 1:1, and re-wrap errors. Blocs depend on the concrete repo classes; tests mock them with mocktail.

## Cache-first flow
```
Bloc event → repo.getXHive() → non-null? emit Success(cached)
                              → null?     repo.getX() (API, also writes cache) → emit Success(fresh)
                              → throws?   emit Failed(message)
```
There is no TTL or invalidation; the API re-fetch happens only via retry (`ChapterFetch(api: true)`) or when a key is absent.

## Changing the schema
1. Add fields with a **new** `@HiveField` index (nullable) or a new model with a **new** typeId in both `AppHiveTypes` files.
2. `cd packages/al_quran_api && fvm dart run build_runner build`; commit generated files.
3. Register any new adapter in `main.dart` (or switch to `Hive.registerAdapters()`).
4. Old caches lack the new field → code must tolerate `null`. Record an ADR if the format changes.
