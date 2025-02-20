---
inject: true
after: _<%= h.changeCase.pascal(name) %>Mocks
to: lib/blocs/<%= h.changeCase.snake(name) %>/data_mocks.dart
---
<% args.forEach(function(arg){ %>
  static Future<Map> <%= h.changeCase.camel(arg.module) %>() {
    return Future.value({'message': 'mock', 'data': ''});
  }
<% }); %>
