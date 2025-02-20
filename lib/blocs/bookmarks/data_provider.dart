part of 'cubit.dart';

class BookmarksDataProvider {
  static final cache = Hive.box('data');

  static Future<List<Chapter?>?> fetch() async {
    try {
      List? bookmarks = await cache.get('bookmarks');
      if (bookmarks == null) {
        bookmarks = <Chapter?>[];
        await cache.put('bookmarks', bookmarks);
      }

      final List<Chapter?> cachedBookmarks = List.from(bookmarks);
      return cachedBookmarks;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

  static Future<List<Chapter?>?> addBookmark(Chapter? chapter) async {
    try {
      List? bookmarks = await cache.get('bookmarks');
      if (bookmarks == null) {
        bookmarks = <Chapter?>[];
        await cache.put('bookmarks', bookmarks);
      }

      final List<Chapter?> updatedBookmarks = List.from(bookmarks);
      updatedBookmarks.add(chapter);

      await cache.put('bookmarks', updatedBookmarks);
      return updatedBookmarks;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

  static Future<List<Chapter?>?> removeBookmark(Chapter? chapter) async {
    try {
      List bookmarks = await cache.get('bookmarks');

      final List<Chapter?> updatedBookmarks = List.from(bookmarks);
      updatedBookmarks.remove(chapter);

      await cache.put('bookmarks', updatedBookmarks);
      return updatedBookmarks;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

  static Future<bool?> checkBookmarked(Chapter? chapter) async {
    try {
      List bookmarks = await cache.get('bookmarks');

      final List<Chapter?> updatedBookmarks = List.from(bookmarks);
      return updatedBookmarks.contains(chapter);
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}
