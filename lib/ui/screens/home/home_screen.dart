import 'dart:async';
import 'dart:math' as math;
import 'package:al_quran/router/routes.dart';
import 'package:al_quran/configs/app.dart';
import 'package:al_quran/providers/app_provider.dart';
import 'package:al_quran/ui/widgets/core/screen/screen.dart';
import 'package:al_quran/utils/drawer.dart';
import 'package:al_quran/ui/widgets/button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:al_quran/configs/configs.dart';
import 'package:al_quran/ui/widgets/app/app_name.dart';
import 'package:al_quran/ui/widgets/quran_rail.dart';
import 'package:al_quran/ui/widgets/calligraphy.dart';
import 'package:al_quran/ui/widgets/app/app_version.dart';
import 'package:al_quran/ui/widgets/app/drawer_app_name.dart';

part 'widgets/main_screen.dart';
part 'widgets/bottom_ayah.dart';
part 'widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController animationController;
  late double maxSlide;

  @override
  void initState() {
    super.initState();

    maxSlide = UI.width! * 0.835;

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250),);
  }

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

  late bool _canBeDragged;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _onDragStart(DragStartDetails details) {
    final isDragOpenFromLeft = animationController.isDismissed;
    final isDragCloseFromRight = animationController.isCompleted;
    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      final delta = details.primaryDelta! / maxSlide;
      animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    const kMinFlingVelocity = 365.0;

    if (animationController.isDismissed || animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= kMinFlingVelocity) {
      final visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      animationController.fling(velocity: visualVelocity);
    } else if (animationController.value < 0.5) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  Future<bool> _onWillPop() async {
    final shouldPop = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text(
          'Exit Application',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text('Are You Sure?'),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Yes',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
              SystemNavigator.pop(animated: true);
            },
          ),
          TextButton(
            child: const Text(
              'No',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        ],
      ),
    );
    return shouldPop ?? false;
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final appProvider = Provider.of<AppProvider>(context);
    final width = MediaQuery.of(context).size.width;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        await _onWillPop();
      },
      child: GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        behavior: HitTestBehavior.translucent,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            return Screen(
              scaffoldBackgroundColor:
                  appProvider.isDark ? Colors.grey[900] : Colors.grey[200],
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset:
                        Offset(maxSlide * (animationController.value - 1), 0),
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(
                            math.pi / 2 * (1 - animationController.value),),
                      alignment: Alignment.centerRight,
                      child: const _CustomDrawer(),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(maxSlide * animationController.value, 0),
                    child: Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(-math.pi / 2 * animationController.value),
                      alignment: Alignment.centerLeft,
                      child: const _MainScreen(),
                    ),
                  ),
                  Positioned(
                    top: 4.0 + MediaQuery.of(context).padding.top,
                    left: width * 0.02 + animationController.value * maxSlide,
                    child: IconButton(
                      icon: Icon(
                        Iconsax.menu,
                        size: AppDimensions.normalize(11),
                        color: Colors.grey,
                      ),
                      onPressed: toggle,
                      color: appProvider.isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
