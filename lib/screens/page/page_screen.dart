part of '../surah/surah_index_screen.dart';

class PageScreen extends StatelessWidget {
  final Juz? juz;
  final Chapter? chapter;
  const PageScreen({
    Key? key,
    this.chapter,
    this.juz,
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
                data: chapter ??
                    Chapter(
                      englishName: 'Juz No. ${juz!.number}',
                      englishNameTranslation:
                          'بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
                      name: JuzUtils.juzNames[(juz!.number! - 1)],
                    ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final verse = chapter == null
                      ? juz!.ayahs![index]
                      : chapter!.ayahs![index];

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
                          verse!.text!,
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
                childCount: chapter == null
                    ? juz!.ayahs!.length
                    : chapter!.ayahs!.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
