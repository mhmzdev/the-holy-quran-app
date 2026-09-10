---
type: Feature
title: Onboarding & theme
description: Four-page introduction (also reachable from the drawer) and persisted light/dark theme.
tags: [feature, onboarding, theme, provider]
timestamp: 2026-09-10T08:30:00Z
---

# Onboarding & theme

## Onboarding (`lib/ui/screens/onboarding/onboarding.dart`)
- Four `_OnBoardingPage`s (logo/quote, UI, easy navigation, 3D drawer) in a `PageView`; `OnBoardingProvider.index` drives the `_Indicator` dots and the FAB (arrow → next, check → finish).
- **Skip**/finish: if opened from the drawer (`arguments: {'route': 'drawer'}`, drawer item "Introduction") it pops back; otherwise `pushReplacementNamed(AppRoutes.home)`.
- Splash routes here when `AppProvider.firstOpen` is true.

## Theme (`AppProvider`, `lib/providers/app_provider.dart`)
- `themeMode` (default light) persisted in box `app` under `Cache.theme` as `'light'|'dark'|'system'`; `MaterialApp.themeMode` follows it. The drawer's "Dark Mode" switch calls `setTheme`.
- `isDark` is used by screens to pick backgrounds and by `Screen` for the status-bar style.
- `reset()` clears the box and re-keys the app.

## Known gaps
- `setFirstOpen()` is never called and `AppProvider._init()` is async, so `firstOpen` is usually still `false` when Splash reads it → onboarding rarely shows automatically; it is effectively drawer-only today. Decide the intended behaviour before "fixing".
- Theme default is light regardless of system setting (`'system'` is supported in the map but never selected by UI).
