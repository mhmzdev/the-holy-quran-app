---
inject: true
after: class <%= h.changeCase.pascal(name) %>State extends Equatable
to: lib/blocs/<%= h.changeCase.snake(name) %>/state.dart
---
<%_ args.forEach(function(arg){ _%>
final CubitState< <%- h.changeCase.pascal(arg.model) %>> <%- h.changeCase.camel(arg.module) %>;<%_ }); _%>