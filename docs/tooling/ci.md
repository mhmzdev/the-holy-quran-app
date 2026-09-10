---
type: Tooling
title: CI (GitHub Actions)
description: The single workflow that analyzes and tests pull requests.
tags: [tooling, ci, github-actions]
timestamp: 2026-09-10T08:30:00Z
resource: https://github.com/mhmzdev/the-holy-quran-app/actions
---

# CI

`.github/workflows/run_test.yml` — trigger: `pull_request` to `master` and manual `workflow_dispatch`.

Steps: checkout → `subosito/flutter-action` with `FLUTTER_VERSION` (must equal `.fvmrc`, currently 3.47.3, cached) → `flutter pub get` → `dart analyze --no-fatal-warnings` → `flutter test`.

Not covered: release builds, codegen (generated files are committed), package tests, iOS/web. `.github/auto_assign.yml` assigns the PR author and requests review from `mhmzdev`.

Release builds are manual on the maintainer's machine ([release.md](../conventions/release.md)); a Play-upload workflow would need the keystore and a service-account JSON as secrets — not set up.
