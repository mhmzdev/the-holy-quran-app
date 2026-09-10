---
name: refine-approach
description: Sharpen an existing brainstorm or execution plan for The Holy Qur'an app — score it for clarity, completeness, specificity, YAGNI, and scope, then improve it in place. Use when the user says "refine this", "tighten the plan", "review the approach", or after brainstorming/planning to harden the doc before building.
argument-hint: path to a doc in docs/brainstorm/ or docs/exec-plans/
---

# Refine Approach

Improve a **thinking document** in place — a brainstorm or a plan. Not a rewrite, not new scope: tighter, clearer, more honest.

## Step 1 — Get the doc
Given a path, read it whole. Otherwise list `docs/brainstorm/` and `docs/exec-plans/backlog/` (+ `active/`) and ask which.

## Step 2 — Interrogate it (answer from the doc + codebase where you can)
- **Unclear?** A step a fresh agent would misread.
- **Unnecessary?** Hypotheticals, gold-plating (solo app, ~1k users, no backend) → cut.
- **Avoided?** A hard decision left implicit that `/build` will trip over (Hive schema change, navigation, splash preload).
- **Assumed?** A pattern claimed but not verified — grep for the bloc/repo/route.
- **At risk?** Users' cached boxes, permissions, Play policy, version bump — under-treated?
- **Underestimated?** A phase that's really three, or a "simple" change that crosses layers.

## Step 3 — Score (Weak / OK / Strong, one line each)
1. **Clarity** 2. **Completeness** (every criterion has a `verify:`; analyze + test are gates) 3. **Specificity** (real paths, real class names, real commands) 4. **YAGNI** 5. **Scope** (one PR / sane phases).

## Step 4 — Flag the one thing
Name the single most important issue first.

## Step 5 — Improve in place
- Minor fixes (wording, a missing path, a `verify:`, marking an assumption) → apply.
- Substantive (dropping a requirement, restructuring phases, splitting) → propose, get approval, apply.
- Edit the existing file; keep its structure and frontmatter; update `timestamp`. Update the `docs/exec-plans/index.md` row if a plan's problem statement or dependencies changed.

## Step 6 — Handoff
Brainstorm refined → `/grill-me`, then `/plan`. Plan refined → `/build`, or `/grill-me` for a final pass. After two passes, recommend shipping.

## What NOT to do
- Rewrite the whole doc. Add requirements never discussed. Create a separate review file. Remove real constraints, rationale, or open questions.
