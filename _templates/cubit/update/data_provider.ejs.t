---
inject: true
after: _<%= h.changeCase.pascal(name) %>Provider
to: lib/blocs/<%= h.changeCase.snake(name) %>/data_provider.dart
---
<% args.forEach(function(arg){ %>
  static Future< <%= h.changeCase.pascal(arg.model) %>> <%= h.changeCase.camel(arg.module) %>() async {
    try {
      final raw = <String, dynamic>{};
      return <%= h.changeCase.pascal(arg.model) %>.fromJson(raw);
    } on FirebaseException catch (e, s) {
      throw FirebaseFault.fromFirebase(e, s);
    } catch (e, st) {
      throw UnknownFault('Something went wrong!', st);
    }
  }
<% }); %>