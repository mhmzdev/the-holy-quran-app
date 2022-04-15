import 'package:flutter/material.dart';
import 'ui.dart';
import 'app_dimensions.dart';

class Space {
  static Widget? x;
  static Widget? y;
  static Widget? x1;
  static Widget? y1;
  static Widget? x2;
  static Widget? y2;
  static Widget? xm;
  static Widget? ym;

  static EdgeInsets? z;
  static EdgeInsets? h;
  static EdgeInsets? v;
  static EdgeInsets? h1;
  static EdgeInsets? v1;
  static EdgeInsets? h2;
  static EdgeInsets? v2;

  static Widget? top;
  static Widget? bottom;

  static void init() {
    x = SizedBox(width: AppDimensions.space(0.5));
    y = SizedBox(height: AppDimensions.space(0.5));

    x1 = SizedBox(width: AppDimensions.space());
    y1 = SizedBox(height: AppDimensions.space());

    x2 = SizedBox(width: AppDimensions.space(2));
    y2 = SizedBox(height: AppDimensions.space(2));

    xm = const Expanded(child: SizedBox(width: double.infinity));
    ym = const Expanded(child: SizedBox(height: double.infinity));

    z = EdgeInsets.zero;
    h = EdgeInsets.symmetric(horizontal: AppDimensions.space(0.5));
    v = EdgeInsets.symmetric(vertical: AppDimensions.space(0.5));

    h1 = EdgeInsets.symmetric(horizontal: AppDimensions.space());
    v1 = EdgeInsets.symmetric(vertical: AppDimensions.space());

    h2 = EdgeInsets.symmetric(horizontal: AppDimensions.space(2));
    v2 = EdgeInsets.symmetric(vertical: AppDimensions.space(2));

    top = SizedBox(height: UI.padding!.top);
    bottom = SizedBox(height: UI.padding!.bottom);
  }

  static Widget xf([double no = 1]) => SizedBox(width: AppDimensions.space(no));
  static Widget yf([double no = 1]) =>
      SizedBox(height: AppDimensions.space(no));

  static EdgeInsets hf([double no = 1]) => EdgeInsets.symmetric(
        horizontal: AppDimensions.space(no),
      );
  static EdgeInsets vf([double no = 1]) => EdgeInsets.symmetric(
        vertical: AppDimensions.space(no),
      );

  static EdgeInsets all([double h = 0.5, double? v]) => EdgeInsets.symmetric(
        vertical: AppDimensions.space(v ?? h),
        horizontal: AppDimensions.space(h),
      );
}
