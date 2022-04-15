import 'package:al_quran/configs/configs.dart';
import 'package:flutter/material.dart';

class AppText {
  static TextStyle? btn;

  // Headings
  static TextStyle? h1;
  static TextStyle? h1b;
  static TextStyle? h2;
  static TextStyle? h2b;
  static TextStyle? h3;
  static TextStyle? h3b;

  // Body
  static TextStyle? b1;
  static TextStyle? b1b;
  static TextStyle? b2;
  static TextStyle? b2b;

  // Label
  static TextStyle? l1;
  static TextStyle? l1b;
  static TextStyle? l2;
  static TextStyle? l2b;

  static init() {
    const b = FontWeight.w600;
    const baseStyle = TextStyle(fontFamily: fontFamily);

    h1 = baseStyle.copyWith(
      fontSize: AppDimensions.font(20),
      color: AppTheme.c!.text,
    );
    h1b = h1!.copyWith(
      fontWeight: b,
      color: AppTheme.c!.text,
    );

    h2 = baseStyle.copyWith(
      fontSize: AppDimensions.font(14),
      color: AppTheme.c!.text,
    );
    h2b = h2!.copyWith(
      fontWeight: b,
      color: AppTheme.c!.text,
    );

    h3 = baseStyle.copyWith(
      fontSize: AppDimensions.font(8),
      color: AppTheme.c!.text,
    );
    h3b = h3!.copyWith(
      fontWeight: b,
      color: AppTheme.c!.text,
    );

    b1 = baseStyle.copyWith(
      fontSize: AppDimensions.font(8),
      color: AppTheme.c!.text,
    );
    b1b = b1!.copyWith(
      fontWeight: b,
      color: AppTheme.c!.text,
    );

    b2 = baseStyle.copyWith(
      fontSize: AppDimensions.font(6.25),
      color: AppTheme.c!.text,
    );
    b2b = b2!.copyWith(
      fontWeight: b,
      color: AppTheme.c!.text,
    );

    l1 = baseStyle.copyWith(
      fontSize: AppDimensions.font(5),
      color: AppTheme.c!.text,
    );
    l1b = l1!.copyWith(
      fontWeight: b,
      color: AppTheme.c!.text,
    );

    l2 = baseStyle.copyWith(
      fontSize: AppDimensions.font(4),
      color: AppTheme.c!.text,
    );
    l2b = l2!.copyWith(
      fontWeight: b,
      color: AppTheme.c!.text,
    );
  }
}
