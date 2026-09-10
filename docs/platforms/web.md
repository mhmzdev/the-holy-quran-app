---
type: Platform
title: Web (GitHub Pages)
description: How the Flutter web build is produced and deployed to https://mhmzdev.github.io/quran/, what broke it before, and its known limits.
tags: [platform, web, github-pages]
timestamp: 2026-09-10T09:40:00Z
resource: https://mhmzdev.github.io/quran/
---

# Web

Served from the separate repo `mhmzdev.github.io` (GitHub Pages, branch `master`) under `/quran/`. There is no CI; deploying is a build + copy + push done from this checkout.

## Deploy
```bash
bash scripts/deploy_web.sh            # builds and copies build/web → ../mhmzdev.github.io/quran
cd ../mhmzdev.github.io && git add quran && git commit -m "quran: deploy X.Y.Z" && git push
```
The script runs `fvm flutter build web --release --base-href /quran/ --no-tree-shake-icons`:
- `--base-href /quran/` — the app lives under a sub-path; with the default `/` every asset 404s and only the HTML loader image shows.
- `--no-tree-shake-icons` — the icon subsetter aborts on one of the bundled icon fonts ("could not be parsed as a valid unicode codepoint").

URLs use the hash strategy (`/quran/#/home`). GitHub Pages has no SPA fallback, so path URLs would 404 on refresh or deep link.

## What was broken (fixed 2026-09-10)
1. Deployed `index.html` had `<base href="/">` → nothing loaded.
2. `web/index.html` called `_flutter.loader.load()` **and** included `flutter_bootstrap.js` → two Flutter instances, every request doubled. Now only `flutter_bootstrap.js` boots the app; the HTML loader fades on the `flutter-first-frame` event.
3. Dio's default `contentType: application/json` on GET forced a CORS preflight; api.alquran.cloud answers `OPTIONS` with 405. Removed the default content type (simple GETs get `Access-Control-Allow-Origin: *`).
4. Splash fired 31 requests at once; the API allows 12/s (429, `Retry-After: 1`) and 429 responses carry no CORS header, so they surfaced as CORS errors. `JuzBloc` now processes `JuzFetch` sequentially and the HTTP client retries 429s.

## Known limits
- First load fetches the whole Qur'an (~2.5 MB JSON) plus 30 juz sequentially; on web this takes tens of seconds before the Juz index works offline. Hive CE persists to IndexedDB, so later loads are instant.
- `share_plus` uses the Web Share API (works on mobile browsers, may be unavailable on desktop). `package_info_plus` reads `version.json`.
- The layout is the phone layout scaled up; no dedicated desktop breakpoints yet.
- Web isn't covered by CI or tests; run the deploy script and click through Surah, Juz and Bookmarks before pushing.
