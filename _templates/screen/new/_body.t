---
to: lib/ui/screens/<%= h.changeCase.snake(name) %>/widgets/_body.dart
---
part of '../<%= h.changeCase.snake(name) %>.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {

    return Screen(
      keyboardHandler: true,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [],
        ),
      ),
    );
  }
}
