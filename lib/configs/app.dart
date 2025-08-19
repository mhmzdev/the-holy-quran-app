import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supercharged/supercharged.dart';

import 'ui.dart';
import 'space/space.dart';
import 'ui/ui_props.dart';
import 'theme/app_theme.dart';
import 'typography/app_typography.dart';
import 'space/app_dimensions.dart';

part 'extension/_context.dart';
part 'extension/_date.dart';
part 'extension/_double.dart';
part 'extension/_int.dart';
part 'extension/_list.dart';
part 'extension/_num.dart';
part 'extension/_string.dart';

class App {
  static bool? isLtr;
  static bool showAds = false;

  static void init(BuildContext context) {
    UI.init(context);
    AppDimensions.init();
    AppTheme.init(context);
    UIProps.init();
    Space.init();
    AppText.init();
    isLtr = Directionality.of(context) == ui.TextDirection.ltr;
  }
}
