import 'package:flutter/material.dart';
import 'package:al_quran/configs/theme/app_theme.dart';
import 'package:al_quran/configs/typography/app_typography.dart';

class CustomTitle extends StatelessWidget {
  final String? title;

  const CustomTitle({super.key, this.title});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Positioned(
      top: height * 0.12,
      left: width * 0.05,
      child: Text(
        title!,
        style: AppText.h2b!.copyWith(
          color: AppTheme.c!.textSub,
        ),
      ),
    );
  }
}
