import 'package:al_quran/configs/app.dart';
import 'package:al_quran/configs/configs.dart';
import 'package:al_quran/utils/assets.dart';
import 'package:flutter/material.dart';

part 'widgets/indicator.dart';
part 'widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int? _currentIndex = 0;

  List<Widget> pages = [
    const _OnBoardingPage(
      image: StaticAssets.gradLogo,
      text:
          "\"Indeed, It is We who sent down the Qur'an and indeed, We will be its Guardian\"\n",
    ),
    const _OnBoardingPage(
      image: StaticAssets.ui,
      text: "",
    ),
    const _OnBoardingPage(
      image: StaticAssets.easyNav,
      text: "",
    ),
    const _OnBoardingPage(
      image: StaticAssets.drawer3d,
      text: "",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    App.init(context);
    Object? args = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (int value) {
              setState(() {
                _currentIndex = value;
              });
            },
            controller: _pageController,
            children: pages.asMap().entries.map((e) {
              return e.value;
            }).toList(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: Space.all(0.5, 2),
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                    AppTheme.c!.accent,
                  ),
                ),
                child: const Text('Skip'),
                onPressed: () {
                  if ((args as Map)['route'] == 'drawer') {
                    Navigator.pop(context);
                  } else {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Row(
        children: [
          Space.x2!,
          ...pages.asMap().entries.map(
                (e) => _Indicator(
                  isSelected: _currentIndex == e.key,
                ),
              ),
          Space.xm!,
          FloatingActionButton(
            backgroundColor: AppTheme.c!.accent,
            child: _currentIndex == pages.length - 1
                ? const Icon(Icons.check)
                : const Icon(
                    Icons.arrow_forward,
                  ),
            onPressed: () {
              if (_currentIndex == pages.length - 1) {
                if ((args as Map)['route'] == 'drawer') {
                  Navigator.pop(context);
                } else {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              } else {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            },
          )
        ],
      ),
    );
  }
}
