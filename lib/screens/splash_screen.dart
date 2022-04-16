import 'package:al_quran/configs/configs.dart';
import 'package:al_quran/cubits/bookmarks/cubit.dart';
import 'package:al_quran/cubits/juz/cubit.dart';
import 'package:al_quran/cubits/quran/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:al_quran/configs/app.dart';
import 'package:al_quran/utils/assets.dart';
import 'package:al_quran/cubits/chapter/cubit.dart';
import 'package:al_quran/providers/app_provider.dart';
import 'package:al_quran/animations/bottom_animation.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _next() async {
    final appProvider = Provider.of<AppProvider>(context, listen: false);

    final bookmarkCubit = BookmarkCubit.cubit(context);
    final chapterCubit = ChapterCubit.cubit(context);
    final quranCubit = QuranCubit.cubit(context);
    final juzCubit = JuzCubit.cubit(context);

    await chapterCubit.fetch();

    await bookmarkCubit.fetch();

    for (int i = 1; i <= 30; i++) {
      await juzCubit.fetch(i);
    }

    for (int i = 1; i <= 604; i++) {
      await quranCubit.fetch(i);
    }
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

    final bookmarkCubit = BookmarkCubit.cubit(context);
    final quranCubit = QuranCubit.cubit(context);
    final juzCubit = JuzCubit.cubit(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            WidgetAnimator(
              child: Image.asset(
                StaticAssets.logo,
                height: AppDimensions.normalize(100),
              ),
            ),
            Space.y1!,
            Shimmer.fromColors(
              enabled: true,
              baseColor: Colors.black,
              highlightColor: Colors.white,
              child: BlocBuilder<ChapterCubit, ChapterState>(
                builder: (context, state) {
                  if (state is ChapterFetchLoading) {
                    return const Text('Getting all Surahs...');
                  } else if (bookmarkCubit.state is BookmarkFetchLoading) {
                    return const Text('Setting up Bookmarks...');
                  } else if (juzCubit.state is JuzFetchLoading) {
                    return const Text('Loading all Juz...');
                  } else if (quranCubit.state is QuranFetchLoading) {
                    return const Text('Setting up offline mode...');
                  }
                  return const Text('Initializing data...');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
