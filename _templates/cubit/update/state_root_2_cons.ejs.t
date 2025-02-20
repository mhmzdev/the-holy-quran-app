---
inject: true
after: const <%= h.changeCase.pascal(name) %>State
to: lib/blocs/<%= h.changeCase.snake(name) %>/state.dart
---
<%_ args.forEach(function(arg){ _%>
required this.<%= h.changeCase.camel(arg.module); %>,
<%_ }); _%>