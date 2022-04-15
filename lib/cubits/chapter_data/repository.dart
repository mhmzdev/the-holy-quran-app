part of 'cubit.dart';

class ChapterDataRepository {
  Future<List<ChapterData?>?>? chapterDataListApi() =>
      ChapterDataDataProvider.chapterDataListApi();

  Future<List<ChapterData?>?>? chapterDataListHive() =>
      ChapterDataDataProvider.chapterDataListHive();
}
