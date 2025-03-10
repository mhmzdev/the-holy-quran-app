import 'package:al_quran_api/src/models/base.dart';

abstract interface class IAlQuranDataProvider {
  /// Chapters API
  Future<List<Chapter>> getChapters();
  Future<List<Chapter>?> getChaptersHive();

  /// Juz API
  Future<Juz?> juzFetchHive(num juxIndex);
  Future<Juz?> juzFetchApi(num juxIndex);

  /// Bookmarks API
  Future<List<Chapter?>?> fetchBookmarks();
  Future<List<Chapter?>?> addBookmark(Chapter chapter);
  Future<List<Chapter?>?> removeBookmark(Chapter chapter);
  Future<bool?> checkBookmarked(Chapter chapter);
}
