import 'package:al_quran/blocs/juz/bloc.dart';
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
    test('initial state should be JuzDefault', () {
      expect(bloc.state, const JuzDefault());
    });

    group('JuzFetch', () {
      test('emits [JuzFetchLoading, JuzFetchSuccess] when successful',
          () async {
        // No cached data
        when(() => mockRepo.juzFetchHive(1)).thenAnswer((_) async => null);
        when(() => mockRepo.juzFetchApi(1)).thenAnswer((_) async => mockJuz);

        final expected = [
          const JuzFetchLoading(),
          JuzFetchSuccess(data: mockJuz),
        ];

        expectLater(bloc.stream, emitsInOrder(expected));
        bloc.add(const JuzFetch(juzIndex: 1));
      });

      test('emits [JuzFetchLoading, JuzFetchSuccess] when using cached data',
          () async {
        // Has cached data
        when(() => mockRepo.juzFetchHive(1)).thenAnswer((_) async => mockJuz);

        final expected = [
          const JuzFetchLoading(),
          JuzFetchSuccess(data: mockJuz),
        ];

        expectLater(bloc.stream, emitsInOrder(expected));
        bloc.add(const JuzFetch(juzIndex: 1));
      });

      test('emits [JuzFetchLoading, JuzFetchFailed] when API fetch fails',
          () async {
        when(() => mockRepo.juzFetchHive(1)).thenAnswer((_) async => null);
        when(() => mockRepo.juzFetchApi(1)).thenThrow(Exception('API Error'));

        final expected = [
          const JuzFetchLoading(),
          const JuzFetchFailed(message: 'Exception: API Error'),
        ];

        expectLater(bloc.stream, emitsInOrder(expected));
        bloc.add(const JuzFetch(juzIndex: 1));
      });

      test('emits [JuzFetchLoading, JuzFetchFailed] when Hive fetch fails',
          () async {
        when(() => mockRepo.juzFetchHive(1)).thenThrow(Exception('Hive Error'));

        final expected = [
          const JuzFetchLoading(),
          const JuzFetchFailed(message: 'Exception: Hive Error'),
        ];

        expectLater(bloc.stream, emitsInOrder(expected));
        bloc.add(const JuzFetch(juzIndex: 1));
      });

      test('falls back to API when Hive returns null', () async {
        when(() => mockRepo.juzFetchHive(1)).thenAnswer((_) async => null);
        when(() => mockRepo.juzFetchApi(1)).thenAnswer((_) async => mockJuz);

        final expected = [
          const JuzFetchLoading(),
          JuzFetchSuccess(data: mockJuz),
        ];

        expectLater(bloc.stream, emitsInOrder(expected));
        bloc.add(const JuzFetch(juzIndex: 1));
      });
    });
  });
}
