---
paths:
  - "test/**/*.dart"
  - "packages/**/test/**/*.dart"
---

# Testing rules

Full reference: `docs/conventions/testing.md`.

- **Every bloc has `test/blocs/<name>_bloc_test.dart`** using `blocTest` (bloc_test) with a mocktail mock repo from `test/helper/mocks.dart`. Cover: initial state, success from cache, success from API, failure.
- **Every screen has `test/widget/screens/<screen>_test.dart`.** Pump through `tester.createRootWidgetAndPump(...)` / `runWidgetTestZoned` from `test/helper/tester_extensions.dart` so providers, blocs, theme and `App.init` are wired exactly like `lib/app.dart`.
- Hive in tests: `setUpTestHive()` / `tearDownTestHive()` from `test/helper/hive.dart` (temp dir, no real boxes). Open the boxes the code under test expects (`app`, `data`) inside `setUp`.
- Register a mocked repo/bloc instead of hitting `api.alquran.cloud` — tests must pass offline.
- No `skip:`, empty, or TODO tests. A stubbed test reads as coverage that isn't there.
- Gate: `fvm flutter test` and `fvm flutter analyze` both green before declaring done.
