import 'package:al_quran/configs/app.dart';
import 'package:flutter/material.dart';

class ScrollColumnExpandable extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final VerticalDirection verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final ScrollController? controller;
  final ScrollPhysics? physics;

  const ScrollColumnExpandable({
    super.key,
    required this.children,
    this.margin,
    this.controller,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisSize? mainAxisSize,
    MainAxisAlignment? mainAxisAlignment,
    VerticalDirection? verticalDirection,
    EdgeInsetsGeometry? padding,
    this.textDirection,
    this.textBaseline,
    this.physics,
  })  : crossAxisAlignment = crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisAlignment = mainAxisAlignment ?? MainAxisAlignment.start,
        verticalDirection = verticalDirection ?? VerticalDirection.down,
        mainAxisSize = mainAxisSize ?? MainAxisSize.max,
        padding = padding ?? EdgeInsets.zero;

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final children = <Widget>[const SizedBox(width: double.infinity)];

    children.addAll(this.children);

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            physics: physics,
            controller: controller,
            child: Padding(
              padding: padding,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraint.maxHeight - padding.vertical,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: crossAxisAlignment,
                    mainAxisAlignment: mainAxisAlignment,
                    mainAxisSize: mainAxisSize,
                    verticalDirection: verticalDirection,
                    textBaseline: textBaseline,
                    textDirection: textDirection,
                    children: children,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
