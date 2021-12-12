import 'package:al_quran/dark_mode_controller/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.02,
      left: MediaQuery.of(context).size.width * 0.02,
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () => Navigator.pop(context),
        splashColor: const Color(0xff04364f),
        iconSize: MediaQuery.of(context).size.height * 0.035,
        tooltip: 'Back Button',
        color: Provider.of<DarkThemeProvider>(context).darkTheme
            ? Colors.white
            : Colors.black54,
      ),
    );
  }
}
