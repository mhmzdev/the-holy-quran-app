import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:al_quran/providers/theme/theme_provider.dart';

class JuzScreen extends StatefulWidget {
  final int? juzIndex;
  const JuzScreen({Key? key, this.juzIndex}) : super(key: key);

  @override
  State<JuzScreen> createState() => _JuzScreenState();
}

class _JuzScreenState extends State<JuzScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
