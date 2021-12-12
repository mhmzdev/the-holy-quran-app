import 'package:al_quran/animations/bottom_animation.dart';
import 'package:al_quran/controller/quran_controller.dart';
import 'package:al_quran/widgets/back_btn.dart';
import 'package:al_quran/widgets/custom_image.dart';
import 'package:al_quran/widgets/flare.dart';
import 'package:al_quran/widgets/title.dart';
import 'package:al_quran/dark_mode_controller/theme_provider.dart';
import 'package:al_quran/view/juzz/juz.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class JuzIndex extends StatefulWidget {
  const JuzIndex({Key? key}) : super(key: key);

  @override
  State<JuzIndex> createState() => _JuzIndexState();
}

class _JuzIndexState extends State<JuzIndex> {
  // hive main box
  final _hive = Hive.box('data');

  // getting all Juz once!
  Future<void> _getAllJuzHiveBox() async {
    bool? _check = await _hive.get('isJuzIndexed');

    // putting values
    if (_check == null || !_check) {
      for (int i = 1; i <= 30; i++) {
        // create box
        await QuranAPI.getJuzz(i);
      }
      await _hive.put('isJuzIndexed', true);
    }
  }

  @override
  void initState() {
    _getAllJuzHiveBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: EdgeInsets.fromLTRB(0, height * 0.2, 0, 0),
            child: GridView.builder(
              itemCount: 30,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                return WidgetAnimator(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Juz(juzIndex: index + 1),
                      ),
                    ),
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
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const BackBtn(),
          CustomImage(
            opacity: 0.3,
            height: height * 0.2,
            imagePath: "assets/quranRail.png",
          ),
          const CustomTitle(
            title: "Juzz Index",
          ),
          themeChange.darkTheme
              ? Flare(
                  color: const Color(0xfff9e9b8),
                  offset: Offset(width, -height),
                  bottom: -50,
                  flareDuration: const Duration(seconds: 17),
                  left: 100,
                  height: 60,
                  width: 60,
                )
              : Container(),
          themeChange.darkTheme
              ? Flare(
                  color: const Color(0xfff9e9b8),
                  offset: Offset(width, -height),
                  bottom: -50,
                  flareDuration: const Duration(seconds: 12),
                  left: 10,
                  height: 25,
                  width: 25,
                )
              : Container(),
          themeChange.darkTheme
              ? Flare(
                  color: const Color(0xfff9e9b8),
                  offset: Offset(width, -height),
                  bottom: -40,
                  left: -100,
                  flareDuration: const Duration(seconds: 18),
                  height: 50,
                  width: 50,
                )
              : Container(),
          themeChange.darkTheme
              ? Flare(
                  color: const Color(0xfff9e9b8),
                  offset: Offset(width, -height),
                  bottom: -50,
                  left: -80,
                  flareDuration: const Duration(seconds: 15),
                  height: 50,
                  width: 50,
                )
              : Container(),
          themeChange.darkTheme
              ? Flare(
                  color: const Color(0xfff9e9b8),
                  offset: Offset(width, -height),
                  bottom: -20,
                  left: -120,
                  flareDuration: const Duration(seconds: 12),
                  height: 40,
                  width: 40,
                )
              : Container(),
        ],
      )),
    );
  }
}
