part of 'bloc.dart';

sealed class BookmarksEvent {
  const BookmarksEvent();
}

class BookmarksFetch extends BookmarksEvent {
  const BookmarksFetch();
}

class UpdateBookmark extends BookmarksEvent {
  const UpdateBookmark(this.chapter, this.add);

  final Chapter chapter;
  final bool add;
}

class CheckBookmark extends BookmarksEvent {
  const CheckBookmark(this.chapter);

  final Chapter chapter;
}
