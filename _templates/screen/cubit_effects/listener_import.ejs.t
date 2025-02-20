---
inject: true
before: part '_state.dart';
to: lib/ui/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart
skip_if: part '_listener.dart';
---
part '_listener.dart';