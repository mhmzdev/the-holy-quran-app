import 'package:al_quran_api/al_quran_api.dart';
import 'package:al_quran_repo/al_quran_repo.dart';

class BookmarksRepo implements IBookmarkRepo {
  BookmarksRepo({AlQuranDataProviderImpl? provider})
      : _provider = provider ?? AlQuranDataProviderImpl();

  final AlQuranDataProviderImpl _provider;

  @override
  Future<List<Chapter?>?> fetchBookmarks() async {
    try {
      return await _provider.fetchBookmarks();
    } catch (e) {
      throw Exception('Internal Bookmarks Repo Error');
    }
  }

  @override
  Future<List<Chapter?>?> addBookmark(Chapter chapter) async {
    try {
      return await _provider.addBookmark(chapter);
    } catch (e) {
      throw Exception('Internal Bookmarks Repo Error');
    }
  }

  @override
  Future<List<Chapter?>?> removeBookmark(Chapter chapter) async {
    try {
      return await _provider.removeBookmark(chapter);
    } catch (e) {
      throw Exception('Internal Bookmarks Repo Error');
    }
  }

  @override
  Future<bool> checkBookmarked(Chapter chapter) async {
    try {
      return await _provider.checkBookmarked(chapter);
    } catch (e) {
      throw Exception('Internal Bookmarks Repo Error');
    }
  }
}
