import 'dart:math';
import 'package:flutter/widgets.dart';

class UI {
  static double? width;
  static double? height;
  static EdgeInsets? vi;
  static double? vertical;
  static double? horizontal;
  static EdgeInsets? padding;
  static MediaQueryData? _mediaQueryData;

  static double? safeWidth;
  static double? safeHeight;
  static double? _safeAreaVertical;
  static double? _safeAreaHorizontal;

  static double? diagonal;

  static bool? xxs;
  static bool? xs;
  static bool? sm;
  static bool? md;
  static bool? xmd;
  static bool? lg;
  static bool? xl;
  static bool? xlg;
  static bool? xxlg;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    initChecks(_mediaQueryData!);

    padding = _mediaQueryData!.padding;
    vi = _mediaQueryData!.viewInsets;
    width = _mediaQueryData!.size.width;
    height = _mediaQueryData!.size.height;
    horizontal = width! / 100;
    vertical = height! / 100;

    _safeAreaHorizontal =
        _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
    _safeAreaVertical =
        _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
    safeWidth = (width! - _safeAreaHorizontal!);
    safeHeight = (height! - _safeAreaVertical!);
  }

  static initChecks(MediaQueryData query) {
    var size = query.size;
    diagonal = sqrt((size.width * size.width) + (size.height * size.height));
    xxs = size.width > 300;
    xs = size.width > 360;
    sm = size.width > 480;
    md = size.width > 600;
    xmd = size.width > 720;
    lg = size.width > 980;
    xl = size.width > 1160;
    xlg = size.width > 1400;
    xxlg = size.width > 1700;
  }

  static MediaQueryData mediaQuery() => _mediaQueryData!;

  static Size getSize() => _mediaQueryData!.size;
}
