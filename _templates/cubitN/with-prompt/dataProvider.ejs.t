---
to: lib/cubits/<%= h.changeCase.snake(name) %>/data_provider.dart
---
part of 'cubit.dart';

class <%= h.changeCase.pascal(name) %>DataProvider {
<% args.forEach(function(arg){ %>
  static Future< <%= h.changeCase.pascal(arg.model) %>> <%= h.changeCase.camel(arg.module) %>([Map map]) async {
    try {
      final Map raw = map;
      return <%= h.changeCase.pascal(arg.model) %>.fromMap(raw);
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
<% }); %>

}
