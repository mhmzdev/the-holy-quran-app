part of 'cubit.dart';

@immutable
class BookmarkState extends Equatable {
  final List<Chapter?>? data;
  final bool? isBookmarked;
  final String? message;

  const BookmarkState({
    this.data,
    this.message,
    this.isBookmarked = false,
  });

  @override
  List<Object?> get props => [
        data,
        message,
        isBookmarked,
      ];
}

@immutable
class BookmarkDefault extends BookmarkState {}

@immutable
class BookmarkFetchLoading extends BookmarkState {
  const BookmarkFetchLoading() : super();
}

@immutable
class BookmarkFetchSuccess extends BookmarkState {
  const BookmarkFetchSuccess({super.data, super.isBookmarked = null});
}

@immutable
class BookmarkFetchFailed extends BookmarkState {
  const BookmarkFetchFailed({super.message});
}
