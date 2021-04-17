import 'package:al_quran/darkModeController/darkThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerAppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Transform.scale(
              scale: 1.5,
              child: Switch(
                inactiveThumbImage: NetworkImage(
                  "https://user-images.githubusercontent.com/43790152/115108144-419b5680-9f88-11eb-82ea-8ee1af979fa4.png",
                ),
                activeThumbImage: NetworkImage(
                  "https://user-images.githubusercontent.com/43790152/115108339-6217e080-9f89-11eb-9869-92dbf8e1476f.png",
                ),
                activeColor: Colors.grey[900],
                value: themeChange.darkTheme,
                onChanged: (value) {
                  themeChange.darkTheme = value;
                },
              ),
            ),
            Text(
              "\nThe",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: height * 0.025,
                color:
                    themeChange.darkTheme ? Colors.grey[200] : Colors.black54,
              ),
            ),
            Text(
              "Holy\nQur'an",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color:
                    themeChange.darkTheme ? Colors.grey[200] : Colors.black54,
                fontSize: height * 0.035,
              ),
            )
          ],
        ),
        Image.asset('assets/grad_logo.png', height: height * 0.17)
      ],
    );
  }
}
