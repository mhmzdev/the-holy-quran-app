import 'package:al_quran/customWidgets/appVersion.dart';
import 'package:al_quran/customWidgets/drawerAppName.dart';
import 'package:al_quran/darkModeController/darkThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  myListTile(
    BuildContext context,
    double height,
    IconData tileIcon,
    String title,
    String pushName,
    Color? color,
  ) {
    return Card(
      color: color,
      child: ListTile(
        leading: Icon(tileIcon, size: height * 0.035),
        title: Text(title),
        onTap: () => Navigator.pushNamed(context, pushName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width * 0.835,
      height: height,
      child: Material(
        color: themeChange.darkTheme ? Colors.grey[800] : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DrawerAppName(),
              Column(
                children: <Widget>[
                  myListTile(
                    context,
                    height,
                    Icons.format_list_bulleted,
                    "Juzz Index",
                    "/juzzIndex",
                    themeChange.darkTheme ? Colors.grey[700] : Colors.white,
                  ),
                  myListTile(
                    context,
                    height,
                    Icons.format_list_numbered,
                    "Surah Index",
                    "/surahIndex",
                    themeChange.darkTheme ? Colors.grey[700] : Colors.white,
                  ),
                  myListTile(
                    context,
                    height,
                    Icons.format_align_left,
                    "Sajda Index",
                    "/sajda",
                    themeChange.darkTheme ? Colors.grey[700] : Colors.white,
                  ),
                  myListTile(
                    context,
                    height,
                    Icons.help,
                    "Help Guide",
                    "/help",
                    themeChange.darkTheme ? Colors.grey[700] : Colors.white,
                  ),
                  myListTile(
                    context,
                    height,
                    Icons.info,
                    "Introduction",
                    "/introduction",
                    themeChange.darkTheme ? Colors.grey[700] : Colors.white,
                  ),
                  myListTile(
                    context,
                    height,
                    Icons.share,
                    "Share App",
                    "/shareApp",
                    themeChange.darkTheme ? Colors.grey[700] : Colors.white,
                  ),
                ],
              ),
              AppVersion()
            ],
          ),
        ),
      ),
    );
  }
}
