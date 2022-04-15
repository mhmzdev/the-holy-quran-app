import 'package:al_quran/configs/app.dart';
import 'package:al_quran/configs/app_dimensions.dart';
import 'package:al_quran/cubits/chapter_data/cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:al_quran/utils/assets.dart';
import 'package:al_quran/cubits/quran/cubit.dart';
import 'package:al_quran/providers/app_provider.dart';
import 'package:al_quran/animations/bottom_animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _next() async {
    final appProvider = Provider.of<AppProvider>(context, listen: false);

    final quranCubit = QuranCubit.cubit(context);
    final chaptersDataCubit = ChapterDataCubit.cubit(context);
    await quranCubit.fetch();
    await chaptersDataCubit.fetch();

    bool isNew = appProvider.init();

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        Navigator.pushReplacementNamed(
          context,
          isNew ? '/intro' : '/home',
        );
      }
    });
  }

  @override
  void initState() {
    _next();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
      body: Center(
        child: WidgetAnimator(
          child: Image.asset(
            StaticAssets.logo,
            height: AppDimensions.normalize(100),
          ),
        ),
      ),
    );
  }
}
