---
inject: true
after: <%= h.changeCase.pascal(name) %>State copyWith
to: lib/blocs/<%= h.changeCase.snake(name) %>/state.dart
---
<%_ args.forEach(function(arg){ _%>
CubitState< <%= h.changeCase.pascal(arg.model) %>>? <%= h.changeCase.camel(arg.module) %>,
<%_ }); _%>