import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';

class OnBoardingCard extends StatelessWidget {
  final pageList = [
    PageModel(
      color: Colors.grey[700],
        // color: Color(0xff1b3f64),
        heroAssetPath: 'assets/grad_logo.png',
        title: Text("The Holy Qur'an",
            style: TextStyle(
                fontFamily: 'Sogeo',
                fontSize: 28,
                fontWeight: FontWeight.w600)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "\"Indeed, It is We who sent down the Qur'an and indeed, We will be its Guardian\"\n",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
              Text(
                "Surah Al-Hijr\n",
              ),
            ],
          ),
        ),
        iconAssetPath: 'assets/logo.png'),
    PageModel(
        color: Color(0xff106791),
        heroAssetPath: 'assets/ui.png',
        title: Text("Fancy & Beautiful Design",
            style: TextStyle(
                fontFamily: 'Sogeo',
                fontSize: 28,
                fontWeight: FontWeight.w600)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
              "We have worked hard to choose beautiful Colors, Animations and overall an appealing Design for this Beautiful Book!",
              textAlign: TextAlign.center),
        ),
        iconAssetPath: 'assets/logo.png'),
    PageModel(
        color: Color(0xff664d7b),
        heroAssetPath: 'assets/sajdaIndex.png',
        iconAssetPath: 'assets/logo.png',
        title: Text("Sajda Index",
            style: TextStyle(
                fontFamily: 'Sogeo',
                fontSize: 28,
                fontWeight: FontWeight.w600)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
              "Now, with Sajda Index you can directly open any Sajda in Qur'an from the list along with brief information about it.",
              textAlign: TextAlign.center),
        )),
    PageModel(
        color: Color(0xff04364f),
        heroAssetPath: 'assets/easyNav.png',
        iconAssetPath: 'assets/logo.png',
        title: Text("Easy to Explore",
            style: TextStyle(
                fontFamily: 'Sogeo',
                fontSize: 28,
                fontWeight: FontWeight.w600)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
              "Open Juzz or Surah directly from the index. Long press any Surah will show brief information about it.",
              textAlign: TextAlign.center),
        )),
    PageModel(
        color: Colors.grey[850],
        heroAssetPath: 'assets/drawer3d.gif',
        iconAssetPath: 'assets/logo.png',
        title: Text("3D Animated Drawer",
            style: TextStyle(
                fontFamily: 'Sogeo',
                fontSize: 28,
                fontWeight: FontWeight.w600)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
              "We have introduced a unique 3D Animated drawer. Share your feedback about such ideas.",
              textAlign: TextAlign.center),
        ))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FancyOnBoarding(
          pageList: pageList,
          doneButtonShape: StadiumBorder(),
          doneButtonTextStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.02,
              fontWeight: FontWeight.bold),
          doneButtonText: 'Next',
          skipButtonText: 'Help Guide',
          onSkipButtonPressed: () => Navigator.pushNamed(context, '/help'),
          onDoneButtonPressed: () =>
              Navigator.pushNamed(context, '/homeScreen')),
    );
  }
}
