---
type: Decision
title: "ADR-0006: .agents/ is the source of truth for rules and skills; .claude/ symlinks to it"
description: Rules and skills are authored once under .agents/ and exposed to Claude Code through .claude/rules and .claude/skills symlinks; CLAUDE.md is just @AGENTS.md.
tags: [decision, adr]
timestamp: 2026-09-10T08:30:00Z
date: 2026-09-10
status: accepted
---

# ADR-0006: .agents/ is the source of truth for rules and skills; .claude/ symlinks to it

**Date:** 2026-09-10 · **Status:** accepted

## Context
Several agent tools read `AGENTS.md`/`.agents/`; Claude Code reads `CLAUDE.md`, `.claude/rules/` and `.claude/skills/`. Maintaining two copies drifts.

## Decision
- `AGENTS.md` holds the map; `CLAUDE.md` contains only `@AGENTS.md`.
- `.agents/rules/*.md` (path-scoped, `paths:` frontmatter) and `.agents/skills/*/SKILL.md` are canonical.
- `.claude/rules → ../.agents/rules`, `.claude/skills → ../.agents/skills` (relative symlinks, committed). `.claude/settings.json` stays a real file (Claude-specific hooks/permissions).

## Consequences
- Edit only under `.agents/`. Skill names must not collide with Claude Code built-ins (the UI skill is `ui-design`, not `design`).
- Windows checkouts need symlink support enabled; otherwise copy the folders.
