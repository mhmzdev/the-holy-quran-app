import 'package:al_quran/configs/space/app_dimensions.dart';
import 'package:al_quran/static/assets.dart';
import 'package:flutter/material.dart';

class QuranRail extends StatelessWidget {
  const QuranRail({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Positioned(
      left: width * 0,
      bottom: height * 0.0,
      child: Opacity(
        opacity: 0.2,
        child: Image.asset(
          StaticAssets.imagesQuranRail,
          height: AppDimensions.normalize(110),
        ),
      ),
    );
  }
}
