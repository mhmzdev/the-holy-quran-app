import 'package:al_quran/darkModeController/darkThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CustomTitle extends StatelessWidget {
  final String? title;

  CustomTitle({this.title});
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Positioned(
      top: height * 0.12,
      left: width * 0.1,
      child: Shimmer.fromColors(
        baseColor: themeChange.darkTheme ? Colors.white : Colors.black,
        highlightColor: Colors.grey,
        enabled: true,
        child: Text(
          title!,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
