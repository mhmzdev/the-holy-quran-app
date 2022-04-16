import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:al_quran/providers/app_provider.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

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
        iconSize: MediaQuery.of(context).size.height * 0.035,
        tooltip: 'Back Button',
        color: Provider.of<AppProvider>(context).isDark
            ? Colors.white
            : Colors.black54,
      ),
    );
  }
}
