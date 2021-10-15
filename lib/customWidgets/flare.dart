import 'package:al_quran/animations/entranceFader.dart';
import 'package:flutter/material.dart';

class Flare extends StatelessWidget {
  final Offset? offset;
  final Color? color;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double? height;
  final double? width;
  final Duration? flareDuration;

  Flare(
      {this.bottom,
      this.height,
      this.width,
      this.top,
      this.flareDuration,
      this.color,
      this.left,
      this.right,
      this.offset});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
      child: EntranceFader(
        offset: offset,
        duration: flareDuration,
        delay: Duration(milliseconds: 100),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [
                color!,
                color!.withAlpha(150),
                color!.withAlpha(100),
                color!.withAlpha(50),
                color!.withAlpha(5),
              ])),
        ),
      ),
    );
  }
}
