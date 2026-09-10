---
type: Decision
title: "ADR-0007: docs/ is an Open Knowledge Format bundle"
description: The knowledge base follows OKF: markdown + YAML frontmatter, one concept per file, index.md per folder, log.md, relative links; organised by architecture / conventions / decisions / domain / features / screens / tooling / platforms / plans / learnings.
tags: [decision, adr]
timestamp: 2026-09-10T08:30:00Z
date: 2026-09-10
status: accepted
---

# ADR-0007: docs/ is an Open Knowledge Format bundle

**Date:** 2026-09-10 · **Status:** accepted

## Context
The repo had no docs, ADRs or domain notes. We want context that both humans and agents can navigate progressively and that stays version-controlled with the code.

## Decision
Adopt OKF conventions (Google Cloud, 2026): every `docs/**/*.md` carries frontmatter with `type` (required), `title`, `description`, `tags`, `timestamp`, optional `resource`; folders carry `index.md`; `docs/log.md` is the chronology; links are relative markdown links. Type vocabulary is listed in [docs/index.md](../index.md). ADRs are one file each under `decisions/`, append-only, with `date` and `status` fields.

## Consequences
- `/docs-gardening` validates frontmatter, links and drift.
- Plans (`exec-plans/`), brainstorms and review reports are OKF documents too.
