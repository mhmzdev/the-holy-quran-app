---
type: Architecture
title: System overview
description: Layered map of the app from widgets down to the alquran.cloud API and Hive, plus startup sequence and error flow.
tags: [architecture, layers, startup]
timestamp: 2026-09-10T08:30:00Z
---

# System overview

Single Flutter app, no backend of our own. Data comes from the public alquran.cloud REST API and is cached on-device with Hive so the app works offline after the first successful fetch.

## Layers (dependencies point down only)

```
lib/ui/screens, lib/ui/widgets        UI — pure view; dispatches bloc events, reads bloc/provider state
        │
lib/blocs/{chapter,juz,bookmarks}     Bloc — business/data state (flutter_bloc + equatable)
lib/providers/{app,onboarding}        Provider — app/UI state only (theme, first-open, onboarding page index)
        │
packages/al_quran_repo                Repo — ChapterRepo / JuzRepo / BookmarksRepo (thin, interface-backed)
        │
packages/al_quran_api                 DataProvider — AlQuranDataProviderImpl: Dio client + Hive 'data' box; Freezed/Hive models
        │                                     │
https://api.alquran.cloud            Hive boxes: 'app' (settings), 'data' (chapters, juz{n}, bookmarks)
```

Wiring: [`lib/services/locator.dart`](../../lib/services/locator.dart) registers the data provider, repos and blocs as get_it singletons; [`lib/app.dart`](../../lib/app.dart) exposes blocs via `BlocProvider` and providers via `ChangeNotifierProvider`, then builds `MaterialApp` with named routes.

## Startup sequence
1. `main()` — `usePathUrlStrategy()` (web), `Hive.initFlutter()`, register `JuzAdapter`/`AyahAdapter`/`ChapterAdapter`, open boxes `app` and `data`, `initServiceLocator()`, `runApp(MyApp())`.
2. `MyApp` — locks portrait orientation, builds providers, `MaterialApp` with `initialRoute: AppRoutes.splash`, `App.init(context)` in `builder`.
3. `SplashScreen` — dispatches `ChapterFetch()` (cache-first), `BookmarksFetch()`, and `JuzFetch(i)` for i = 1..30; after 1 s navigates to onboarding (first open) or home. Fetches keep running in the background; index screens read bloc state when opened.

## Error flow
DataProvider → `throw Exception('Internal <Area> <API|Hive> Error')` → Repo re-wraps as `Exception('Internal … Repo Error')` → Bloc catches and emits `…FetchFailed(message: e.toString())` → UI shows the message with a retry (`ChapterFetch(api: true)`). No typed fault hierarchy exists; see [decisions](../decisions/index.md) before introducing one.

## Cross-cutting
- Configs layer ([configs.md](configs.md)) provides responsive tokens; `App.init(context)` must run before tokens are read.
- Theme mode and first-open flag persist in the `app` box via `AppProvider` ([state-management.md](state-management.md)).
- Platform status: Android shipped, iOS buildable, web broken — [platforms](../platforms/index.md).
