---
to: lib/cubits/<%= h.changeCase.snake(name) %>/state.dart
---
<% pascal = h.changeCase.pascal(name) %>
part of 'cubit.dart';

@immutable
class <%= pascal %>State extends Equatable {
  final <%= h.changeCase.pascal(model) %>? data;
  final String? message;

  const <%= pascal %>State({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [data, message,];
}

@immutable
class <%= pascal %>Default extends <%= pascal %>State {}

@immutable
class <%= pascal %>FetchLoading extends <%= pascal %>State {
    const <%= pascal %>FetchLoading(): super();
}

@immutable
class <%= pascal %>FetchSuccess extends <%= pascal %>State {
    const <%= pascal %>FetchSuccess({<%= h.changeCase.pascal(model) %>? data}): super(data: data);
}

@immutable
class <%= pascal %>FetchFailed extends <%= pascal %>State {
    const <%= pascal %>FetchFailed({String? message}): super(message: message);
}