import 'package:al_quran/configs/app.dart';
import 'package:al_quran/configs/configs.dart';
import 'package:al_quran/utils/assets.dart';
import 'package:al_quran/utils/links.dart';
import 'package:al_quran/widgets/app/app_version.dart';
import 'package:al_quran/widgets/button/app_back_button.dart';
import 'package:al_quran/widgets/custom_image.dart';
import 'package:al_quran/widgets/app/title.dart';
import 'package:flutter/material.dart';

class HelpGuide extends StatelessWidget {
  const HelpGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            CustomImage(
              imagePath: StaticAssets.gradLogo,
              opacity: 0.5,
              height: MediaQuery.of(context).size.height * 0.18,
            ),
            const AppBackButton(),
            const CustomTitle(title: "Help Guide"),
            const Guidelines(),
            const AppVersion(),
          ],
        ),
      ),
    );
  }
}

class Guidelines extends StatelessWidget {
  const Guidelines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: EdgeInsets.fromLTRB(0, height * 0.2, 0, height * 0.1),
      child: ListView(
        children: <Widget>[
          const GuideContainer(
            guideNo: 1,
            title: "Internet Connectivity",
            guideDescription:
                "The application is available in Offline Mode. However, you will need internet connection first to load all the data.",
          ),
          const GuideContainer(
            title: "Juz & Surah Index",
            guideNo: 2,
            guideDescription:
                "Open any Juzz, Surah or Sajda directly from index. It has all 30 chapters and 114 surahs. Press and hold any Surah or Sajda for viewing a brief information about it.",
          ),
          const GuideContainer(
            guideNo: 3,
            title: "Introduction Tab",
            guideDescription:
                "It will re-open the introduction of app that you might have seen when opened the app for the first time",
          ),
          const GuideContainer(
            guideNo: 4,
            title: "Rate & Feedback",
            guideDescription:
                "You can give your precious feedback and rate our app on Google play store.",
          ),
          const GuideContainer(
            guideNo: 5,
            title: "Reporting a Mistake",
            guideDescription:
                "If you see any mistake in context of this Holy Book please report at the following link: \n\n${Links.api}",
          ),
          const GuideContainer(
            guideNo: 6,
            title: "Code Available",
            guideDescription:
                "Code is available at the following link: \n\n${Links.github} \n\nThe code is for learning purposes, it has proper LICENSE but you are not allowed to publish this app.",
          ),
          GuideContainer(
            guideNo: 7,
            title: "Developer's Info",
            guideDescription:
                "Name: ${Links.dev['name']} \nEmail: ${Links.dev['email']} \nGitHub: ${Links.dev['github']} \nWebsite: ${Links.dev['website']}",
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

  const GuideContainer(
      {Key? key,
      required this.guideNo,
      required this.title,
      required this.guideDescription})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.all(),
      child: Column(
        children: <Widget>[
          Text(
            "\n$guideNo. $title",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Space.y1!,
          Text(
            guideDescription,
            textAlign: TextAlign.justify,
            style: AppText.b1!.cl(AppTheme.c!.text!),
          ),
        ],
      ),
    );
  }
}
