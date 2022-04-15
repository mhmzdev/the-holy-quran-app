part of 'cubit.dart';

@immutable
class ChapterDataState extends Equatable {
  final List<ChapterData?>? data;
  final String? message;

  const ChapterDataState({
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
class ChapterDataDefault extends ChapterDataState {}

@immutable
class ChapterDataFetchLoading extends ChapterDataState {
  const ChapterDataFetchLoading() : super();
}

@immutable
class ChapterDataFetchSuccess extends ChapterDataState {
  const ChapterDataFetchSuccess({List<ChapterData?>? data}) : super(data: data);
}

@immutable
class ChapterDataFetchFailed extends ChapterDataState {
  const ChapterDataFetchFailed({String? message}) : super(message: message);
}
