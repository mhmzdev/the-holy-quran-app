import 'package:al_quran/widgets/app_version.dart';
import 'package:al_quran/widgets/back_btn.dart';
import 'package:al_quran/widgets/title.dart';
import 'package:al_quran/dark_mode_controller/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:al_quran/share_icon_icons.dart';

class ShareApp extends StatelessWidget {
  const ShareApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: const <Widget>[
            BackBtn(),
            CustomTitle(
              title: 'Share App',
            ),
            ShareInfo()
          ],
        ),
      ),
    );
  }
}

class ShareInfo extends StatelessWidget {
  const ShareInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: height * 0.13),
          Image.asset('assets/grad_logo.png', height: height * 0.2),
          SizedBox(height: height * 0.02),
          Text(
              "The Holy Qur'an App is also available as Open Source on GitHub!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption),
          SizedBox(height: height * 0.05),
          const ShareCustomBtns(
            iconData: ShareIcon.github,
            text: 'GitHub Repo',
            url: "https://github.com/mhmzdev/The_Holy_Quran_App",
          ),
          const ShareAppBtn(),
          const ShareCustomBtns(
            iconData: ShareIcon.googlePlay,
            text: 'Rate & Feedback',
            url:
                "https://play.google.com/store/apps/details?id=com.hmz.al_quran",
          ),
          SizedBox(height: height * 0.02),
          const AppVersion()
        ],
      ),
    );
  }
}

class ShareCustomBtns extends StatelessWidget {
  final String? text;
  final IconData? iconData;
  final String? url;
  const ShareCustomBtns({
    Key? key,
    required this.iconData,
    required this.text,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.055,
        child: ElevatedButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                iconData,
                size: MediaQuery.of(context).size.height * 0.03,
                color: Provider.of<DarkThemeProvider>(context).darkTheme
                    ? Colors.black
                    : Colors.white,
              ),
              Text(
                "  $text",
                style: TextStyle(
                  color: Provider.of<DarkThemeProvider>(context).darkTheme
                      ? Colors.black
                      : Colors.white,
                ),
              )
            ],
          ),
          onPressed: () => launch("$url"),
        ),
      ),
    );
  }
}

class ShareAppBtn extends StatefulWidget {
  const ShareAppBtn({Key? key}) : super(key: key);

  @override
  _ShareAppBtnState createState() => _ShareAppBtnState();
}

class _ShareAppBtnState extends State<ShareAppBtn> {
  String text = "Download the latest no-Ads Holy Qur'an App on Play store\n\n"
      "https://play.google.com/store/apps/details?id=com.hmz.al_quran \n\nShare More! It is Sadaq-e-Jaria :)";

  void share(BuildContext context) {
    final RenderBox box = context.findRenderObject() as RenderBox;

    Share.share(text,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.055,
        child: ElevatedButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.share,
                  size: MediaQuery.of(context).size.height * 0.03,
                  color: Provider.of<DarkThemeProvider>(context).darkTheme
                      ? Colors.black
                      : Colors.white,
                ),
                Text(
                  "  Invite Friends",
                  style: TextStyle(
                    color: Provider.of<DarkThemeProvider>(context).darkTheme
                        ? Colors.black
                        : Colors.white,
                  ),
                )
              ],
            ),
            onPressed: () => share(context)),
      ),
    );
  }
}
