---
type: Tooling
title: Hygen scaffolding
description: The _templates/ generators inherited from a shared boilerplate — what works here and what is stale.
tags: [tooling, hygen, templates]
timestamp: 2026-09-10T08:30:00Z
resource: https://www.hygen.io
---

# Hygen scaffolding (`_templates/`)

Requires `npm i -g hygen`. Helpers in `.hygen.js`.

| Command | Generates | Fit for this app |
|---|---|---|
| `hygen screen new <name>` (prompts for widget names) | `lib/ui/screens/<name>/<name>.dart` + `_state.dart` (Provider-based screen state) + `widgets/_body.dart` + widgets + a widget test, and injects the route into `router.dart`/`routes.dart`; runs `dart format` | **Usable**, but the generated `_ScreenState` ChangeNotifier pattern is not used by existing screens — keep it only if the screen needs local state, otherwise delete `_state.dart`. |
| `hygen screen _widget <name> --screen=<screen>` | one private widget part file | Usable |
| `hygen screen cubit_effects` | listeners importing `services/faults.dart`, flash, loader | **Stale** — those files don't exist here |
| `hygen provider new <name>` | `lib/providers/<name>.dart` + injection into `app.dart` markers | Usable |
| `hygen cubit simple|nested|update <name>` | `lib/blocs/<name>/cubit.dart` + data provider/mocks/parser importing Firebase and `faults.dart` | **Stale** — this app uses Blocs (event/state part files) and has no Firebase. Copy `lib/blocs/chapter/` by hand instead. |

The `// bloc-imports-start`, `// bloc-initiate-start`, `// provider-imports-start`, `// provider-initiate-start` markers in `lib/app.dart` and `// ui-imports-start` in `router.dart` exist for these injectors — keep them.

Rewriting the cubit templates into bloc templates is a backlog candidate ([exec-plans](../exec-plans/index.md)).
