import 'package:al_quran/blocs/bookmarks/bloc.dart';
import 'package:al_quran_api/al_quran_api.dart';
import 'package:bloc_test/bloc_test.dart';
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
      blocTest(
        'emits [BookmarkFetchLoading, BookmarkFetchSuccess] when successful',
        build: () {
          when(() => mockRepo.fetchBookmarks())
              .thenAnswer((_) async => <Chapter?>[mockChapter]);
          return BookmarksBloc(repo: mockRepo);
        },
        act: (bloc) => bloc.add(const BookmarksFetch()),
        expect: () => [
          const BookmarkFetchLoading(),
          BookmarkFetchSuccess(data: <Chapter?>[mockChapter]),
        ],
      );

      blocTest(
        'emits [BookmarkFetchLoading, BookmarkFetchFailed] when error occurs',
        build: () {
          when(() => mockRepo.fetchBookmarks())
              .thenThrow('Error fetching bookmarks');
          return BookmarksBloc(repo: mockRepo);
        },
        act: (bloc) => bloc.add(const BookmarksFetch()),
        expect: () => [
          const BookmarkFetchLoading(),
          const BookmarkFetchFailed(message: 'Error fetching bookmarks'),
        ],
      );
    });

    group('UpdateBookmark', () {
      blocTest(
        'emits [BookmarkFetchLoading, BookmarkFetchSuccess] when adding bookmark',
        build: () {
          final mockData = <Chapter?>[mockChapter];
          when(() => mockRepo.addBookmark(mockChapter))
              .thenAnswer((_) async => mockData);
          return BookmarksBloc(repo: mockRepo);
        },
        act: (bloc) => bloc.add(UpdateBookmark(mockChapter, true)),
        expect: () => [
          const BookmarkFetchLoading(),
          BookmarkFetchSuccess(
            data: <Chapter?>[mockChapter],
            isBookmarked: true,
          ),
        ],
      );

      blocTest(
        'emits [BookmarkFetchLoading, BookmarkFetchSuccess] when removing bookmark',
        build: () {
          final mockData = <Chapter?>[];
          when(() => mockRepo.removeBookmark(mockChapter))
              .thenAnswer((_) async => mockData);
          return BookmarksBloc(repo: mockRepo);
        },
        act: (bloc) => bloc.add(UpdateBookmark(mockChapter, false)),
        expect: () => [
          const BookmarkFetchLoading(),
          BookmarkFetchSuccess(data: <Chapter?>[], isBookmarked: false),
        ],
      );

      blocTest(
        'emits [BookmarkFetchLoading, BookmarkFetchFailed] when error occurs',
        build: () {
          when(() => mockRepo.addBookmark(mockChapter))
              .thenThrow('Error updating bookmark');
          return BookmarksBloc(repo: mockRepo);
        },
        act: (bloc) => bloc.add(UpdateBookmark(mockChapter, true)),
        expect: () => [
          const BookmarkFetchLoading(),
          const BookmarkFetchFailed(message: 'Error updating bookmark'),
        ],
      );
    });

    group('CheckBookmark', () {
      blocTest(
        'emits [BookmarkFetchLoading, BookmarkFetchSuccess] when successful',
        build: () {
          when(() => mockRepo.checkBookmarked(mockChapter))
              .thenAnswer((_) async => true);
          when(() => mockRepo.fetchBookmarks())
              .thenAnswer((_) async => <Chapter?>[mockChapter]);
          return BookmarksBloc(repo: mockRepo);
        },
        act: (bloc) => bloc.add(CheckBookmark(mockChapter)),
        expect: () => [
          const BookmarkFetchLoading(),
          BookmarkFetchSuccess(
            data: <Chapter?>[mockChapter],
            isBookmarked: true,
          ),
        ],
      );

      blocTest(
        'emits [BookmarkFetchLoading, BookmarkFetchFailed] when error occurs',
        build: () {
          when(() => mockRepo.checkBookmarked(mockChapter))
              .thenThrow('Error checking bookmark');
          return BookmarksBloc(repo: mockRepo);
        },
        act: (bloc) => bloc.add(CheckBookmark(mockChapter)),
        expect: () => [
          const BookmarkFetchLoading(),
          const BookmarkFetchFailed(message: 'Error checking bookmark'),
        ],
      );
    });
  });
}
