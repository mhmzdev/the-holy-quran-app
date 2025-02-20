---
inject: true
after: _<%= h.changeCase.pascal(name) %>Parser
to: lib/blocs/<%= h.changeCase.snake(name) %>/data_parser.dart
---
<% args.forEach(function(arg){ %>
  static Map <%= h.changeCase.camel(arg.module) %>(Map data) => data;
<% }); %>