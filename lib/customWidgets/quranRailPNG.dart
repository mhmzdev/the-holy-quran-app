import 'package:flutter/material.dart';

class QuranRail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Positioned(
      left: width * 0,
      bottom: height * 0.0,
      child: Opacity(
        opacity: 0.2,
        child: Image.asset("assets/quranRail.png", height: height * 0.4),
      ),
    );
  }
}
