import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

class OnBoardingCard extends StatelessWidget {
  final pages = [
    PageModel(
        color: Colors.grey[700],
        imageAssetPath: 'assets/grad_logo.png',
        title: "The Holy Qur'an",
        body:
            "\"Indeed, It is We who sent down the Qur'an and indeed, We will be its Guardian\"\n",
        doAnimateImage: true),
    PageModel(
        color: const Color(0xff106791),
        imageAssetPath: 'assets/ui.png',
        title: "Fancy & Beautiful Design",
        body:
            "We have worked hard to choose beautiful Colors, Animations and overall an appealing Design for this Beautiful Book",
        doAnimateImage: true),
    PageModel(
        color: const Color(0xff664d7b),
        imageAssetPath: 'assets/sajdaIndex.png',
        title: "Sajda Index",
        body:
            "Now, with Sajda Index you can directly open any Sajda in Qur'an from the list along with brief information about it.",
        doAnimateImage: true),
    PageModel(
        color: const Color(0xff04364f),
        imageAssetPath: 'assets/easyNav.png',
        title: "Easy to Explore",
        body:
            "Open Juzz, Surah or Sajda directly from the index. Long press any Surah or Sajda will show brief information about it.",
        doAnimateImage: true),
    PageModel(
        color: Colors.grey[850],
        imageAssetPath: 'assets/drawer3d.gif',
        title: "3D Animated Drawer",
        body:
            "We have introduced a unique 3D Animated drawer. Share your feedback about such ideas.",
        doAnimateImage: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipCallback: () {
          Navigator.pushNamed(context, '/homeScreen');
        },
        finishCallback: () {
          Navigator.pushNamed(context, '/homeScreen');
        },
      ),
    );
  }
}
