---
paths:
  - "lib/blocs/**/*.dart"
  - "lib/providers/**/*.dart"
  - "lib/services/**/*.dart"
  - "lib/app.dart"
---

# State management rules

Full reference: `docs/architecture/state-management.md`.

## Two tiers — never mix
- **Business/data state → Bloc** in `lib/blocs/{name}/`: `bloc.dart` (owner, `part 'event.dart'; part 'state.dart';`), `event.dart` (`sealed class XEvent`, one `const` subclass per event), `state.dart` (`class XState extends Equatable` base with nullable `data`/`message`, plus `XDefault`, `XFetchLoading`, `XFetchSuccess`, `XFetchFailed` subclasses). Match `lib/blocs/chapter/` exactly when adding a bloc.
- **UI/app state → Provider** (`ChangeNotifier`) in `lib/providers/`. `AppProvider` may read/write the Hive `app` box (theme, first-open) — nothing else in a Provider touches storage or network.
- Widgets are pure view: read state, dispatch events. No repo/data-provider calls from `build()` or `initState()` — dispatch an event instead.

## Wiring
- Blocs take their repo by constructor (`XBloc({required this._repo})`) and are registered as singletons in `lib/services/locator.dart` (order: data provider → repos → blocs). Then add a `BlocProvider(create: (_) => sl<XBloc>())` inside the `// bloc-initiate-start/end` markers in `lib/app.dart` and its import inside `// bloc-imports-start/end`.
- Handlers are `void _onX(XEvent event, Emitter<XState> emit) async`: emit loading, `try` the repo call, emit success with data, `catch (e)` → emit failed with `e.toString()`. Always `await` repo calls.
- Every state class lists **every** field in `props`. A missing field silently breaks rebuilds.
- Cache-first pattern: try the Hive read (`getChaptersHive` / `juzFetchHive`) and fall back to the API only when it returns `null` (see `ChapterBloc`, `JuzBloc`).
