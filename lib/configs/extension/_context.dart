part of '../app.dart';

extension SuperContext on BuildContext {
  String? get currentPath => ModalRoute.of(this)!.settings.name;
  bool get canPop => Navigator.canPop(this);

  void dismissKeyboard() {
    if (FocusScope.of(this).hasFocus) {
      FocusScope.of(this).unfocus();
    }
  }

  double topSafe() {
    final view = MediaQueryData.fromView(View.of(this));
    final height = view.padding.top;
    return height;
  }

  double bottomSafe() {
    final view = MediaQueryData.fromView(View.of(this));
    final height = view.padding.bottom;
    return height;
  }

  EdgeInsets get modalBottomKeyboard => EdgeInsets.only(
        bottom: MediaQueryData.fromView(View.of(this)).viewInsets.bottom,
      );
}
