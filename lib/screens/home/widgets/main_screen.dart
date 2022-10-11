part of '../home_screen.dart';

class _MainScreen extends StatelessWidget {
  const _MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final appProvider = Provider.of<AppProvider>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      color: appProvider.isDark ? Colors.grey[850] : Colors.white,
      child: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            const AppName(),
            const Calligraphy(),
            const QuranRail(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Space.y1!,
                  AppButton(
                    title: 'Surah Index',
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.surah),
                  ),
                  Space.y1!,
                  AppButton(
                    title: 'Juzz Index',
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.juz),
                  ),
                  Space.y1!,
                  AppButton(
                    title: 'Bookmarks',
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.bookmarks),
                  ),
                ],
              ),
            ),
            const _AyahBottom(),
          ],
        ),
      ),
    );
  }
}
