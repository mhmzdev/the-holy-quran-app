import 'package:al_quran/customWidgets/appVersion.dart';
import 'package:al_quran/customWidgets/backBtn.dart';
import 'package:al_quran/customWidgets/customImagePos.dart';
import 'package:al_quran/customWidgets/title.dart';
import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            CustomImage(
              networkImgURL:
                  "https://user-images.githubusercontent.com/43790152/115107801-8625f280-9f86-11eb-9d8b-2b1cc74a5796.png",
              opacity: 0.5,
              height: MediaQuery.of(context).size.height * 0.18,
            ),
            BackBtn(),
            CustomTitle(title: "Help Guide"),
            HelpGuide(),
            AppVersion(),
          ],
        ),
      ),
    );
  }
}

class HelpGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.fromLTRB(0, height * 0.2, 0, height * 0.1),
      child: ListView(
        children: <Widget>[
          GuideContainer(
            guideNo: 1,
            title: "Internet Connectivity",
            guideDescription:
                "For now, the app is NOT available in Offline reading mode. So, internet connection is a must for getting all the data.",
          ),
          GuideContainer(
            title: "Juzz - Surah Index",
            guideNo: 2,
            guideDescription:
                "Open any Juzz, Surah or Sajda directly from index. It has all 30 chapters and 114 surahs." +
                    " Press and hold any Surah or Sajda for viewing a brief information about it.",
          ),
          GuideContainer(
            guideNo: 3,
            title: "Sajda Index",
            guideDescription:
                "Open any Sajda Ayah directly from index. It has all 15 Sajdas." +
                    " Further there will be information about every Sajda inside, including Juzz, Ruku and Chapter type of Surah",
          ),
          GuideContainer(
            guideNo: 4,
            title: "Introduction Tab",
            guideDescription:
                "It will re-open the introduction of app that you might have saw when opened the app for the first time",
          ),
          GuideContainer(
            guideNo: 5,
            title: "Rate & Feedback",
            guideDescription:
                "You can give your precious feedback and rate our app on Google play store.",
          ),
          GuideContainer(
            guideNo: 6,
            title: "Reporting a Mistake",
            guideDescription:
                "If you see any mistake in context of this Holy Book please report at the following link:" +
                    "\n\nhttps://api.alquran.cloud",
          ),
          GuideContainer(
            guideNo: 7,
            title: "Code Available",
            guideDescription:
                "Code for v1.0.0 is available at the following link: " +
                    "\n\nhttps://github.com/m-hamzashakeel/The_Holy_Quran_App" +
                    "\n\nThe code is only for learning purposes, it has proper LICENSE that you are not allowed to publish this app.",
          ),
          GuideContainer(
            guideNo: 8,
            title: "Developer's Info",
            guideDescription:
                "Name: Muhammad Hamza \nEmail: hamza.6.shakeel@gmail.com \nGitHub: @m-hamzashakeel \nWebsite: m-hamzashakeel.github.io",
          )
        ],
      ),
    );
  }
}

class GuideContainer extends StatelessWidget {
  final String title;
  final String guideDescription;
  final int guideNo;

  GuideContainer(
      {required this.guideNo,
      required this.title,
      required this.guideDescription});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            "\n$guideNo. $title",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            guideDescription,
            textAlign: TextAlign.justify,
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.020),
          ),
        ],
      ),
    );
  }
}
