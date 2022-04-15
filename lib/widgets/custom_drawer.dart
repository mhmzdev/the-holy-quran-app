import 'package:al_quran/widgets/app_version.dart';
import 'package:al_quran/widgets/drawer_app_name.dart';
import 'package:al_quran/providers/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
              const DrawerAppName(),
              // Column(
              //   children: _items
              //       .map(
              //         (tile) => Card(
              //           color: themeChange.darkTheme
              //               ? Colors.grey[700]
              //               : Colors.white,
              //           child: ListTile(
              //             leading: Icon(tile.iconData),
              //             title: Text(tile.title!),
              //             onTap: () => Navigator.pushNamed(
              //               context,
              //               tile.route!,
              //             ),
              //           ),
              //         ),
              //       )
              //       .toList(),
              // ),
              const AppVersion()
            ],
          ),
        ),
      ),
    );
  }
}
