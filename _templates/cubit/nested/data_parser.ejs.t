---
to: lib/blocs/<%= h.changeCase.snake(name) %>/data_parser.dart
---
// ignore_for_file: unused_element

part of 'cubit.dart';

class _<%= h.changeCase.pascal(name) %>Parser {
<% args.forEach(function(arg){ %>
  static Map <%= h.changeCase.camel(arg.module) %>(Map data) => data;
<% }); %>
}

