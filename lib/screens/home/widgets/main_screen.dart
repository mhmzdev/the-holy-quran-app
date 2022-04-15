part of '../home_screen.dart';

class _MainScreen extends StatelessWidget {
  const _MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      color: themeChange.darkTheme ? Colors.grey[800] : Colors.white,
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
                _CustomButton(
                  title: 'Qur\'an',
                  onPressed: () {},
                ),
                Space.y1!,
                _CustomButton(
                  title: 'Surah Index',
                  onPressed: () => Navigator.pushNamed(context, '/surahIndex'),
                ),
                Space.y1!,
                _CustomButton(
                  title: 'Juzz Index',
                  onPressed: () => Navigator.pushNamed(context, '/juzIndex'),
                ),
              ],
            ),
          ),
          const _AyahBottom(),
        ],
      ),
    );
  }
}
