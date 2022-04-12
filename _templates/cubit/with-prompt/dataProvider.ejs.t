---
to: lib/cubits/<%= h.changeCase.snake(name) %>/data_provider.dart
---
<% pmodel = h.changeCase.pascal(model) %>
part of 'cubit.dart';

class <%= h.changeCase.pascal(name) %>DataProvider {
  static Future< <%= pmodel %>> fetch() async {
    try {
      final Map raw = {"key": "value"};
      return <%= pmodel %>.fromMap(raw);
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}
