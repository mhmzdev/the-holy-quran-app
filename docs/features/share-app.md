---
type: Feature
title: Share app
description: Share the Play Store link, open the GitHub repo, or open the store listing for feedback.
tags: [feature, share]
timestamp: 2026-09-10T08:30:00Z
resource: https://play.google.com/store/apps/details?id=com.hmz.al_quran
---

# Share app (`lib/ui/screens/share_app/share_app.dart`)

- **Share App** → `SharePlus.instance.share(ShareParams(text, subject, sharePositionOrigin))` with the Play Store link and a Sadaqah Jariyah line (`share_plus` 13 API).
- **GitHub Repo** → `launchUrl` to `https://github.com/mhmzdev/The_Holy_Quran_App` (redirects to the current repo name).
- **Rate & Feedback** → `launchUrl` to the Play listing.
- Shows the logo and `AppVersion` (from `package_info_plus`).

Reachable from the drawer ("Share App") → `AppRoutes.shareApp`. No bloc; no tests beyond the home drawer text check.
