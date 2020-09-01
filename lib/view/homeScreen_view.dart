import 'dart:io';
import 'dart:math' as math;

import 'package:al_quran/animations/bottomAnimation.dart';
import 'package:al_quran/customWidgets/appVersion.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final double maxSlide;
  HomeScreen({@required this.maxSlide});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
  }

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

  bool _canBeDragged;

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
      double delta = details.primaryDelta / widget.maxSlide;
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
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            title: new Text(
              "Exit Application",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: new Text("Are You Sure?"),
            actions: <Widget>[
              FlatButton(
                shape: StadiumBorder(),
                color: Colors.white,
                child: new Text(
                  "Yes",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  exit(0);
                },
              ),
              FlatButton(
                shape: StadiumBorder(),
                color: Colors.white,
                child: new Text(
                  "No",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
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
              color: Colors.grey[850],
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
                          child: MyDrawer()),
                    ),
                    Transform.translate(
                      offset: Offset(
                          widget.maxSlide * animationController.value, 0),
                      child: Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(-math.pi / 2 * animationController.value),
                          alignment: Alignment.centerLeft,
                          child: MainScreen()),
                    ),
                    Positioned(
                      top: 4.0 + MediaQuery.of(context).padding.top,
                      left: width * 0.01 +
                          animationController.value * widget.maxSlide,
                      child: IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: toggle,
                        color: Colors.white,
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
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[800],
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            AppName(),
            Calligraphy(),
            QuranRail(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[SurahBtn(), JuzzIndexBtn(), SajdaBtn()],
              ),
            ),
            AyahBottom(),
          ],
        ));
  }
}

class MyDrawer extends StatelessWidget {
  myListTile(BuildContext context, double height, IconData tileIcon,
      String title, String pushName) {
    return Card(
      color: Colors.grey[700],
      child: ListTile(
        leading: Icon(tileIcon, size: height * 0.035),
        title: Text(title),
        onTap: () => Navigator.pushNamed(context, pushName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width * 0.835,
      height: height,
      child: Material(
        color: Colors.grey[800],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DrawerAppName(),
              Column(
                children: <Widget>[
                  myListTile(context, height, Icons.format_list_bulleted,
                      "Juzz Index", "/juzzIndex"),
                  myListTile(context, height, Icons.format_list_numbered,
                      "Surah Index", "/surahIndex"),
                  myListTile(context, height, Icons.format_align_left,
                      "Sajda Index", "/sajda"),
                  myListTile(
                      context, height, Icons.help, "Help Guide", "/help"),
                  myListTile(context, height, Icons.info, "Introduction",
                      "/introduction"),
                  myListTile(
                      context, height, Icons.share, "Share App", "/shareApp"),
                ],
              ),
              AppVersion()
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerAppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "\nThe",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.025,
                  color: Colors.grey[200]),
            ),
            Text(
              "Holy\nQur'an",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[200],
                  fontSize: height * 0.035),
            )
          ],
        ),
        Image.asset('assets/grad_logo.png', height: height * 0.17)
      ],
    );
  }
}

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.12,
      left: MediaQuery.of(context).size.width * 0.05,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("The", style: Theme.of(context).textTheme.headline2),
          Text(
            "Holy\nQur'an",
            style: Theme.of(context).textTheme.headline1,
          )
        ],
      ),
    );
  }
}

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
        ));
  }
}

class SurahBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: SizedBox(
        width: width * 0.7,
        height: height * 0.06,
        child: RaisedButton(
          shape: StadiumBorder(),
          onPressed: () => Navigator.pushNamed(context, '/surahIndex'),
          child: WidgetAnimator(Text("Surah Index",
              style: TextStyle(
                  fontSize: height * 0.023, fontWeight: FontWeight.w600))),
          color: Color(0xffee8f8b),
        ),
      ),
    );
  }
}

class SajdaBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: SizedBox(
        width: width * 0.7,
        height: height * 0.06,
        child: RaisedButton(
          shape: StadiumBorder(),
          onPressed: () {
            Navigator.pushNamed(context, '/sajda');
          },
          child: WidgetAnimator(Text("Sajda Index",
              style: TextStyle(
                  fontSize: height * 0.023, fontWeight: FontWeight.w600))),
          color: Color(0xffee8f8b),
        ),
      ),
    );
  }
}

class JuzzIndexBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: SizedBox(
        width: width * 0.7,
        height: height * 0.06,
        child: RaisedButton(
          shape: StadiumBorder(),
          onPressed: () {
            Navigator.pushNamed(context, '/juzzIndex');
          },
          child: WidgetAnimator(Text("Juzz Index",
              style: TextStyle(
                  fontSize: height * 0.023, fontWeight: FontWeight.w600))),
          color: Color(0xffee8f8b),
        ),
      ),
    );
  }
}

class AyahBottom extends StatelessWidget {
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
