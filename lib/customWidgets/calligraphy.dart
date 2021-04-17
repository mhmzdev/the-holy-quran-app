import 'package:flutter/material.dart';

class Calligraphy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Positioned(
        right: width * 0.01,
        top: height * 0.045,
        child: Image.asset(
          "assets/grad_logo.png",
          height: height * 0.28,
        ));
  }
}
