import 'package:al_quran/blocs/bookmarks/bloc.dart';
import 'package:al_quran_api/al_quran_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helper/mocks.dart';

void main() {
  late BookmarksBloc bloc;
  late MockBookmarksRepo mockRepo;
  late MockChapter mockChapter;

  setUp(() {
    mockRepo = MockBookmarksRepo();
    mockChapter = MockChapter();
    bloc = BookmarksBloc(repo: mockRepo);
  });

  tearDown(() {
    bloc.close();
  });

  group('BookmarksBloc Tests: ', () {
    test('initial state should be BookmarkDefault', () {
      expect(bloc.state, const BookmarkDefault());
    });

    group('BookmarksFetch', () {
      test('emits [BookmarkFetchLoading, BookmarkFetchSuccess] when successful',
          () async {
        final mockData = <Chapter?>[mockChapter];
        when(() => mockRepo.fetchBookmarks()).thenAnswer((_) async => mockData);

        final expected = [
          const BookmarkFetchLoading(),
          BookmarkFetchSuccess(data: mockData),
        ];

        expectLater(bloc.stream, emitsInOrder(expected));
        bloc.add(const BookmarksFetch());
      });

      test(
          'emits [BookmarkFetchLoading, BookmarkFetchFailed] when error occurs',
          () async {
        when(() => mockRepo.fetchBookmarks())
            .thenThrow('Error fetching bookmarks');

        final expected = [
          const BookmarkFetchLoading(),
          const BookmarkFetchFailed(message: 'Error fetching bookmarks'),
        ];

        expectLater(bloc.stream, emitsInOrder(expected));
        bloc.add(const BookmarksFetch());
      });
    });

    group('UpdateBookmark', () {
      test(
          'emits [BookmarkFetchLoading, BookmarkFetchSuccess] when adding bookmark',
          () async {
        final mockData = <Chapter?>[mockChapter];
        when(() => mockRepo.addBookmark(mockChapter))
            .thenAnswer((_) async => mockData);

        final expected = [
          const BookmarkFetchLoading(),
          BookmarkFetchSuccess(data: mockData, isBookmarked: true),
        ];

        expectLater(bloc.stream, emitsInOrder(expected));
        bloc.add(UpdateBookmark(mockChapter, true));
      });

      test(
          'emits [BookmarkFetchLoading, BookmarkFetchSuccess] when removing bookmark',
          () async {
        final mockData = <Chapter?>[];
        when(() => mockRepo.removeBookmark(mockChapter))
            .thenAnswer((_) async => mockData);

        final expected = [
          const BookmarkFetchLoading(),
          BookmarkFetchSuccess(data: mockData, isBookmarked: false),
        ];

        expectLater(bloc.stream, emitsInOrder(expected));
        bloc.add(UpdateBookmark(mockChapter, false));
      });

      test(
          'emits [BookmarkFetchLoading, BookmarkFetchFailed] when error occurs',
          () async {
        when(() => mockRepo.addBookmark(mockChapter))
            .thenThrow('Error updating bookmark');

        final expected = [
          const BookmarkFetchLoading(),
          const BookmarkFetchFailed(message: 'Error updating bookmark'),
        ];

        expectLater(bloc.stream, emitsInOrder(expected));
        bloc.add(UpdateBookmark(mockChapter, true));
      });
    });

    group('CheckBookmark', () {
      test('emits [BookmarkFetchLoading, BookmarkFetchSuccess] when successful',
          () async {
        final mockData = <Chapter?>[mockChapter];
        when(() => mockRepo.checkBookmarked(mockChapter))
            .thenAnswer((_) async => true);
        when(() => mockRepo.fetchBookmarks()).thenAnswer((_) async => mockData);

        final expected = [
          const BookmarkFetchLoading(),
          BookmarkFetchSuccess(data: mockData, isBookmarked: true),
        ];

        expectLater(bloc.stream, emitsInOrder(expected));
        bloc.add(CheckBookmark(mockChapter));
      });

      test(
          'emits [BookmarkFetchLoading, BookmarkFetchFailed] when error occurs',
          () async {
        when(() => mockRepo.checkBookmarked(mockChapter))
            .thenThrow('Error checking bookmark');

        final expected = [
          const BookmarkFetchLoading(),
          const BookmarkFetchFailed(message: 'Error checking bookmark'),
        ];

        expectLater(bloc.stream, emitsInOrder(expected));
        bloc.add(CheckBookmark(mockChapter));
      });
    });
  });
}
