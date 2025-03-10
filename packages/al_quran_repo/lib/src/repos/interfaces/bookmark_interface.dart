import 'package:al_quran_api/al_quran_api.dart';

abstract interface class IBookmarkRepo {
  Future<List<Chapter?>?> fetchBookmarks();
  Future<List<Chapter?>?> addBookmark(Chapter chapter);
  Future<List<Chapter?>?> removeBookmark(Chapter chapter);
  Future<bool?> checkBookmarked(Chapter chapter);
}
