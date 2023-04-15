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
    App.init(context);
    final appProvider = Provider.of<AppProvider>(context);
    final bookmarkCubit = BookmarkCubit.cubit(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appProvider.isDark ? Colors.grey[900] : Colors.white,
      body: SafeArea(
        top: false,
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
                          color: appProvider.isDark
                              ? Colors.white
                              : Colors.black54,
                        ),
                      );
                    },
                  ),
              ],
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Iconsax.arrow_left,
                  color: appProvider.isDark ? Colors.white : Colors.black,
                  size: AppDimensions.normalize(12),
                ),
              ),
              backgroundColor:
                  appProvider.isDark ? Colors.grey[850] : Colors.white,
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
                        contentPadding: Space.h,
                        trailing: CircleAvatar(
                          radius: AppDimensions.normalize(3.2),
                          backgroundColor: const Color(0xff04364f),
                          child: CircleAvatar(
                            radius: AppDimensions.normalize(2.9),
                            backgroundColor: Colors.white,
                            child: Text(
                              (index + 1).toString(),
                              style: AppText.l2!.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          verse!.text!,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'Noor',
                            fontSize: height * 0.0275,
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
            ),
          ],
        ),
      ),
    );
  }
}
