import 'package:al_quran/animations/bottomAnimation.dart';
import 'package:al_quran/controller/quranAPI.dart';
import 'package:al_quran/customWidgets/loadingShimmer.dart';
import 'package:al_quran/darkModeController/darkThemeProvider.dart';
import 'package:al_quran/model/juzz/juz.dart';
import 'package:al_quran/model/juzz/juz_list.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class Juz extends StatefulWidget {
  final int? juzIndex;
  Juz({this.juzIndex});

  @override
  State<Juz> createState() => _JuzState();
}

class _JuzState extends State<Juz> {
  final _hive = Hive.box('data');
  List<JuzAyahs>? _juzAyahs = [];

  @override
  void initState() {
    _getJuzData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            <Widget>[
          SliverAppBar(
            backgroundColor:
                themeChange.darkTheme ? Colors.grey[850] : Colors.white,
            pinned: true,
            expandedHeight: height * 0.23,
            flexibleSpace: CustomFlexibleAppBar(
              juzAyahs: _juzAyahs,
              juzIndex: widget.juzIndex,
            ),
          ),
        ],
        body: _juzAyahs!.length == 0
            ? Center(
                child: LoadingShimmer(
                  text: 'Juz ayahs...',
                ),
              )
            : JuzAyahsBuilder(
                juzAyahs: _juzAyahs,
                juzIndex: widget.juzIndex,
              ),
      ),
    );
  }

  // getting data
  Future<void> _getJuzData() async {
    JuzList? _cacheJuzList = await _hive.get('juzList${widget.juzIndex}');

    if (_cacheJuzList == null || _cacheJuzList.juzAyahs!.isEmpty) {
      JuzList _newJuzList = await QuranAPI.getJuzz(widget.juzIndex);

      setState(() {
        _juzAyahs = _newJuzList.juzAyahs;
      });
    } else {
      setState(() {
        _juzAyahs = _cacheJuzList.juzAyahs;
      });
    }
  }
}

class JuzAyahsBuilder extends StatelessWidget {
  final List<JuzAyahs>? juzAyahs;
  final int? juzIndex;
  const JuzAyahsBuilder({
    Key? key,
    required this.juzAyahs,
    required this.juzIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuranAPI.getJuzz(juzIndex);
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: juzAyahs!.length,
      itemBuilder: (context, index) {
        return WidgetAnimator(
          ListTile(
            title: Text(juzAyahs![index].ayahsText ?? '',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    color: Colors.black)),
            trailing: CircleAvatar(
              radius: MediaQuery.of(context).size.height * 0.018,
              backgroundColor: Color(0xff04364f),
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.height * 0.017,
                backgroundColor: Colors.white,
                child: Text(
                  juzAyahs![index].ayahNumber.toString(),
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.0135,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomFlexibleAppBar extends StatelessWidget {
  final List<JuzAyahs>? juzAyahs;
  final int? juzIndex;
  const CustomFlexibleAppBar({
    Key? key,
    required this.juzAyahs,
    required this.juzIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      centerTitle: true,
      title: Text(
        "Juzz No. $juzIndex",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.height * 0.03,
        ),
      ),
      background: Stack(
        children: <Widget>[
          QuranImage(),
          InforAppBar(
            juzAyahs: juzAyahs,
            juzIndex: juzIndex,
          )
        ],
      ),
    );
  }
}

class InforAppBar extends StatelessWidget {
  final List<JuzAyahs>? juzAyahs;
  final int? juzIndex;
  const InforAppBar({
    Key? key,
    required this.juzAyahs,
    required this.juzIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Starting Surah"),
          juzAyahs!.length == 0
              ? Text('')
              : Text(
                  juzAyahs![juzIndex!].surahName ?? '',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.045),
                ),
        ],
      ),
    );
  }
}

class QuranImage extends StatelessWidget {
  const QuranImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Opacity(
        opacity: 0.3,
        child: Image.asset(
          'assets/quranRail.png',
          height: MediaQuery.of(context).size.height * 0.4,
        ),
      ),
    );
  }
}
