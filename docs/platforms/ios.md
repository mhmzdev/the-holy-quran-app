---
type: Platform
title: iOS
description: Kept compiling for a possible App Store release; not shipped. What's configured and what's missing.
tags: [platform, ios]
timestamp: 2026-09-10T08:30:00Z
---

# iOS (not shipped)

| Item | Value |
|---|---|
| Deployment target | 15.0 (`IPHONEOS_DEPLOYMENT_TARGET`, `AppFrameworkInfo.plist`, `Podfile`) — matches the Flutter 3.47 template |
| Bundle identifier | **`com.example.alQuran`** — placeholder, must become e.g. `com.hmz.alQuran` before any TestFlight build |
| Dependency manager | CocoaPods (`Podfile`, `Podfile.lock` committed) |
| Signing | none configured |

## Before shipping iOS
1. Set a real bundle id and team in Xcode (Runner target), and `CFBundleDisplayName`.
2. App icons: `flutter_launcher_icons` config already has `ios: true`, `remove_alpha_ios: true` — run `fvm dart run flutter_launcher_icons`.
3. Privacy manifest / App Privacy answers (no data collected).
4. Test `share_plus` (needs `sharePositionOrigin` on iPad — already passed) and `url_launcher` (`LSApplicationQueriesSchemes` not needed for https).
5. `fvm flutter build ipa`.

Keep it compiling: run `fvm flutter build ios --no-codesign` occasionally after dependency bumps.
