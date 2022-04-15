part of 'cubit.dart';

class ChapterRepository {
  Future<Chapter> chapterApi(num id) => ChapterDataProvider.chapterApi(id);
}
