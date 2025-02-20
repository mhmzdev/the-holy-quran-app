---
to: lib/ui/screens/<%= h.changeCase.snake(screen) %>/widgets/_<%= h.changeCase.snake(name) %>.dart
---

part of '../<%= h.changeCase.snake(screen) %>.dart';

class _<%= h.changeCase.pascal(name) %> extends StatelessWidget {
  const _<%= h.changeCase.pascal(name) %>();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}