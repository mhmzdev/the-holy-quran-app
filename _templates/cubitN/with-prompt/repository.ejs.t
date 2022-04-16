---
to: lib/cubits/<%= h.changeCase.snake(name) %>/repository.dart
---
part of 'cubit.dart';

class <%= h.changeCase.pascal(name) %>Repository {
<% args.forEach(function(arg){ %>
  Future< <%= h.changeCase.pascal(arg.model) %>> <%= h.changeCase.camel(arg.module) %>([Map map]) => <%= h.changeCase.pascal(name) %>DataProvider.<%= h.changeCase.camel(arg.module) %>(map);
<% }); %>
}
