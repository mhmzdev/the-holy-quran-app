import 'package:al_quran/blocs/bookmarks/bloc.dart';
import 'package:al_quran/blocs/chapter/bloc.dart';
import 'package:al_quran/blocs/juz/bloc.dart';
import 'package:al_quran/services/locator.dart';
import 'package:al_quran/ui/animations/bottom_animation.dart';
import 'package:al_quran/router/routes.dart';
import 'package:al_quran/configs/configs.dart';
import 'package:al_quran/ui/widgets/core/screen/screen.dart';
import 'package:al_quran/static/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:al_quran/configs/app.dart';
import 'package:al_quran/providers/app_provider.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _next() async {
    final appProvider = Provider.of<AppProvider>(context, listen: false);

    final isNew = appProvider.firstOpen;

    final bookmarkBloc = sl<BookmarksBloc>();
    final juzBloc = sl<JuzBloc>();

    context.read<ChapterBloc>().add(const ChapterFetch());

    bookmarkBloc.add(const BookmarksFetch());

    for (var i = 1; i <= 30; i++) {
      juzBloc.add(JuzFetch(juzIndex: i));
    }

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        Navigator.pushReplacementNamed(
          context,
          isNew ? AppRoutes.onboarding : AppRoutes.home,
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

    final bookmarkCubit = sl<BookmarksBloc>();
    final juzBloc = sl<JuzBloc>();

    final appProvider = Provider.of<AppProvider>(context);

    return Screen(
      scaffoldBackgroundColor:
          appProvider.isDark ? Colors.grey[850] : Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            WidgetAnimator(
              child: Image.asset(
                appProvider.isDark
                    ? StaticAssets.logosGradLogo
                    : StaticAssets.logosLogo,
                height: AppDimensions.normalize(100),
              ),
            ),
            Space.y1!,
            Shimmer.fromColors(
              enabled: true,
              baseColor: appProvider.isDark ? Colors.white : Colors.black,
              highlightColor: appProvider.isDark ? Colors.grey : Colors.white,
              child: BlocBuilder<ChapterBloc, ChapterState>(
                builder: (context, state) {
                  if (state is ChapterFetchLoading) {
                    return const Text('Getting all Surahs...');
                  } else if (bookmarkCubit.state is BookmarkFetchLoading) {
                    return const Text('Setting up Bookmarks...');
                  } else if (juzBloc.state is JuzFetchLoading) {
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
