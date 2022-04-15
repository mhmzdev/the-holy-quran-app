
part of 'cubit.dart';

@immutable
class QuranState extends Equatable {
  final Chapter? data;
  final String? message;

  const QuranState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [data, message,];
}

@immutable
class QuranDefault extends QuranState {}

@immutable
class QuranFetchLoading extends QuranState {
    const QuranFetchLoading(): super();
}

@immutable
class QuranFetchSuccess extends QuranState {
    const QuranFetchSuccess({Chapter? data}): super(data: data);
}

@immutable
class QuranFetchFailed extends QuranState {
    const QuranFetchFailed({String? message}): super(message: message);
}