---
type: Decision
title: "ADR-0002: Split the data layer into al_quran_api and al_quran_repo packages"
description: HTTP client, models and the Hive-backed data provider live in al_quran_api; interface-backed repos live in al_quran_repo; the app depends on both by path.
tags: [decision, adr]
timestamp: 2026-09-10T08:30:00Z
date: 2025-02-21
status: accepted
---

# ADR-0002: Split the data layer into al_quran_api and al_quran_repo packages

**Date:** 2025-02-21 · **Status:** accepted

## Context
Keep networking/storage code and codegen out of the app package, and give blocs a mockable seam.

## Decision
- `packages/al_quran_api`: Dio `Api`, Freezed/Hive models, `AlQuranDataProviderImpl`.
- `packages/al_quran_repo`: `ChapterRepo`, `JuzRepo`, `BookmarksRepo` behind interfaces.
- Both are path dependencies with exact version pins.

## Consequences
- Blocs are tested with mocktail mocks of the repos.
- Three pubspecs to keep in sync on upgrades (see [ADR-0008](0008-codegen-only-in-api-package.md)).
- Date taken from git history of the packages directory (Feb 2025 restructure).
