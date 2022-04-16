part of 'cubit.dart';

@immutable
class ChapterState extends Equatable {
  final List<Chapter?>? data;
  final String? message;

  const ChapterState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [
        data,
        message,
      ];
}

@immutable
class ChapterDefault extends ChapterState {}

@immutable
class ChapterFetchLoading extends ChapterState {
  const ChapterFetchLoading() : super();
}

@immutable
class ChapterFetchSuccess extends ChapterState {
  const ChapterFetchSuccess({List<Chapter?>? data}) : super(data: data);
}

@immutable
class ChapterFetchFailed extends ChapterState {
  const ChapterFetchFailed({String? message}) : super(message: message);
}
