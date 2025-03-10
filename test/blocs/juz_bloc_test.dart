import 'package:al_quran/blocs/juz/bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helper/mocks.dart';

void main() {
  late JuzBloc bloc;
  late MockJuzRepo mockRepo;
  late MockJuz mockJuz;

  setUp(() {
    mockRepo = MockJuzRepo();
    mockJuz = MockJuz();
    bloc = JuzBloc(repo: mockRepo);
  });

  tearDown(() {
    bloc.close();
  });
  group('JuzBloc Tests: ', () {
    blocTest<JuzBloc, JuzState>(
      'initial state should be JuzDefault',
      build: () => JuzBloc(repo: mockRepo),
      verify: (bloc) {
        expect(bloc.state, const JuzDefault());
      },
    );

    group('JuzFetch', () {
      blocTest<JuzBloc, JuzState>(
        'emits [JuzFetchLoading, JuzFetchSuccess] when successful',
        build: () {
          when(() => mockRepo.juzFetchHive(1)).thenAnswer((_) async => null);
          when(() => mockRepo.juzFetchApi(1)).thenAnswer((_) async => mockJuz);
          return JuzBloc(repo: mockRepo);
        },
        act: (bloc) => bloc.add(const JuzFetch(juzIndex: 1)),
        expect: () => [
          const JuzFetchLoading(),
          JuzFetchSuccess(data: mockJuz),
        ],
      );

      blocTest<JuzBloc, JuzState>(
        'emits [JuzFetchLoading, JuzFetchSuccess] when using cached data',
        build: () {
          when(() => mockRepo.juzFetchHive(1)).thenAnswer((_) async => mockJuz);
          return JuzBloc(repo: mockRepo);
        },
        act: (bloc) => bloc.add(const JuzFetch(juzIndex: 1)),
        expect: () => [
          const JuzFetchLoading(),
          JuzFetchSuccess(data: mockJuz),
        ],
      );

      blocTest<JuzBloc, JuzState>(
        'emits [JuzFetchLoading, JuzFetchFailed] when API fetch fails',
        build: () {
          when(() => mockRepo.juzFetchHive(1)).thenAnswer((_) async => null);
          when(() => mockRepo.juzFetchApi(1)).thenThrow(Exception('API Error'));
          return JuzBloc(repo: mockRepo);
        },
        act: (bloc) => bloc.add(const JuzFetch(juzIndex: 1)),
        expect: () => [
          const JuzFetchLoading(),
          const JuzFetchFailed(message: 'Exception: API Error'),
        ],
      );

      blocTest<JuzBloc, JuzState>(
        'emits [JuzFetchLoading, JuzFetchFailed] when Hive fetch fails',
        build: () {
          when(() => mockRepo.juzFetchHive(1))
              .thenThrow(Exception('Hive Error'));
          return JuzBloc(repo: mockRepo);
        },
        act: (bloc) => bloc.add(const JuzFetch(juzIndex: 1)),
        expect: () => [
          const JuzFetchLoading(),
          const JuzFetchFailed(message: 'Exception: Hive Error'),
        ],
      );

      blocTest<JuzBloc, JuzState>(
        'falls back to API when Hive returns null',
        build: () {
          when(() => mockRepo.juzFetchHive(1)).thenAnswer((_) async => null);
          when(() => mockRepo.juzFetchApi(1)).thenAnswer((_) async => mockJuz);
          return JuzBloc(repo: mockRepo);
        },
        act: (bloc) => bloc.add(const JuzFetch(juzIndex: 1)),
        expect: () => [
          const JuzFetchLoading(),
          JuzFetchSuccess(data: mockJuz),
        ],
      );
    });
  });
}
