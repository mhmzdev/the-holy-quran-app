import 'dart:io';
import 'dart:math' as math;
import 'dart:async';
import 'package:al_quran/animations/bottom_animation.dart';
import 'package:al_quran/widgets/app_name.dart';
import 'package:al_quran/widgets/calligraphy.dart';
import 'package:al_quran/widgets/quran_rail.dart';
import 'package:al_quran/dark_mode_controller/theme_provider.dart';
import 'package:al_quran/view/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final double maxSlide;
  const HomeScreen({Key? key, required this.maxSlide}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
  }

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

  late bool _canBeDragged;

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = animationController.isDismissed;
    bool isDragCloseFromRight = animationController.isCompleted;
    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta! / widget.maxSlide;
      animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    double _kMinFlingVelocity = 365.0;

    if (animationController.isDismissed || animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= _kMinFlingVelocity) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      animationController.fling(velocity: visualVelocity);
    } else if (animationController.value < 0.5) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  Future<bool> _onWillPop() async {
    return (await (showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            title: const Text(
              "Exit Application",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: const Text("Are You Sure?"),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  "Yes",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  exit(0);
                },
              ),
              TextButton(
                child: const Text(
                  "No",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ) as FutureOr<bool>?)) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        behavior: HitTestBehavior.translucent,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            return Material(
              color: themeChange.darkTheme ? Colors.grey[850] : Colors.white70,
              child: SafeArea(
                child: Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(
                          widget.maxSlide * (animationController.value - 1), 0),
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(
                              math.pi / 2 * (1 - animationController.value)),
                        alignment: Alignment.centerRight,
                        child: const MyDrawer(),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                          widget.maxSlide * animationController.value, 0),
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(-math.pi / 2 * animationController.value),
                        alignment: Alignment.centerLeft,
                        child: const MainScreen(),
                      ),
                    ),
                    Positioned(
                      top: 4.0 + MediaQuery.of(context).padding.top,
                      left: width * 0.01 +
                          animationController.value * widget.maxSlide,
                      child: IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: toggle,
                        color:
                            themeChange.darkTheme ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      color: themeChange.darkTheme ? Colors.grey[800] : Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const AppName(),
          const Calligraphy(),
          const QuranRail(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[SurahBtn(), JuzzIndexBtn(), SajdaBtn()],
            ),
          ),
          const AyahBottom(),
        ],
      ),
    );
  }
}

class SurahBtn extends StatelessWidget {
  const SurahBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: SizedBox(
        width: width * 0.7,
        height: height * 0.06,
        child: MaterialButton(
          shape: const StadiumBorder(),
          onPressed: () => Navigator.pushNamed(context, '/surahIndex'),
          child: WidgetAnimator(
            child: Text(
              "Surah Index",
              style: TextStyle(
                  fontSize: height * 0.023, fontWeight: FontWeight.w400),
            ),
          ),
          color: const Color(0xffee8f8b),
        ),
      ),
    );
  }
}

class SajdaBtn extends StatelessWidget {
  const SajdaBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: SizedBox(
        width: width * 0.7,
        height: height * 0.06,
        child: MaterialButton(
          shape: const StadiumBorder(),
          onPressed: () {
            Navigator.pushNamed(context, '/sajda');
          },
          child: WidgetAnimator(
            child: Text(
              "Sajda Index",
              style: TextStyle(
                  fontSize: height * 0.023, fontWeight: FontWeight.w400),
            ),
          ),
          color: const Color(0xffee8f8b),
        ),
      ),
    );
  }
}

class JuzzIndexBtn extends StatelessWidget {
  const JuzzIndexBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: SizedBox(
        width: width * 0.7,
        height: height * 0.06,
        child: MaterialButton(
          shape: const StadiumBorder(),
          onPressed: () {
            Navigator.pushNamed(context, '/juzIndex');
          },
          child: WidgetAnimator(
            child: Text(
              "Juz Index",
              style: TextStyle(
                  fontSize: height * 0.023, fontWeight: FontWeight.w400),
            ),
          ),
          color: const Color(0xffee8f8b),
        ),
      ),
    );
  }
}

class AyahBottom extends StatelessWidget {
  const AyahBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            "\"Indeed, It is We who sent down the Qur'an\nand indeed, We will be its Guardian\"\n",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption,
          ),
          Text(
            "Surah Al-Hijr\n",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
