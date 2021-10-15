import 'package:al_quran/animations/bottomAnimation.dart';
import 'package:al_quran/customWidgets/backBtn.dart';
import 'package:al_quran/customWidgets/customImagePos.dart';
import 'package:al_quran/customWidgets/flare.dart';
import 'package:al_quran/customWidgets/title.dart';
import 'package:al_quran/darkModeController/darkThemeProvider.dart';
import 'package:al_quran/view/juzz/juz_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JuzIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.fromLTRB(0, height * 0.2, 0, 0),
            child: GridView.builder(
              itemCount: 30,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return WidgetAnimator(
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Juz(juzIndex: index + 1),
                      ),
                    ),
                    child: Card(
                      shape: themeChange.darkTheme
                          ? StadiumBorder()
                          : RoundedRectangleBorder(),
                      color: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                          color: themeChange.darkTheme
                              ? Colors.grey[800]
                              : Colors.white70,
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "${index + 1}",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          BackBtn(),
          CustomImage(
            opacity: 0.3,
            height: height * 0.2,
            networkImgURL: "https://i.ibb.co/VwgpjK0/quran-Rail.png",
          ),
          CustomTitle(
            title: "Juzz Index",
          ),
          themeChange.darkTheme
              ? Flare(
                  color: Color(0xfff9e9b8),
                  offset: Offset(width, -height),
                  bottom: -50,
                  flareDuration: Duration(seconds: 17),
                  left: 100,
                  height: 60,
                  width: 60,
                )
              : Container(),
          themeChange.darkTheme
              ? Flare(
                  color: Color(0xfff9e9b8),
                  offset: Offset(width, -height),
                  bottom: -50,
                  flareDuration: Duration(seconds: 12),
                  left: 10,
                  height: 25,
                  width: 25,
                )
              : Container(),
          themeChange.darkTheme
              ? Flare(
                  color: Color(0xfff9e9b8),
                  offset: Offset(width, -height),
                  bottom: -40,
                  left: -100,
                  flareDuration: Duration(seconds: 18),
                  height: 50,
                  width: 50,
                )
              : Container(),
          themeChange.darkTheme
              ? Flare(
                  color: Color(0xfff9e9b8),
                  offset: Offset(width, -height),
                  bottom: -50,
                  left: -80,
                  flareDuration: Duration(seconds: 15),
                  height: 50,
                  width: 50,
                )
              : Container(),
          themeChange.darkTheme
              ? Flare(
                  color: Color(0xfff9e9b8),
                  offset: Offset(width, -height),
                  bottom: -20,
                  left: -120,
                  flareDuration: Duration(seconds: 12),
                  height: 40,
                  width: 40,
                )
              : Container(),
        ],
      )),
    );
  }
}
