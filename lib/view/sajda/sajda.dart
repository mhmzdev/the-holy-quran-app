import 'package:al_quran/animations/bottom_animation.dart';
import 'package:al_quran/dark_mode_controller/theme_provider.dart';
import 'package:al_quran/view/juzz/juz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class SajdaAyah extends StatelessWidget {
  final String? sajdaAyahs;
  final int? juz;
  final int? ruku;
  final int? manzil;
  final int? sajdaNumber;
  final String? surahName;
  final String? surahEnglishName;
  final String? englishNameTranslation;
  final String? revelationType;

  const SajdaAyah(
      {Key? key,
      this.sajdaAyahs,
      this.revelationType,
      this.juz,
      this.ruku,
      this.manzil,
      this.sajdaNumber,
      this.surahEnglishName,
      this.englishNameTranslation,
      this.surahName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            <Widget>[
          SliverAppBar(
            leading: BackButton(
              color: themeChange.darkTheme ? Colors.white : Colors.black54,
            ),
            backgroundColor:
                themeChange.darkTheme ? Colors.grey[850] : Colors.white,
            pinned: true,
            expandedHeight: height * 0.27,
            flexibleSpace: CustomFlexibleAppBar(
              surahName: surahName,
              surahEnglishName: surahEnglishName,
              englishNameTranslation: englishNameTranslation,
            ),
          ),
        ],
        body: Container(
          padding: const EdgeInsets.all(5.0),
          width: width,
          height: height * 0.692,
          child: Stack(
            children: <Widget>[
              const SajdaImage(),
              Column(
                children: <Widget>[
                  SizedBox(height: height * 0.05),
                  Text(
                    "Sajda Ayah",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: height * 0.03,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Sajda(
                    ayah: sajdaAyahs,
                    index: sajdaNumber,
                  ),
                  SizedBox(height: height * 0.03),
                  SajdaInformation(
                    juz: juz,
                    ruku: ruku,
                    revelationType: revelationType,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomFlexibleAppBar extends StatelessWidget {
  final String? surahName;
  final String? surahEnglishName;
  final String? englishNameTranslation;
  const CustomFlexibleAppBar({
    Key? key,
    required this.surahName,
    required this.surahEnglishName,
    required this.englishNameTranslation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      centerTitle: true,
      title: Text(
        surahEnglishName!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.height * 0.03,
        ),
      ),
      background: Stack(
        children: <Widget>[
          const QuranImage(),
          InfoAppBar(
            englishNameTranslation: englishNameTranslation,
            surahName: surahName,
          )
        ],
      ),
    );
  }
}

class InfoAppBar extends StatelessWidget {
  final String? englishNameTranslation;
  final String? surahName;
  const InfoAppBar({
    Key? key,
    required this.englishNameTranslation,
    required this.surahName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(englishNameTranslation!),
          Text(
            surahName!,
            style: Theme.of(context).textTheme.headline1,
          )
        ],
      ),
    );
  }
}

class Sajda extends StatelessWidget {
  final int? index;
  final String? ayah;
  const Sajda({
    Key? key,
    required this.ayah,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetAnimator(
      child: ListTile(
        trailing: CircleAvatar(
          radius: MediaQuery.of(context).size.height * 0.013,
          backgroundColor: const Color(0xff04364f),
          child: CircleAvatar(
              radius: MediaQuery.of(context).size.height * 0.012,
              backgroundColor: Colors.white,
              child: Text(
                index.toString(),
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.015,
                ),
              )),
        ),
        title: Text(
          ayah!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.03,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class SajdaInformation extends StatelessWidget {
  final int? juz;
  final int? ruku;
  final String? revelationType;
  const SajdaInformation({
    Key? key,
    required this.juz,
    required this.ruku,
    required this.revelationType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: Colors.grey,
      enabled: true,
      child: Column(
        children: <Widget>[
          const Text(
            "--- Sajda Info ---\n",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          InfoText(leading: 'Juz', info: juz.toString()),
          InfoText(leading: 'Ruku', info: ruku.toString()),
          InfoText(leading: 'Chapter', info: revelationType)
        ],
      ),
    );
  }
}

class InfoText extends StatelessWidget {
  final String? leading;
  final String? info;
  const InfoText({
    Key? key,
    required this.leading,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          leading! + ": ",
          style: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.height * 0.025,
          ),
        ),
        Text(
          info!,
          style: TextStyle(
              color: Colors.black87,
              fontSize: MediaQuery.of(context).size.height * 0.025,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class SajdaImage extends StatelessWidget {
  const SajdaImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Align(
      alignment: Alignment.bottomRight,
      child: Opacity(
        opacity: 0.15,
        child: Image.asset(
          'assets/sajda.jpg',
          height: height * 0.35,
        ),
      ),
    );
  }
}
