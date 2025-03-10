import 'package:al_quran/blocs/chapter/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helper/mocks.dart';

void main() {
  late ChapterBloc bloc;
  late MockChapterRepo mockRepo;

  setUp(() {
    mockRepo = MockChapterRepo();
    bloc = ChapterBloc(repo: mockRepo);
  });

  tearDown(() {
    bloc.close();
  });

  group('ChapterBloc Tests: ', () {
    test('initial state should be ChapterDefault', () {
      expect(bloc.state, const ChapterDefault());
    });

    group('ChapterFetch', () {
      test(
          'emits [ChapterFetchLoading, ChapterFetchSuccess] when fetching from API',
          () async {
        // No cached data
        when(() => mockRepo.getChaptersHive()).thenAnswer((_) async => null);
        when(() => mockRepo.getChapters())
            .thenAnswer((_) async => chapterMocks);

        final expected = [
          const ChapterFetchLoading(),
          ChapterFetchSuccess(data: chapterMocks),
        ];

        expectLater(bloc.stream, emitsInOrder(expected));
        bloc.add(const ChapterFetch(api: true));
      });

      test(
          'emits [ChapterFetchLoading, ChapterFetchSuccess] when using cached data',
          () async {
        // Has cached data
        when(() => mockRepo.getChaptersHive())
            .thenAnswer((_) async => chapterMocks);

        final expected = [
          const ChapterFetchLoading(),
          ChapterFetchSuccess(data: chapterMocks),
        ];

        expectLater(bloc.stream, emitsInOrder(expected));
        bloc.add(const ChapterFetch(api: false));
      });

      test(
          'emits [ChapterFetchLoading, ChapterFetchFailed] when API fetch fails',
          () async {
        when(() => mockRepo.getChaptersHive()).thenAnswer((_) async => null);
        when(() => mockRepo.getChapters()).thenThrow(Exception('API Error'));

        final expected = [
          const ChapterFetchLoading(),
          const ChapterFetchFailed(message: 'Exception: API Error'),
        ];

        expectLater(bloc.stream, emitsInOrder(expected));
        bloc.add(const ChapterFetch(api: true));
      });

      test(
          'emits [ChapterFetchLoading, ChapterFetchFailed] when Hive fetch fails',
          () async {
        when(() => mockRepo.getChaptersHive())
            .thenThrow(Exception('Hive Error'));

        final expected = [
          const ChapterFetchLoading(),
          const ChapterFetchFailed(message: 'Exception: Hive Error'),
        ];

        expectLater(bloc.stream, emitsInOrder(expected));
        bloc.add(const ChapterFetch(api: false));
      });

      test('falls back to API when Hive returns null', () async {
        when(() => mockRepo.getChaptersHive()).thenAnswer((_) async => null);
        when(() => mockRepo.getChapters())
            .thenAnswer((_) async => chapterMocks);

        final expected = [
          const ChapterFetchLoading(),
          ChapterFetchSuccess(data: chapterMocks),
        ];

        expectLater(bloc.stream, emitsInOrder(expected));
        bloc.add(const ChapterFetch(api: false));
      });
    });
  });
}
