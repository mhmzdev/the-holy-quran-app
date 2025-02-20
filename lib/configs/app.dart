import 'package:flutter/material.dart';

import 'ui.dart';
import 'space/space.dart';
import 'ui/ui_props.dart';
import 'theme/app_theme.dart';
import 'typography/app_typography.dart';
import 'space/app_dimensions.dart';

class App {
  static bool? isLtr;
  static bool showAds = false;

  static init(BuildContext context) {
    UI.init(context);
    AppDimensions.init();
    AppTheme.init(context);
    UIProps.init();
    Space.init();
    AppText.init();
    isLtr = Directionality.of(context) == TextDirection.ltr;
  }
}
