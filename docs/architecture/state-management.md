---
type: Architecture
title: State management
description: Bloc for business/data state, Provider for app/UI state, get_it for wiring — with the exact file anatomy used in this repo.
tags: [architecture, bloc, provider, get_it]
timestamp: 2026-09-10T08:30:00Z
---

# State management

## Two tiers
| Tier | Tool | Lives in | Examples |
|---|---|---|---|
| Business / data | `flutter_bloc` Bloc + `equatable` | `lib/blocs/<name>/` | `ChapterBloc`, `JuzBloc`, `BookmarksBloc` |
| App / UI | `provider` ChangeNotifier | `lib/providers/` | `AppProvider` (themeMode, isDark, firstOpen, reset), `OnBoardingProvider` (page index) |

Screen-local transient state (search text, selected index) is plain `setState` inside the screen's State class — see `surah_index_screen.dart`.

## Bloc anatomy (copy `lib/blocs/chapter/`)
```
bloc.dart     class ChapterBloc extends Bloc<ChapterEvent, ChapterState>
              ChapterBloc({required this._repo}) : super(ChapterDefault()) { on<ChapterFetch>(_onChapterFetch); }
event.dart    part of 'bloc.dart'; sealed class ChapterEvent; class ChapterFetch extends ChapterEvent { final bool api; }
state.dart    part of 'bloc.dart'; class ChapterState extends Equatable { data, message; props = [data, message] }
              ChapterDefault / ChapterFetchLoading / ChapterFetchSuccess({data}) / ChapterFetchFailed({message})
```
Handler shape: emit Loading → try repo (cache first, API fallback when cache returns `null`) → emit Success(data) → catch → emit Failed(e.toString()).

Current blocs and events:
- **ChapterBloc** — `ChapterFetch({api = false})`: Hive `chapters` unless `api: true`, else `/v1/quran/quran-uthmani`.
- **JuzBloc** — `JuzFetch({juzIndex})`: Hive `juz{n}` else `/v1/juz/{n}/quran-uthmani`. State `data` is a single `Juz` (the last fetched one).
- **BookmarksBloc** — `BookmarksFetch()`, `UpdateBookmark(chapter, add)`, `CheckBookmark(chapter)`. State adds `isBookmarked`.

## Wiring
1. `lib/services/locator.dart`: `sl.registerSingleton<XRepo>(XRepo(provider: sl()))` then `sl.registerSingleton<XBloc>(XBloc(repo: sl()))`.
2. `lib/app.dart`: `BlocProvider(create: (_) => sl<XBloc>())` between `// bloc-initiate-start/end`; import between `// bloc-imports-start/end` (the hygen shell scripts target these markers).
3. Read: `context.read<XBloc>()` inside the widget tree, or `sl<XBloc>()` anywhere (both return the same singleton). Rebuild with `BlocBuilder<XBloc, XState>`.

## Providers
- `AppProvider` opens the Hive `app` box in its constructor (async), reads `Cache.theme` (`'light' | 'dark' | 'system'`) and `Cache.firstOpen`, then `notifyListeners()`. `setTheme` persists; `reset()` clears the box and bumps a root `Key`.
- `OnBoardingProvider` holds the current onboarding page index.

## Known gaps
- `AppProvider.setFirstOpen()` is never called, and `_init()` is async — `SplashScreen` reads `firstOpen` immediately, so whether onboarding shows on first launch depends on a race. Tracked in [features/onboarding-and-theme.md](../features/onboarding-and-theme.md).
- `JuzBloc` processes events sequentially (splash preload vs. the API's 12 req/s limit), so a juz tapped during the first-launch preload waits for the queue. See [features/juz-index.md](../features/juz-index.md).
