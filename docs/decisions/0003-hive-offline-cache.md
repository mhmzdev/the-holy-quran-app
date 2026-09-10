---
type: Decision
title: "ADR-0003: Hive as the offline cache (cache-first reads)"
description: Chapters, juz and bookmarks are stored in a Hive box named data; reads hit Hive first and fall back to the API only when the key is absent.
tags: [decision, adr]
timestamp: 2026-09-10T08:30:00Z
date: 2023-06-01
status: accepted
---

# ADR-0003: Hive as the offline cache (cache-first reads)

**Date:** 2023-06-01 · **Status:** accepted

## Context
Users read the Qur'an daily, often offline. The alquran.cloud payloads are static (Uthmani text never changes).

## Decision
- Persist `List<Chapter>`, each `Juz`, and the bookmark list in box `data`; settings in box `app`.
- Typed adapters via `@HiveType`/`@HiveField` on Freezed models; typeIds 0/1/2 fixed in `AppHiveTypes`.
- Cache-first: no TTL; API refetch only on explicit retry or missing key.

## Consequences
- App is fully usable offline after the first successful splash preload.
- Schema changes must be additive (new field index / new typeId) — existing users' boxes are read by the new adapters. See [data-layer](../architecture/data-layer.md).
- Date approximate (offline mode shipped before this knowledge base existed).
