import 'package:al_quran/animations/bottomAnimation.dart';
import 'package:al_quran/controller/quranAPI.dart';
import 'package:al_quran/customWidgets/loadingShimmer.dart';
import 'package:al_quran/darkModeController/darkThemeProvider.dart';
import 'package:al_quran/model/juzModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Juz extends StatelessWidget {
  final int? juzIndex;
  Juz({this.juzIndex});

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
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                height: height * 0.7,
                width: width,
                child: futureBuilderUsage(height)),
          )
        ],
      ),
    );
  }

  Widget futureBuilderUsage(double height) {
    return FutureBuilder<JuzModel>(
      future: QuranAPI().getJuzz(juzIndex),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingShimmer(text: "Ayahs");
        } else if (snapshot.hasError || (snapshot.hasData == null)) {
          return Center(
              child: Text("Connectivity Error! Please Check your Connection"));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.juzAyahs!.length,
            itemBuilder: (context, index) {
              return WidgetAnimator(
                ListTile(
                    title: Text(snapshot.data!.juzAyahs![index].ayahsText ?? '',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: height * 0.03, color: Colors.black)),
                    trailing: CircleAvatar(
                      radius: height * 0.018,
                      backgroundColor: Color(0xff04364f),
                      child: CircleAvatar(
                        radius: height * 0.017,
                        backgroundColor: Colors.white,
                        child: Text(
                          snapshot.data!.juzAyahs![index].ayahNumber.toString(),
                          style: TextStyle(fontSize: height * 0.0135),
                        ),
                      ),
                    )),
              );
            },
          );
        }
      },
    );
  }

  Widget flexibleAppBar(BuildContext context, double width, double height) {
    return FlexibleSpaceBar(
      centerTitle: true,
      title: Text("Juzz No. $juzIndex",
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: height * 0.045)),
      background: Stack(
        children: <Widget>[
          quranImageAppBar(height),
          infoInAppBar(context),
        ],
      ),
    );
  }

  Widget infoInAppBar(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Starting Surah"),
          FutureBuilder<JuzModel>(
            future: QuranAPI().getJuzz(juzIndex),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('');
              } else {
                return Text(snapshot.data!.juzAyahs![juzIndex!].surahName ?? '',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.045));
              }
            },
          ),
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
}
