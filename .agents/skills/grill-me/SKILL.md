---
name: grill-me
description: Stress-test a plan, design, or idea for The Holy Qur'an app before implementation by interrogating it one question at a time — walking the decision tree, resolving dependencies, and surfacing every unstated assumption. Use when the user says "grill me", "grill this", "poke holes in this", "stress-test this plan", "what am I missing".
argument-hint: the plan/idea to grill, or a path to a brainstorm/plan doc
---

# Grill Me

You are the skeptic. Interrogate a plan or idea **relentlessly** until every decision is deliberate and no assumption is hiding. Sharpen it before a line of code is written.

Position: `/brainstorm → **/grill-me** → /plan → /build → /review`. Also usable on a finished plan right before `/build`.

## The method — one question at a time
1. **Ask ONE question, then stop and wait.** Never a numbered list of questions.
2. **Look before you ask.** Grep the bloc, read the data provider, check `docs/`. Reserve questions for decisions only the user can make.
3. **Offer a recommended answer with each question.** "How should X behave? I'd lean toward Y because Z — agree?"
4. **Walk the decision tree.** Root decision first; when an answer opens a branch, follow it before backing out.
5. **Confirm shared understanding before you stop.** The session ends when both sides agree the design holds.

## Where this app's plans actually break
- **Layering** — UI → Bloc → Repo → DataProvider → API/Hive. Where does the plan reach upward or skip a layer?
- **State tier** — is business data sneaking into a Provider, or UI toggles into a Bloc?
- **Hive schema** — new/changed model? New typeId (never reuse), new `@HiveField` index (never renumber), and what happens to ~1k users with old boxes on disk? Who handles a `null` field from an older cache?
- **Offline** — first launch without network; API down; cache present but stale. What does the user see (the Failed state message is shown raw)?
- **Splash preload** — splash fires ChapterFetch, BookmarksFetch and 30 JuzFetch events and navigates after 1s regardless. Does the plan depend on data that may not be there yet?
- **Navigation** — named routes vs the `MaterialPageRoute` exception for `PageScreen`; drawer-origin args (`{'route': 'drawer'}`).
- **Release/Play policy** — permissions, target API, versionCode bump, anything that changes the privacy story (`Privacy_Policy.md` says no data collection).
- **Scope & YAGNI** — smallest version? What's not needed?
- **Testing seams** — bloc test with a mock repo, or widget test through `createRootWidgetAndPump`? If neither works, the design is wrong.

## When you're done
Summarize the hardened design: decisions locked in, assumptions made explicit, risks accepted on purpose. Offer `/plan` (usual next step) or `/refine-approach` to write the sharpened version back into the brainstorm doc.

## What NOT to do
- More than one question at a time. This is the cardinal rule.
- Asking what you can look up.
- Starting implementation before the user confirms the design.
- Softening. Polite but relentless — a comfortable grilling didn't do its job.
