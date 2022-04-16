import 'package:al_quran/configs/app.dart';
import 'package:al_quran/configs/configs.dart';
import 'package:al_quran/utils/assets.dart';
import 'package:flutter/material.dart';

class OnBoardingCard extends StatefulWidget {
  const OnBoardingCard({Key? key}) : super(key: key);

  @override
  State<OnBoardingCard> createState() => _OnBoardingCardState();
}

class _OnBoardingCardState extends State<OnBoardingCard> {
  final PageController _pageController = PageController();
  int? _currentIndex = 0;

  List<Widget> pages = [
    const _IntroWidget(
      image: StaticAssets.gradLogo,
    ),
    const _IntroWidget(
      image: StaticAssets.ui,
    ),
    const _IntroWidget(
      image: StaticAssets.easyNav,
    ),
    const _IntroWidget(
      image: StaticAssets.drawer3d,
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
          for (int i = 0; i < pages.length; i++)
            _Indicator(
              isSelected: _currentIndex == i,
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

class _Indicator extends StatelessWidget {
  final bool isSelected;
  const _Indicator({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: Space.hf(0.2),
      duration: const Duration(milliseconds: 150),
      width:
          isSelected ? AppDimensions.normalize(12) : AppDimensions.normalize(4),
      height: AppDimensions.normalize(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(360.0),
        color: isSelected ? AppTheme.c!.accent : Colors.grey,
      ),
    );
  }
}

class _IntroWidget extends StatelessWidget {
  final String image;
  const _IntroWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Image.asset(
            image,
            height: AppDimensions.normalize(150),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  "\"Indeed, It is We who sent down the Qur'an and indeed, We will be its Guardian\"\n",
                  style: AppText.b2b,
                ),
              ),
              const Spacer(),
            ],
          ),
          Space.y2!,
        ],
      ),
    );
  }
}
