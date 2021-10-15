import 'package:al_quran/animations/bottomAnimation.dart';
import 'package:al_quran/darkModeController/darkThemeProvider.dart';
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

  SajdaAyah(
      {this.sajdaAyahs,
      this.revelationType,
      this.juz,
      this.ruku,
      this.manzil,
      this.sajdaNumber,
      this.surahEnglishName,
      this.englishNameTranslation,
      this.surahName});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor:
                  themeChange.darkTheme ? Colors.grey[850] : Colors.white,
              pinned: true,
              expandedHeight: height * 0.27,
              flexibleSpace: flexibleAppBar(context, height, width),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(5.0),
                width: width,
                height: height * 0.692,
                child: Stack(
                  children: <Widget>[
                    SajdaImage(),
                    Column(
                      children: <Widget>[
                        SizedBox(height: height * 0.05),
                        Text(
                          "Sajda Ayah",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: height * 0.03,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: height * 0.02),
                        sajda(height, sajdaNumber, sajdaAyahs!),
                        SizedBox(height: height * 0.03),
                        sajdaInfo(ruku, juz, manzil, revelationType,
                            sajdaNumber, context),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget sajda(double height, int? index, String ayahs) {
    return WidgetAnimator(
      ListTile(
        trailing: CircleAvatar(
          radius: height * 0.013,
          backgroundColor: Color(0xff04364f),
          child: CircleAvatar(
              radius: height * 0.012,
              backgroundColor: Colors.white,
              child: Text(
                index.toString(),
                style: TextStyle(fontSize: height * 0.015),
              )),
        ),
        title: Text(ayahs,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: height * 0.03, color: Colors.black)),
      ),
    );
  }

  Widget flexibleAppBar(BuildContext context, double width, double height) {
    return FlexibleSpaceBar(
        centerTitle: true,
        title: Text(surahEnglishName!,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: height * 0.045)),
        background: Stack(
          children: <Widget>[
            quranImageAppBar(height),
            infoInAppBar(context),
          ],
        ));
  }

  Widget infoInAppBar(BuildContext context) {
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

  Widget quranImageAppBar(double height) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Opacity(
          opacity: 0.3,
          child: Image.asset(
            'assets/quranRail.png',
            height: height * 0.4,
          )),
    );
  }

  Widget sajdaInfo(int? ruku, int? juz, int? manzil, String? relevationType,
      int? sajdaIndex, BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: Colors.grey,
      enabled: true,
      child: Column(
        children: <Widget>[
          Text("--- Sajda Info ---\n",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
          infoText("Juz", juz.toString(), context),
          infoText("Ruku", ruku.toString(), context),
          infoText("Chapter", revelationType!, context)
        ],
      ),
    );
  }

  Widget infoText(String leading, String info, BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          leading + ": ",
          style: TextStyle(color: Colors.black, fontSize: height * 0.025),
        ),
        Text(
          info,
          style: TextStyle(
              color: Colors.black87,
              fontSize: height * 0.025,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class SajdaImage extends StatelessWidget {
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
