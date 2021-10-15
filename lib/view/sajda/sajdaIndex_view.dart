import 'package:al_quran/animations/bottomAnimation.dart';
import 'package:al_quran/controller/quranAPI.dart';
import 'package:al_quran/customWidgets/backBtn.dart';
import 'package:al_quran/customWidgets/customImagePos.dart';
import 'package:al_quran/customWidgets/flare.dart';
import 'package:al_quran/customWidgets/loadingShimmer.dart';
import 'package:al_quran/customWidgets/title.dart';
import 'package:al_quran/darkModeController/darkThemeProvider.dart';
import 'package:al_quran/view/sajda/sajdaAyahs_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sajda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            FutureBuilder(
              future: QuranAPI().getSajda(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingShimmer(
                    text: "Sajdas",
                  );
                } else if (snapshot.hasData == null) {
                  return Center(
                      child: Text(
                          "Connectivity Error! Please Check your Connection"));
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    "Something went wrong on our side!\nWe are trying to reconnect :)",
                    textAlign: TextAlign.center,
                  ));
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.fromLTRB(0, height * 0.2, 0, 0),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Color(0xffee8f8b),
                          height: 2.0,
                        );
                      },
                      itemCount: snapshot.data.sajdaAyahs.length,
                      itemBuilder: (context, index) {
                        return WidgetAnimator(
                          ListTile(
                            onLongPress: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => new SajdaInformation(
                                        juzNumber: snapshot
                                            .data.sajdaAyahs[index].juzNumber,
                                        rukuNumber: snapshot
                                            .data.sajdaAyahs[index].rukuNumber,
                                        sajdaNumber: snapshot
                                            .data.sajdaAyahs[index].sajdaNumber,
                                        surahName: snapshot
                                            .data.sajdaAyahs[index].surahName,
                                        surahEnglishName: snapshot.data
                                            .sajdaAyahs[index].surahEnglishName,
                                        englishNameTranslation: snapshot
                                            .data
                                            .sajdaAyahs[index]
                                            .englishNameTranslation,
                                        revelationType: snapshot.data
                                            .sajdaAyahs[index].revelationType,
                                      ));
                            },
                            leading: Text(
                              "${snapshot.data.sajdaAyahs[index].sajdaNumber}",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            title: Text(
                              "${snapshot.data.sajdaAyahs[index].surahEnglishName}",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            subtitle: Text(
                              "${snapshot.data.sajdaAyahs[index].englishNameTranslation}",
                            ),
                            trailing: Text(
                              "${snapshot.data.sajdaAyahs[index].surahName}",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SajdaAyah(
                                            surahName: snapshot.data
                                                .sajdaAyahs[index].surahName,
                                            surahEnglishName: snapshot
                                                .data
                                                .sajdaAyahs[index]
                                                .surahEnglishName,
                                            englishNameTranslation: snapshot
                                                .data
                                                .sajdaAyahs[index]
                                                .englishNameTranslation,
                                            juz: snapshot.data.sajdaAyahs[index]
                                                .juzNumber,
                                            manzil: snapshot.data
                                                .sajdaAyahs[index].manzilNumber,
                                            ruku: snapshot.data
                                                .sajdaAyahs[index].rukuNumber,
                                            sajdaAyahs: snapshot
                                                .data.sajdaAyahs[index].text,
                                            sajdaNumber: snapshot.data
                                                .sajdaAyahs[index].sajdaNumber,
                                            revelationType: snapshot
                                                .data
                                                .sajdaAyahs[index]
                                                .revelationType,
                                          )));
                            },
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                      child:
                          Text("Connectivity Error! Please Try Again Later"));
                }
              },
            ),
            BackBtn(),
            CustomTitle(
              title: "Sajda Index",
            ),
            CustomImage(
                opacity: 0.3,
                height: height * 0.2,
                networkImgURL: 'https://i.ibb.co/68BvR3M/roza.png'),
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
        ),
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

  SajdaInformation(
      {this.surahName,
      this.sajdaNumber,
      this.juzNumber,
      this.rukuNumber,
      this.surahEnglishName,
      this.englishNameTranslation,
      this.revelationType});

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

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
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
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
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
                  child: FlatButton(
                      color: Color(0xffee8f8b),
                      onPressed: () => Navigator.pop(context),
                      child: Text("OK")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
