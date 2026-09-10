---
type: API
title: alquran.cloud API
description: The public REST API the app reads from — endpoints used, response shapes, model mapping, and operational notes.
tags: [domain, api, http]
timestamp: 2026-09-10T09:40:00Z
resource: https://alquran.cloud/api
---

# alquran.cloud API

Free public API, no key. Base URL in code: `URLs.base = 'https://api.alquran.cloud'` (`packages/al_quran_api/lib/src/services/http/urls.dart`). All calls go through `Api.ins` (Dio, 30 s timeouts).

## Endpoints used
| Call | Path | Used by | Cached as |
|---|---|---|---|
| Whole Qur'an, Uthmani | `GET /v1/quran/quran-uthmani` | `getChapters()` | `data.chapters` |
| One juz, Uthmani | `GET /v1/juz/{1..30}/quran-uthmani` | `juzFetchApi(n)` | `data.juz{n}` |

## Response shape (relevant parts)
```json
{ "code": 200, "status": "OK", "data": {
    "surahs": [ { "number": 1, "name": "سُورَةُ ٱلْفَاتِحَةِ", "englishName": "Al-Faatiha",
                  "englishNameTranslation": "The Opening", "revelationType": "Meccan",
                  "ayahs": [ { "number": 1, "text": "بِسْمِ ٱللَّهِ …", "numberInSurah": 1, "juz": 1, … } ] } ],
    "edition": { "identifier": "quran-uthmani", … } } }
```
Juz payload: `data` has `number`, `ayahs` (each with a nested `surah` object), `surahs`, `edition`. Only `number` and `ayahs[].{number,text}` are kept (`Juz`/`Ayah` models ignore unknown keys).

## Mapping
`Chapter.fromJson(surah)` and `Juz.fromJson(data)` via json_serializable; extra keys ignored, missing keys → `null`. `Ayah.number` for a juz payload is the global ayah number, for a surah payload also the global number — the UI displays `index + 1` instead.

## Operational notes
- **Rate limit: 12 requests/second** (Kong gateway; \`x-ratelimit-limit-second: 12\`). Excess requests get **429** with \`Retry-After: 1\` and **no CORS headers**, which browsers report as a CORS failure. The client retries 429s ([helpers.dart](../../packages/al_quran_api/lib/src/services/http/helpers.dart)) and \`JuzBloc\` fetches sequentially.
- **CORS:** simple GETs return \`Access-Control-Allow-Origin: *\`; \`OPTIONS\` preflights return 405, so never add non-simple headers (e.g. \`Content-Type\`) to GET requests — see [platforms/web.md](../platforms/web.md).
- The whole-Qur'an call is ~2.5 MB of JSON; it runs once at first launch, then only on manual retry.
- Splash fires 30 juz requests in parallel on first launch; the API tolerates it but slow networks show "Setting up offline mode…" for a while.
- Editions/translations/audio exist on the API but are unused; adding one is a new model + typeId (see [data-layer](../architecture/data-layer.md)).
- Status/rate limits are undocumented; treat failures as transient and let the user retry.
