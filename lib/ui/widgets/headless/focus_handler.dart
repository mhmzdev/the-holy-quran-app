import 'package:flutter/material.dart';

class FocusHandler extends StatelessWidget {
  static void tap(BuildContext context, [VoidCallback? call]) {
    final currentScope = FocusScope.of(context);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
    if (call != null) {
      call();
    }
  }

  const FocusHandler({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => tap(context),
      child: child,
    );
  }
}
