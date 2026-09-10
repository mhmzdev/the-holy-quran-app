---
type: Flow
title: Routes & flows
description: Every route in the app, how screens navigate between each other, and the folder layout a screen follows.
tags: [screens, routes, navigation]
timestamp: 2026-09-10T08:30:00Z
---

# Routes & flows

## Route table (`lib/router/routes.dart` + `router.dart`)
| Route | Widget | Folder | Status |
|---|---|---|---|
| `/splash` (initial) | `SplashScreen` | `ui/screens/splash/` | done |
| `/onboarding` | `OnboardingScreen` | `ui/screens/onboarding/` | done (see gap in [onboarding-and-theme](../features/onboarding-and-theme.md)) |
| `/home` | `HomeScreen` | `ui/screens/home/` | done |
| `/surah` | `SurahIndexScreen` | `ui/screens/surah/` | done |
| `/juz` | `JuzIndexScreen` | `ui/screens/juz/` | done |
| `/bookmarks` | `BookmarksScreen` | `ui/screens/bookmarks/` | done |
| `/shareApp` | `ShareAppScreen` | `ui/screens/share_app/` | done |
| `/page` | declared only | `ui/screens/page/` | `PageScreen` is pushed with `MaterialPageRoute(builder: (_) => PageScreen(chapter: …))` or `(juz: …)`, never by name |

Global `navigator` key exists in `router.dart` but screens use `Navigator.of(context)`.

## Navigation graph
```
Splash ──(firstOpen)──▶ Onboarding ──▶ Home
   └───────────────────────────────────▶ Home ──▶ Surah Index ──▶ Page(chapter)  [long-press: info dialog]
                                          ├──▶ Juz Index ──▶ Page(juz)
                                          ├──▶ Bookmarks ──▶ Page(chapter)
                                          ├──▶ Share App
                                          └──▶ Onboarding (from drawer, args {'route':'drawer'} → pops back)
Home back button → "Exit Application?" dialog → SystemNavigator.pop
```
Home uses a custom 3D drawer (`AnimationController` + `Transform` in `home_screen.dart`); items come from `DrawerUtils.items`.

## Screen folder layout
```
lib/ui/screens/<name>/
  <name>_screen.dart      public widget; App.init; Screen(...) wrapper; part declarations
  widgets/<piece>.dart    part of '../<name>_screen.dart'; private classes (_Body, _Tile, …)
```
Hygen can scaffold this (`hygen screen new <name>`) but generates a Provider-based `_state.dart` style — see [tooling/hygen.md](../tooling/hygen.md).
