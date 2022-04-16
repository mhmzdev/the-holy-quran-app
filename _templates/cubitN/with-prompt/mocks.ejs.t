---
to: lib/cubits/<%= h.changeCase.snake(name) %>/mocks.dart
---
part of 'cubit.dart';

class <%= h.changeCase.pascal(name) %>ApiMocks {
<% args.forEach(function(arg){ %>
  Future<Map<String, dynamic>> <%= h.changeCase.camel(arg.module) %>() async {
  // Future< <%= h.changeCase.pascal(arg.model) %>> <%= h.changeCase.camel(arg.module) %>() async {
    Map<String, dynamic> map = {};
    // <% model = h.changeCase.pascal(arg.model) %>.fromMap(map);
    // await 3.seconds.delay;
    return map;
  }
<% }); %>
}
