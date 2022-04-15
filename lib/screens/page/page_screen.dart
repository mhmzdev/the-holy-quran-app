part of '../surah/surah_index_screen.dart';

class PageScreen extends StatelessWidget {
  final Chapter? chapter;
  final ChapterData? data;
  final int? juzNumber;
  const PageScreen({
    Key? key,
    this.data,
    this.chapter,
    this.juzNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: BackButton(
              color: themeChange.darkTheme ? Colors.white : Colors.black54,
            ),
            backgroundColor:
                themeChange.darkTheme ? Colors.grey[850] : Colors.white,
            pinned: true,
            floating: true,
            expandedHeight: height * 0.27,
            flexibleSpace: _SurahAppBar(
              data: data ??
                  ChapterData(
                    nameSimple: 'Juz No. $juzNumber',
                    translatedName: 'بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
                    nameArabic: JuzUtils.juzNames[(juzNumber! - 1)],
                  ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final verse = chapter!.verses![index];

                return Padding(
                  padding: EdgeInsets.fromLTRB(width * 0.015, 0, 0, 0),
                  child: WidgetAnimator(
                    child: ListTile(
                      trailing: CircleAvatar(
                        radius: AppDimensions.normalize(4),
                        backgroundColor: const Color(0xff04364f),
                        child: CircleAvatar(
                          radius: AppDimensions.normalize(3.5),
                          backgroundColor: Colors.white,
                          child: Text(
                            (index + 1).toString(),
                            style: AppText.l1,
                          ),
                        ),
                      ),
                      title: Text(
                        verse!.textIndopak!,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: height * 0.03,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: chapter!.verses!.length,
            ),
          )
        ],
      )),
    );
  }
}
