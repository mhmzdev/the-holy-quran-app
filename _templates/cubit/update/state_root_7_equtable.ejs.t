---
inject: true
after: root-state-props
to: lib/blocs/<%= h.changeCase.snake(name) %>/state.dart
---
<%_ args.forEach(function(arg){ _%>
<%= h.changeCase.camel(arg.module); %>,<%_ }); _%>