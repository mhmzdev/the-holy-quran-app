---
inject: true
after: root-def-constructor
to: lib/blocs/<%= h.changeCase.snake(name) %>/state.dart
---
<%_ args.forEach(function(arg){ _%>
<%= h.changeCase.camel(arg.module); %> = CubitState(),
<%_ }); _%>