import 'package:al_quran/app_routes.dart';
import 'package:flutter/material.dart';

class DrawerUtils {
  static const List items = [
    {
      'title': 'Surah Index',
      'icon': Icons.format_list_numbered_outlined,
      'route': AppRoutes.surah,
    },
    {
      'title': 'Juz Index',
      'icon': Icons.list,
      'route': AppRoutes.juz,
    },
    {
      'title': 'Bookmarks',
      'icon': Icons.bookmark_outline,
      'route': AppRoutes.bookmarks,
    },
    {
      'title': 'Help Guide',
      'icon': Icons.help_outline,
      'route': AppRoutes.helpGuide,
    },
    {
      'title': 'Introduction',
      'icon': Icons.info_outline,
      'route': AppRoutes.onboarding,
    },
    {
      'title': 'Share App',
      'icon': Icons.share_outlined,
      'route': AppRoutes.shareApp,
    },
  ];
}
