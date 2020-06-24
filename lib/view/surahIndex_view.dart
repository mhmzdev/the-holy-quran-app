import 'package:al_quran/animations/bottomAnimation.dart';
import 'package:al_quran/controller/quranAPI.dart';
import 'package:al_quran/customWidgets/backBtn.dart';
import 'package:al_quran/customWidgets/flare.dart';
import 'package:al_quran/customWidgets/loadingShimmer.dart';
import 'package:al_quran/view/ayahs_view.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SurahIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
      children: <Widget>[
        FutureBuilder(
          future: QuranAPI().getSurahList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingShimmer(
                text: "Surahs",
              );
            } else {
              return Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.fromLTRB(0, height * 0.2, 0, 0),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Color(0xffee8f8b),
                      height: 2.0,
                    );
                  },
                  itemCount: snapshot.data.surahs.length,
                  itemBuilder: (context, index) {
                    return WidgetAnimator(
                      ListTile(
                        leading: Text(
                          "${snapshot.data.surahs[index].number}",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        title: Text(
                          "${snapshot.data.surahs[index].englishName}",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        subtitle: Text(
                            "${snapshot.data.surahs[index].englishNameTranslation}"),
                        trailing: Text(
                          "${snapshot.data.surahs[index].name}",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SurahAyats(
                                        ayatsList:
                                            snapshot.data.surahs[index].ayahs,
                                        surahName:
                                            snapshot.data.surahs[index].name,
                                        surahEnglishName: snapshot
                                            .data.surahs[index].englishName,
                                        englishMeaning: snapshot
                                            .data
                                            .surahs[index]
                                            .englishNameTranslation,
                                      )));
                        },
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
        KaabaImage(),
        BackBtn(),
        Title(),
        Flare(
          color: Color(0xfff9e9b8),
          offset: Offset(width, -height),
          bottom: -50,
          flareDuration: Duration(seconds: 17),
          left: 100,
          height: 60,
          width: 60,
        ),
        Flare(
          color: Color(0xfff9e9b8),
          offset: Offset(width, -height),
          bottom: -50,
          flareDuration: Duration(seconds: 12),
          left: 10,
          height: 25,
          width: 25,
        ),
        Flare(
          color: Color(0xfff9e9b8),
          offset: Offset(width, -height),
          bottom: -40,
          left: -100,
          flareDuration: Duration(seconds: 18),
          height: 50,
          width: 50,
        ),
        Flare(
          color: Color(0xfff9e9b8),
          offset: Offset(width, -height),
          bottom: -50,
          left: -80,
          flareDuration: Duration(seconds: 15),
          height: 50,
          width: 50,
        ),
        Flare(
          color: Color(0xfff9e9b8),
          offset: Offset(width, -height),
          bottom: -20,
          left: -120,
          flareDuration: Duration(seconds: 12),
          height: 40,
          width: 40,
        ),
      ],
    ));
  }
}

class KaabaImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.3,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Image.asset(
          'assets/kaaba.png',
          height: MediaQuery.of(context).size.height * 0.2,
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 90,
      left: 30,
      child: Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Colors.grey,
        enabled: true,
        child: Text(
          "Surah Index",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
