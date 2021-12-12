import 'package:al_quran/customWidgets/appVersion.dart';
import 'package:al_quran/customWidgets/drawerAppName.dart';
import 'package:al_quran/darkModeController/darkThemeProvider.dart';
import 'package:al_quran/model/utils/drawer_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final List<DrawerListItem> _items = [
    DrawerListItem(
      iconData: Icons.format_list_bulleted,
      title: 'Juz Index',
      route: '/juzIndex',
    ),
    DrawerListItem(
      iconData: Icons.format_list_numbered,
      title: 'Surah Index',
      route: '/surahIndex',
    ),
    DrawerListItem(
      iconData: Icons.format_align_left,
      title: 'Sajda Index',
      route: '/sajda',
    ),
    DrawerListItem(
      iconData: Icons.info,
      title: 'Help Guide',
      route: '/help',
    ),
    DrawerListItem(
      iconData: Icons.book,
      title: 'Introduction',
      route: '/introduction',
    ),
    DrawerListItem(
      iconData: Icons.share,
      title: 'Share App',
      route: '/shareApp',
    ),
  ];

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
                children: _items
                    .map(
                      (tile) => Card(
                        color: themeChange.darkTheme
                            ? Colors.grey[700]
                            : Colors.white,
                        child: ListTile(
                          leading: Icon(tile.iconData),
                          title: Text(tile.title!),
                          onTap: () => Navigator.pushNamed(
                            context,
                            tile.route!,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              AppVersion()
            ],
          ),
        ),
      ),
    );
  }
}
