---
to: lib/blocs/<%= h.changeCase.snake(name) %>/data_parser.dart
---
part of 'cubit.dart';

class _<%= h.changeCase.pascal(name) %>Parser {
  static Map fetch(Map data) => data;
}
