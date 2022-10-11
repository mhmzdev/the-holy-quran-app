part of '../surah_index_screen.dart';

class _SurahAppBar extends StatelessWidget {
  final Chapter? data;
  const _SurahAppBar({
    Key? key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      centerTitle: true,
      title: Text(
        data!.englishName!,
        style: AppText.b2b,
      ),
      background: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomRight,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                StaticAssets.quranRail,
                height: AppDimensions.normalize(60),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  data!.englishNameTranslation!,
                ),
                Space.y1!,
                Text(
                  data!.name!,
                  style: AppText.h1b!.copyWith(
                    fontFamily: 'Noor',
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
