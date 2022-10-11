import 'package:flutter/material.dart';
import 'package:al_quran/configs/app_theme.dart';
import 'package:al_quran/configs/app_typography.dart';

class CustomTitle extends StatelessWidget {
  final String? title;

  const CustomTitle({Key? key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
