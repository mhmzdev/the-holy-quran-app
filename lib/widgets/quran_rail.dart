import 'package:flutter/material.dart';

class QuranRail extends StatelessWidget {
  const QuranRail({Key? key}) : super(key: key);

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
