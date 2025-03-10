import 'package:al_quran/blocs/chapter/bloc.dart';
import 'package:bloc_test/bloc_test.dart';
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
    blocTest<ChapterBloc, ChapterState>(
      'initial state should be ChapterDefault',
      build: () => ChapterBloc(repo: mockRepo),
      verify: (bloc) {
        expect(bloc.state, const ChapterDefault());
      },
    );

    group('ChapterFetch', () {
      blocTest<ChapterBloc, ChapterState>(
        'emits [ChapterFetchLoading, ChapterFetchSuccess] when fetching from API',
        build: () {
          when(() => mockRepo.getChaptersHive()).thenAnswer((_) async => null);
          when(() => mockRepo.getChapters())
              .thenAnswer((_) async => chapterMocks);
          return ChapterBloc(repo: mockRepo);
        },
        act: (bloc) => bloc.add(const ChapterFetch(api: true)),
        expect: () => [
          const ChapterFetchLoading(),
          ChapterFetchSuccess(data: chapterMocks),
        ],
      );

      blocTest<ChapterBloc, ChapterState>(
        'emits [ChapterFetchLoading, ChapterFetchSuccess] when using cached data',
        build: () {
          when(() => mockRepo.getChaptersHive())
              .thenAnswer((_) async => chapterMocks);
          return ChapterBloc(repo: mockRepo);
        },
        act: (bloc) => bloc.add(const ChapterFetch(api: false)),
        expect: () => [
          const ChapterFetchLoading(),
          ChapterFetchSuccess(data: chapterMocks),
        ],
      );

      blocTest<ChapterBloc, ChapterState>(
        'emits [ChapterFetchLoading, ChapterFetchFailed] when API fetch fails',
        build: () {
          when(() => mockRepo.getChaptersHive()).thenAnswer((_) async => null);
          when(() => mockRepo.getChapters()).thenThrow(Exception('API Error'));
          return ChapterBloc(repo: mockRepo);
        },
        act: (bloc) => bloc.add(const ChapterFetch(api: true)),
        expect: () => [
          const ChapterFetchLoading(),
          const ChapterFetchFailed(message: 'Exception: API Error'),
        ],
      );

      blocTest<ChapterBloc, ChapterState>(
        'emits [ChapterFetchLoading, ChapterFetchFailed] when Hive fetch fails',
        build: () {
          when(() => mockRepo.getChaptersHive())
              .thenThrow(Exception('Hive Error'));
          return ChapterBloc(repo: mockRepo);
        },
        act: (bloc) => bloc.add(const ChapterFetch(api: false)),
        expect: () => [
          const ChapterFetchLoading(),
          const ChapterFetchFailed(message: 'Exception: Hive Error'),
        ],
      );

      blocTest<ChapterBloc, ChapterState>(
        'falls back to API when Hive returns null',
        build: () {
          when(() => mockRepo.getChaptersHive()).thenAnswer((_) async => null);
          when(() => mockRepo.getChapters())
              .thenAnswer((_) async => chapterMocks);
          return ChapterBloc(repo: mockRepo);
        },
        act: (bloc) => bloc.add(const ChapterFetch(api: false)),
        expect: () => [
          const ChapterFetchLoading(),
          ChapterFetchSuccess(data: chapterMocks),
        ],
      );
    });
  });
}
