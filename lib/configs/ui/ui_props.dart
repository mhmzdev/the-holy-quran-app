import 'package:flutter/material.dart';

import '../space/app_dimensions.dart';
import '../theme/app_theme.dart';

abstract class UIProps {
  // Animations
  static Duration duration = const Duration(milliseconds: 280);
  static Duration duration2 = const Duration(milliseconds: 400);

  // Paddings
  static EdgeInsets? btnPadMed;
  static EdgeInsets? btnPadSm;

  // Radius
  static double radius = 6.0;
  static BorderRadius? tabRadius;
  static BorderRadius? buttonRadius;
  static BorderRadius? cardRadius;
  static BoxDecoration? borderButton;

  // Shadows
  static List<BoxShadow>? cardShadow;

  // BoxDecoration
  static BoxDecoration? boxCard;

  static void init() {
    initRadius();
    initButtons();
    initShadows();
    initBoxDecorations();
  }

  static void initRadius() {
    tabRadius = BorderRadius.circular(radius * 2);
    buttonRadius = BorderRadius.circular(radius);
    cardRadius = BorderRadius.circular(radius * 2);
  }

  static void initButtons() {
    borderButton = BoxDecoration(
      borderRadius: UIProps.buttonRadius,
      border: Border.all(width: 1.4, color: AppTheme.c!.primary!),
    );
    btnPadSm = EdgeInsets.symmetric(
      horizontal: AppDimensions.padding! * 2,
      vertical: AppDimensions.padding! * 1.0,
    );
    btnPadMed = EdgeInsets.symmetric(
      horizontal: AppDimensions.padding! * 3,
      vertical: AppDimensions.padding! * 1.5,
    );
  }

  static void initShadows() {
    cardShadow = [BoxShadow(color: AppTheme.c!.shadowSub!, blurRadius: 6)];
  }

  static void initBoxDecorations() {
    boxCard = BoxDecoration(
      borderRadius: cardRadius,
      boxShadow: cardShadow,
      color: AppTheme.c!.background!,
    );
  }
}
