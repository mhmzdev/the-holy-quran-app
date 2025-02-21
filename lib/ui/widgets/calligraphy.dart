import 'package:al_quran/configs/space/app_dimensions.dart';
import 'package:al_quran/static/assets.dart';
import 'package:flutter/material.dart';

class Calligraphy extends StatelessWidget {
  const Calligraphy({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Positioned(
      right: width * 0.01,
      top: height * 0.045,
      child: Image.asset(
        StaticAssets.logosGradLogo,
        height: AppDimensions.normalize(75),
      ),
    );
  }
}
