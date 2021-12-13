import 'package:al_quran/animations/bottom_animation.dart';
import 'package:al_quran/controller/quran_controller.dart';
import 'package:al_quran/widgets/back_btn.dart';
import 'package:al_quran/widgets/custom_image.dart';
import 'package:al_quran/widgets/flare.dart';
import 'package:al_quran/widgets/loading_shimmer.dart';
import 'package:al_quran/widgets/title.dart';
import 'package:al_quran/dark_mode_controller/theme_provider.dart';
import 'package:al_quran/model/surah/surah.dart';
import 'package:al_quran/model/surah/surah_list.dart';
import 'package:al_quran/view/surahas/surah.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class SurahIndex extends StatefulWidget {
  const SurahIndex({Key? key}) : super(key: key);

  @override
  State<SurahIndex> createState() => _SurahIndexState();
}

class _SurahIndexState extends State<SurahIndex> {
  final _hiveBox = Hive.box('data');
  List<Surah>? _surahs = [];

  @override
  void initState() {
    _getSurahData();
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
          _surahs!.isEmpty
              ? const Center(
                  child: LoadingShimmer(
                    text: "Surahs",
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.22,
                  ),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Color(0xffee8f8b),
                        height: 2.0,
                      );
                    },
                    itemCount: _surahs!.length,
                    itemBuilder: (context, index) {
                      return WidgetAnimator(
                        child: ListTile(
                          onLongPress: () => _surahInforBox(index),
                          leading: Text(
                            "${_surahs![index].number}",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          title: Text(
                            "${_surahs![index].englishName}",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          subtitle:
                              Text("${_surahs![index].englishNameTranslation}"),
                          trailing: Text(
                            "${_surahs![index].name}",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SurahAyats(
                                  ayatsList: _surahs![index].ayahs,
                                  surahName: _surahs![index].name,
                                  surahEnglishName: _surahs![index].englishName,
                                  englishMeaning:
                                      _surahs![index].englishNameTranslation,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
          CustomImage(
            opacity: 0.3,
            height: height * 0.17,
            imagePath: 'assets/kaba.png',
          ),
          const BackBtn(),
          const CustomTitle(
            title: "Surah Index",
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
      ),
    ));
  }

  void _surahInforBox(int index) {
    showDialog(
      context: context,
      builder: (context) => SurahInformation(
        surahNumber: _surahs![index].number,
        arabicName: "${_surahs![index].name}",
        englishName: "${_surahs![index].englishName}",
        ayahs: _surahs![index].ayahs!.length,
        revelationType: "${_surahs![index].revelationType}",
        englishNameTranslation: "${_surahs![index].englishNameTranslation}",
      ),
    );
  }

  // getting data
  Future<void> _getSurahData() async {
    SurahsList? _cacheSurahList = await _hiveBox.get('surahList');
    if (_cacheSurahList == null || _cacheSurahList.surahs!.isEmpty) {
      SurahsList _newSurahsList = await QuranAPI.getSurahList();
      if (mounted) {
        setState(() {
          _surahs = _newSurahsList.surahs;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          _surahs = _cacheSurahList.surahs;
        });
      }
    }
  }
}

class SurahInformation extends StatefulWidget {
  final int? surahNumber;
  final String? arabicName;
  final String? englishName;
  final String? englishNameTranslation;
  final int? ayahs;
  final String? revelationType;

  const SurahInformation(
      {Key? key,
      this.arabicName,
      this.surahNumber,
      this.ayahs,
      this.englishName,
      this.englishNameTranslation,
      this.revelationType})
      : super(key: key);

  @override
  _SurahInformationState createState() => _SurahInformationState();
}

class _SurahInformationState extends State<SurahInformation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ScaleTransition(
      scale: scaleAnimation,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
            width: width * 0.75,
            height: height * 0.37,
            decoration: ShapeDecoration(
              color: themeChange.darkTheme ? Colors.grey[800] : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Surah Information",
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.englishName!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      widget.arabicName!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                Text("Ayahs: ${widget.ayahs}"),
                Text("Surah Number: ${widget.surahNumber}"),
                Text("Chapter: ${widget.revelationType}"),
                Text("Meaning: ${widget.englishNameTranslation}"),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  height: height * 0.05,
                  child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("OK")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
