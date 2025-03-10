import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

final themeMap = {
  'system': ThemeMode.system,
  'dark': ThemeMode.dark,
  'light': ThemeMode.light,
};

enum Cache {
  theme,
  locale,
  firstOpen,
}

class AppProvider extends ChangeNotifier {
  static AppProvider s(BuildContext context, [bool listen = false]) =>
      Provider.of<AppProvider>(context, listen: listen);

  var themeMode = ThemeMode.light;
  var key = const Key('app');
  var firstOpen = false;
  late Box<dynamic> _cache;
  bool get isDark => themeMode == ThemeMode.dark;

  AppProvider() {
    _init();
  }

  void _init() async {
    await Hive.openBox('app');
    _cache = Hive.box('app');

    final cachedTheme = _cache.get(Cache.theme.toString());
    themeMode = cachedTheme == null ? themeMode : themeMap[cachedTheme]!;

    final hasOpened = _cache.get(Cache.firstOpen.toString());
    firstOpen = hasOpened == null;
    notifyListeners();
  }

  void setTheme(ThemeMode newTheme) {
    if (themeMode == newTheme) return;
    themeMode = newTheme;
    notifyListeners();
    _cache.put(
      Cache.theme.toString(),
      newTheme.toString().split('.').last,
    );
  }

  void setFirstOpen() {
    firstOpen = true;
    notifyListeners();
    _cache.put(Cache.firstOpen.toString(), 'true');
  }

  void reset() async {
    firstOpen = true;
    themeMode = ThemeMode.system;
    await _cache.clear();
    key = Key(DateTime.now().toString());
    notifyListeners();
  }

  void resetKey([bool notify = true]) {
    key = Key(DateTime.now().toString());
    if (notify) notifyListeners();
  }
}
