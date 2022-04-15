part of 'cubit.dart';

class ChapterRepository {
  Future<List<Chapter?>?> chapterApi() => ChapterDataProvider.chapterApi();

  Future<List<Chapter?>?> chapterHive() => ChapterDataProvider.chapterHive();
}
