part of '../surah/surah_index_screen.dart';

class PageScreen extends StatefulWidget {
  final Juz? juz;
  final Chapter? chapter;
  const PageScreen({
    Key? key,
    this.chapter,
    this.juz,
  }) : super(key: key);

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  @override
  void initState() {
    final bookmarkCubit = BookmarkCubit.cubit(context);
    if (widget.chapter != null) {
      bookmarkCubit.checkBookmarked(widget.chapter!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final bookmarkCubit = BookmarkCubit.cubit(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              actions: [
                if (widget.juz == null)
                  BlocBuilder<BookmarkCubit, BookmarkState>(
                    builder: (context, state) {
                      return IconButton(
                        onPressed: () {
                          if (bookmarkCubit.state.isBookmarked!) {
                            bookmarkCubit.updateBookmark(
                                widget.chapter!, false);
                          } else {
                            bookmarkCubit.updateBookmark(widget.chapter!, true);
                          }
                        },
                        icon: Icon(
                          bookmarkCubit.state.isBookmarked!
                              ? Icons.bookmark_added
                              : Icons.bookmark_add_outlined,
                          color:
                              Provider.of<DarkThemeProvider>(context).darkTheme
                                  ? Colors.white
                                  : Colors.black54,
                        ),
                      );
                    },
                  ),
              ],
              leading: BackButton(
                color: themeChange.darkTheme ? Colors.white : Colors.black54,
              ),
              backgroundColor:
                  themeChange.darkTheme ? Colors.grey[850] : Colors.white,
              pinned: true,
              floating: true,
              expandedHeight: height * 0.27,
              flexibleSpace: _SurahAppBar(
                data: widget.chapter ??
                    Chapter(
                      englishName: 'Juz No. ${widget.juz!.number}',
                      englishNameTranslation:
                          'بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
                      name: JuzUtils.juzNames[(widget.juz!.number! - 1)],
                    ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final verse = widget.chapter == null
                      ? widget.juz!.ayahs![index]
                      : widget.chapter!.ayahs![index];

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
                childCount: widget.chapter == null
                    ? widget.juz!.ayahs!.length
                    : widget.chapter!.ayahs!.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
