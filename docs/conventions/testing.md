---
type: Convention
title: Testing conventions
description: How blocs and screens are tested — helpers, patterns, coverage expectations, CI.
tags: [conventions, testing, bloc_test, mocktail]
timestamp: 2026-09-10T08:30:00Z
---

# Testing conventions

Run: `fvm flutter test` (root). Package tests are placeholders (`packages/*/test`) — the data provider is exercised through bloc/widget tests.

## Layout
```
test/blocs/<name>_bloc_test.dart        blocTest per event: initial state, cache hit, API path, failure
test/widget/screens/<screen>_test.dart  pumps the real screen through the real provider/bloc tree
test/helper/mocks.dart                  chapterMocks (114 chapters × 10 ayahs), Mock*Repo, MockChapter/MockJuz
test/helper/tester_extensions.dart      createRootWidgetAndPump(...), initialise(), runWidgetTestZoned(...)
test/helper/hive.dart                   setUpTestHive() / tearDownTestHive() (temp dir, no real boxes)
```

## Bloc tests
```dart
blocTest<ChapterBloc, ChapterState>(
  'emits [Loading, Success] when using cached data',
  build: () { when(() => mockRepo.getChaptersHive()).thenAnswer((_) async => chapterMocks); return ChapterBloc(repo: mockRepo); },
  act: (bloc) => bloc.add(const ChapterFetch()),
  expect: () => [const ChapterFetchLoading(), ChapterFetchSuccess(data: chapterMocks)],
);
```
Cover: initial state · success from Hive · success from API (Hive returns `null`) · failure (repo throws) → `Failed(message)`.

## Widget tests
```dart
setUp(() async { await setUpTestHive(); await Future.wait([Hive.openBox('app'), Hive.openBox('data')]); initServiceLocator(); });
tearDown(() async { await tearDownTestHive(); });
testWidgets('Home screen', (tester) async => tester.runWidgetTestZoned((t) async {
  await t.createRootWidgetAndPump(body: const HomeScreen());   // or initialRoute: AppRoutes.home
  await t.pumpAndSettle();
  expect(find.text('Surah Index'), findsNWidgets(2));
}));
```
`createRootWidgetAndPump` accepts overrides for each bloc/provider so a mocked bloc can drive the UI. Default viewport is iPhone 16 Pro (`defaultPhoneSize`, DPR 3). `get_it` singletons persist across tests in one file — reset or re-register consciously.

## Expectations
- New bloc → bloc test. New/changed screen → widget test. Bug fix → a test that fails before the fix.
- Tests run offline; never call `api.alquran.cloud`.
- No `skip:`, empty or TODO tests.

## CI
`.github/workflows/run_test.yml` runs on PRs to `master`: `flutter pub get`, `dart analyze --no-fatal-warnings`, `flutter test` on the Flutter version pinned in the workflow (keep equal to `.fvmrc`).
