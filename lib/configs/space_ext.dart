import 'package:flutter/material.dart';
import 'app_dimensions.dart';
import 'ui.dart';

extension SuperEdgeInsets on EdgeInsets {
  EdgeInsets sv() {
    return copyWith(
      top: top + UI.padding!.top,
      bottom: bottom + UI.padding!.bottom,
    );
  }

  EdgeInsets st() {
    return copyWith(top: top + UI.padding!.top);
  }

  EdgeInsets sb() {
    return copyWith(bottom: bottom + UI.padding!.bottom);
  }

  EdgeInsets b(double no) {
    return copyWith(bottom: AppDimensions.space(no));
  }

  EdgeInsets t(double no) {
    return copyWith(top: AppDimensions.space(no));
  }

  EdgeInsets l(double no) {
    return copyWith(left: AppDimensions.space(no));
  }

  EdgeInsets r(double no) {
    return copyWith(right: AppDimensions.space(no));
  }
}
