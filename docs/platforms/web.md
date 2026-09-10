---
type: Platform
title: Web
description: The Flutter web build exists but is broken; an old build is hosted on GitHub Pages. Out of scope until scheduled.
tags: [platform, web, github-pages]
timestamp: 2026-09-10T08:30:00Z
resource: https://mhmzdev.github.io/quran
---

# Web (broken)

- `web/` holds the standard shell (`index.html` with `$FLUTTER_BASE_HREF`, `manifest.json`, icons). `main.dart` calls `usePathUrlStrategy()` from `flutter_web_plugins` (replaced the unmaintained `url_strategy` package on 2026-09-10).
- A previously built copy lives in the separate repo `mhmzdev.github.io` under `/quran` (`main.dart.js`, `canvaskit/`, `flutter_service_worker.js`) and is served at the resource URL above. It was produced by copying `build/web` output; there is no deploy script.
- Status: the responsive web build "doesn't work" (maintainer, 2026-09-10). Not investigated in the knowledge base yet; nothing in the app is web-guarded except the URL strategy.

## When picking this up
1. `fvm flutter build web --base-href /quran/` and load it locally; capture the actual failure (Hive on web uses IndexedDB via hive_ce and should work; check `share_plus`/`package_info_plus` web support and the 3D drawer transforms).
2. Decide hosting/deploy (GitHub Pages from this repo via Actions vs. copying into `mhmzdev.github.io`).
3. Write a plan in `docs/exec-plans/backlog/`.
