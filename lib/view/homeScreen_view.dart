import 'dart:io';
import 'dart:math' as math;

import 'package:al_quran/animations/bottomAnimation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController animationController;
  final double maxSlide = 300.0;

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

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta / maxSlide;
      animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    //I have no idea what it means, copied from Drawer
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var mainScreen = Container(
        color: Colors.grey[800],
        child: Stack(
          children: <Widget>[
            Calligraphy(),
            QuranRail(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * 0.05),
                  SurahBtn(),
                  SizedBox(height: height * 0.03),
                  SajdaBtn(),
                ],
              ),
            ),
            Ayat(),
          ],
        ));

    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
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
              color: Colors.grey[700],
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset:
                        Offset(maxSlide * (animationController.value - 1), 0),
                    child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(
                              math.pi / 2 * (1 - animationController.value)),
                        alignment: Alignment.centerRight,
                        child: MyDrawer()),
                  ),
                  Transform.translate(
                    offset: Offset(maxSlide * animationController.value, 0),
                    child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(-math.pi / 2 * animationController.value),
                        alignment: Alignment.centerLeft,
                        child: mainScreen),
                  ),
                  Positioned(
                    top: 4.0 + MediaQuery.of(context).padding.top,
                    left: width * 0.01 + animationController.value * maxSlide,
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: toggle,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                      top: height * 0.13,
                      left: width * 0.04 +
                          animationController.value *
                              MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      child: AppName()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.835,
      height: double.infinity,
      child: Material(
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.grey[800],
              // decoration: BoxDecoration(
              //     gradient: RadialGradient(
              //         center: Alignment.topRight,
              //         radius: 2,
              //         stops: [
              //       0.05,
              //       0.2,
              //       0.4,
              //       0.6,
              //       1
              //     ],
              //         colors: [
              //       Colors.white,
              //       Color(0xfff9e9b8),
              //       Color(0xffee8f8b),
              //       Color(0xff896277),
              //       Color(0xff04364f)
              //     ])),
            ),
            DrawerAppName(),
            DrawerCalligraphy(),
            DrawerInfo(),
            Developer(),
          ],
        ),
      ),
    );
  }
}

class DrawerInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.fromLTRB(0, height * 0.22, 0, height * 0.3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MetaData(),
          MetaDataInfo(),
        ],
      ),
    );
  }
}

class Developer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: height * 0.28,
        child: Column(
          children: <Widget>[
            Text(
              "Developed By\n",
              style:
                  TextStyle(fontSize: height * 0.016, color: Colors.grey[100]),
            ),
            CircleAvatar(
              backgroundColor: Color(0xffee8f8b),
              maxRadius: height * 0.063,
              child: CircleAvatar(
                maxRadius: height * 0.06,
                backgroundImage: AssetImage('assets/myPic.JPG'),
              ),
            ),
            Text(
              "\nMuhammad Hamza",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "Flutter Developer",
              style:
                  TextStyle(fontSize: height * 0.016, color: Colors.grey[100]),
            ),
          ],
        ),
      ),
    );
  }
}

class MetaData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Surahs: "),
        Text("Ayahs: "),
        Text("Rukus: "),
        Text("Sajood: "),
        Text("Meccan Ch: "),
        Text("Mednian Ch: "),
      ],
    );
  }
}

class MetaDataInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text("114"),
        Text("6,666"),
        Text("558"),
        Text("15"),
        Text("86"),
        Text("28"),
      ],
    );
  }
}

class DrawerCalligraphy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Positioned(
        top: height * 0.07,
        right: width * 0.01,
        child: Image.asset(
          "assets/grad_logo.png",
          height: height * 0.15,
        ));
  }
}

class DrawerAppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Positioned(
      left: width * 0.03,
      top: height * 0.05,
      child: Column(
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
    );
  }
}

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("The", style: Theme.of(context).textTheme.headline2),
        Text(
          "Holy\nQur'an",
          style: Theme.of(context).textTheme.headline1,
        )
      ],
    );
  }
}

class Calligraphy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Positioned(
        left: width - 250,
        top: height * 0.045,
        child: Image.asset('assets/grad_logo.png', height: height * 0.28));
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
        child:
            Opacity(opacity: 0.2, child: Image.asset('assets/quranRail.png')));
  }
}

class SurahBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width * 0.7,
      height: height * 0.06,
      child: RaisedButton(
        shape: StadiumBorder(),
        onPressed: () => Navigator.pushNamed(context, '/surahIndex'),
        child: WidgetAnimator(
            Text("Surah Index", style: Theme.of(context).textTheme.bodyText1)),
        color: Color(0xffee8f8b),
      ),
    );
  }
}

class SajdaBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width * 0.7,
      height: height * 0.06,
      child: RaisedButton(
        shape: StadiumBorder(),
        onPressed: () {
          Navigator.pushNamed(context, '/sajda');
        },
        child: WidgetAnimator(
            Text("Sajda Index", style: Theme.of(context).textTheme.bodyText1)),
        color: Color(0xffee8f8b),
      ),
    );
  }
}

class Ayat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[50],
        highlightColor: Colors.grey[400],
        enabled: true,
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
      ),
    );
  }
}
