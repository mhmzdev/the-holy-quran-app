import 'package:al_quran/configs/app.dart';
import 'package:al_quran/providers/app_provider.dart';
import 'package:al_quran/ui/widgets/headless/focus_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.child,
    this.padding = EdgeInsets.zero,
    this.keyboardHandler = false,
    this.renderSettings = true,
    this.resizeToAvoidBottomInset = false,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.scaffoldBackgroundColor,
    this.belowBuilders,
    this.overlayBuilders,
    this.onBackPressed,
    this.canPop,
    this.appBar,
    this.endDrawer,
    this.drawer,
  });

  final Widget child;
  final EdgeInsets padding;
  final bool keyboardHandler;
  final bool renderSettings;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? scaffoldBackgroundColor;
  final List<Widget>? belowBuilders;
  final List<Widget>? overlayBuilders;
  final bool resizeToAvoidBottomInset;
  final void Function()? onBackPressed;
  final bool? canPop;
  final PreferredSizeWidget? appBar;
  final Widget? endDrawer;
  final Widget? drawer;

  @override
  Widget build(BuildContext context) {
    App.init(context);

    var body = child;
    final onWillPop = onBackPressed;
    final canPopValue = canPop ?? true;

    if (keyboardHandler) {
      body = FocusHandler(child: body);
    }

    if (onWillPop != null || !canPopValue) {
      body = PopScope(
        canPop: canPopValue,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop && onWillPop != null) {
            onWillPop();
          }
        },
        child: body,
      );
    }

    body = Padding(padding: padding, child: body);

    final appProvider = Provider.of<AppProvider>(context, listen: true);
    final isDark = appProvider.isDark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarBrightness:
            isDark ? Brightness.dark : Brightness.light, // for IOS
        statusBarIconBrightness:
            isDark ? Brightness.light : Brightness.dark, // for Android
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: scaffoldBackgroundColor,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        endDrawer: endDrawer,
        drawer: drawer,
        appBar: appBar,
        body: Stack(
          fit: StackFit.expand,
          children: [
            if (belowBuilders != null) ...belowBuilders!,
            Positioned.fill(
              child: body,
            ),
            if (overlayBuilders != null) ...overlayBuilders!,
          ],
        ),
      ),
    );
  }
}
