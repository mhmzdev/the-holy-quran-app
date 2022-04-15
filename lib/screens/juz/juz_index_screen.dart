import 'package:al_quran/animations/bottom_animation.dart';
import 'package:al_quran/configs/app_dimensions.dart';
import 'package:al_quran/configs/app_typography.dart';
import 'package:al_quran/cubits/juz/cubit.dart';
import 'package:al_quran/screens/surah/surah_index_screen.dart';
import 'package:al_quran/utils/assets.dart';
import 'package:al_quran/widgets/custom_back_button.dart';
import 'package:al_quran/widgets/custom_image.dart';
import 'package:al_quran/widgets/flare.dart';
import 'package:al_quran/widgets/title.dart';
import 'package:al_quran/providers/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JuzIndexScreen extends StatefulWidget {
  const JuzIndexScreen({Key? key}) : super(key: key);

  @override
  State<JuzIndexScreen> createState() => _JuzIndexScreenState();
}

class _JuzIndexScreenState extends State<JuzIndexScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final juzCubit = JuzCubit.cubit(context);

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: EdgeInsets.fromLTRB(0, AppDimensions.normalize(60), 0, 0),
            child: GridView.builder(
              itemCount: 30,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                return WidgetAnimator(
                  child: GestureDetector(
                    onTap: () async {
                      await juzCubit.fetch(index + 1);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PageScreen(
                            chapter: juzCubit.state.data,
                            juzNumber: index + 1,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: themeChange.darkTheme
                          ? const StadiumBorder()
                          : const RoundedRectangleBorder(),
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
                          style: AppText.b1b,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const CustomBackButton(),
          CustomImage(
            opacity: 0.3,
            height: AppDimensions.normalize(60),
            imagePath: StaticAssets.quranRail,
          ),
          const CustomTitle(
            title: "Juzz Index",
          ),
          if (themeChange.darkTheme) ...[
            Flare(
              color: const Color(0xfff9e9b8),
              offset: Offset(width, -height),
              bottom: -50,
              flareDuration: const Duration(seconds: 17),
              left: 100,
              height: 60,
              width: 60,
            ),
            Flare(
              color: const Color(0xfff9e9b8),
              offset: Offset(width, -height),
              bottom: -50,
              flareDuration: const Duration(seconds: 12),
              left: 10,
              height: 25,
              width: 25,
            ),
            Flare(
              color: const Color(0xfff9e9b8),
              offset: Offset(width, -height),
              bottom: -40,
              left: -100,
              flareDuration: const Duration(seconds: 18),
              height: 50,
              width: 50,
            ),
            Flare(
              color: const Color(0xfff9e9b8),
              offset: Offset(width, -height),
              bottom: -50,
              left: -80,
              flareDuration: const Duration(seconds: 15),
              height: 50,
              width: 50,
            ),
            Flare(
              color: const Color(0xfff9e9b8),
              offset: Offset(width, -height),
              bottom: -20,
              left: -120,
              flareDuration: const Duration(seconds: 12),
              height: 40,
              width: 40,
            ),
          ],
        ],
      )),
    );
  }
}
