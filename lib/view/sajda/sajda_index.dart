import 'package:al_quran/animations/bottom_animation.dart';
import 'package:al_quran/controller/quran_controller.dart';
import 'package:al_quran/widgets/back_btn.dart';
import 'package:al_quran/widgets/custom_image.dart';
import 'package:al_quran/widgets/flare.dart';
import 'package:al_quran/widgets/loading_shimmer.dart';
import 'package:al_quran/widgets/title.dart';
import 'package:al_quran/dark_mode_controller/theme_provider.dart';
import 'package:al_quran/model/sajda/sajda.dart';
import 'package:al_quran/model/sajda/sajda_list.dart';
import 'package:al_quran/view/sajda/sajda.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class Sajda extends StatefulWidget {
  const Sajda({Key? key}) : super(key: key);

  @override
  State<Sajda> createState() => _SajdaState();
}

class _SajdaState extends State<Sajda> {
  final _hive = Hive.box('data');
  List<SajdaAyat>? _sajdas = [];

  @override
  void initState() {
    _getSajdaData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _sajdas!.isEmpty
                ? const LoadingShimmer(
                    text: "Sajdas",
                  )
                : Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, MediaQuery.of(context).size.height * 0.22, 0, 0),
                    child: ListView.separated(
                      itemCount: _sajdas!.length,
                      separatorBuilder: (context, index) => const Divider(
                        color: Color(0xffee8f8b),
                        height: 2.0,
                      ),
                      itemBuilder: (context, index) {
                        return WidgetAnimator(
                          child: ListTile(
                            onLongPress: () => _sajdaInfoBox(index),
                            leading: Text(
                              "${_sajdas![index].sajdaNumber}",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            title: Text(
                              "${_sajdas![index].surahEnglishName}",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            subtitle: Text(
                              "${_sajdas![index].englishNameTranslation}",
                            ),
                            trailing: Text(
                              "${_sajdas![index].surahName}",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SajdaAyah(
                                    surahName: _sajdas![index].surahName,
                                    surahEnglishName:
                                        _sajdas![index].surahEnglishName,
                                    englishNameTranslation:
                                        _sajdas![index].englishNameTranslation,
                                    juz: _sajdas![index].juzNumber,
                                    manzil: _sajdas![index].manzilNumber,
                                    ruku: _sajdas![index].rukuNumber,
                                    sajdaAyahs: _sajdas![index].text,
                                    sajdaNumber: _sajdas![index].sajdaNumber,
                                    revelationType:
                                        _sajdas![index].revelationType,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
            const BackBtn(),
            const CustomTitle(
              title: "Sajda Index",
            ),
            CustomImage(
              opacity: 0.3,
              height: height * 0.2,
              imagePath: 'assets/roza.png',
            ),
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
        ),
      ),
    );
  }

  // gettin data
  Future<void> _getSajdaData() async {
    SajdaList? _cacheSajdaList = await _hive.get('sajdaList');

    if (_cacheSajdaList == null || _cacheSajdaList.sajdaAyahs!.isEmpty) {
      SajdaList _newSajdaList = await QuranAPI.getSajda();

      if (mounted) {
        setState(() {
          _sajdas = _newSajdaList.sajdaAyahs;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          _sajdas = _cacheSajdaList.sajdaAyahs;
        });
      }
    }
  }

  void _sajdaInfoBox(int index) {
    showDialog(
      context: context,
      builder: (_) => SajdaInformation(
        juzNumber: _sajdas![index].juzNumber,
        rukuNumber: _sajdas![index].rukuNumber,
        sajdaNumber: _sajdas![index].sajdaNumber,
        surahName: _sajdas![index].surahName,
        surahEnglishName: _sajdas![index].surahEnglishName,
        englishNameTranslation: _sajdas![index].englishNameTranslation,
        revelationType: _sajdas![index].revelationType,
      ),
    );
  }
}

class SajdaInformation extends StatefulWidget {
  final int? sajdaNumber;
  final String? surahName;
  final String? surahEnglishName;
  final String? englishNameTranslation;
  final int? juzNumber;
  final int? rukuNumber;
  final String? revelationType;

  const SajdaInformation(
      {Key? key,
      this.surahName,
      this.sajdaNumber,
      this.juzNumber,
      this.rukuNumber,
      this.surahEnglishName,
      this.englishNameTranslation,
      this.revelationType})
      : super(key: key);

  @override
  _SajdaInformationState createState() => _SajdaInformationState();
}

class _SajdaInformationState extends State<SajdaInformation>
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
            height: height * 0.39,
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
                  "Sajda Information",
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.surahEnglishName!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      widget.surahName!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                Text("Sajda Number: ${widget.sajdaNumber}"),
                Text("Juz Number: ${widget.juzNumber}"),
                Text("Ruku Number: ${widget.rukuNumber}"),
                Text("Meaning: ${widget.englishNameTranslation}"),
                Text("Chapter Type: ${widget.revelationType}"),
                SizedBox(
                  height: height * 0.025,
                ),
                SizedBox(
                  height: height * 0.05,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
