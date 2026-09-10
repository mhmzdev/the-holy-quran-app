---
type: Decision
title: "ADR-0001: Bloc for business state, Provider for app state"
description: Business/data state lives in flutter_bloc Blocs with Equatable states; app/UI state in Provider ChangeNotifiers.
tags: [decision, adr]
timestamp: 2026-09-10T08:30:00Z
date: 2023-06-01
status: accepted
---

# ADR-0001: Bloc for business state, Provider for app state

**Date:** 2023-06-01 · **Status:** accepted

## Context
The app needs asynchronous fetch/cache flows with explicit loading/success/failure states (chapters, juz, bookmarks) and a few global toggles (theme, onboarding index).

## Decision
- Fetch/cache flows are `Bloc`s (event in, Equatable state out) under `lib/blocs/`, registered as get_it singletons and exposed with `BlocProvider`.
- Lightweight app state is a `ChangeNotifier` under `lib/providers/`.
- Widgets never call repos directly.

## Consequences
- Every fetch has testable, enumerable states (`bloc_test`).
- Two mechanisms coexist; the rule for which to use is in [state-management](../architecture/state-management.md).
- The date is approximate (pre-dates this knowledge base); recorded from the code as found.
