---
to: lib/blocs/<%= h.changeCase.snake(name) %>/data_provider.dart
---
<% pmodel = h.changeCase.pascal(model) %>
part of 'cubit.dart';

class _<%= h.changeCase.pascal(name) %>Provider {
  static Future< <%= pmodel %>> fetch() async {
    try {
      final resp = await AppApi.ins.get("/v1/<%= h.changeCase.snake(name) %>");
      final Map<String, dynamic> raw = resp.data;
      return <%= pmodel %>.fromJson(raw);
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}
