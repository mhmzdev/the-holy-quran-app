---
inject: true
after: return <%= h.changeCase.pascal(name) %>State
to: lib/blocs/<%= h.changeCase.snake(name) %>/state.dart
---
<%_ args.forEach(function(arg){ _%>
<% cModule = h.changeCase.camel(arg.module) %>
<%= cModule %>: <%= cModule %> ?? this.<%= cModule %>,
<%_ }); _%>