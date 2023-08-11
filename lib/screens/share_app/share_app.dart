import 'package:al_quran/configs/app.dart';
import 'package:al_quran/configs/app_theme.dart';
import 'package:al_quran/providers/app_provider.dart';
import 'package:al_quran/utils/assets.dart';
import 'package:al_quran/widgets/app/app_version.dart';
import 'package:al_quran/widgets/button/app_back_button.dart';
import 'package:al_quran/widgets/app/title.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

part 'widgets/share_custom_button.dart';

class ShareAppScreen extends StatelessWidget {
  const ShareAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return const Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            AppBackButton(),
            CustomTitle(title: 'Share App'),
            ShareInfo()
          ],
        ),
      ),
    );
  }
}

class ShareInfo extends StatelessWidget {
  const ShareInfo({Key? key}) : super(key: key);

  void share(BuildContext context) {
    final RenderBox box = context.findRenderObject() as RenderBox;

    Share.share(
        "Download the latest no-Ads Holy Qur'an App on Play store\n\n"
        "https://play.google.com/store/apps/details?id=com.hmz.al_quran \n\nShare More! It is Sadaq-e-Jaria :)",
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: height * 0.13),
          Image.asset(StaticAssets.gradLogo, height: height * 0.2),
          SizedBox(height: height * 0.02),
          Text(
              "The Holy Qur'an App is also available as Open Source on GitHub!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall),
          SizedBox(height: height * 0.05),
          _ShareCustomButton(
            iconData: Iconsax.share,
            text: 'Share App',
            onPressed: () => share(context),
          ),
          _ShareCustomButton(
            iconData: Iconsax.code,
            text: 'GitHub Repo',
            onPressed: () => launchUrl(
                Uri.parse("https://github.com/mhmzdev/The_Holy_Quran_App")),
          ),
          _ShareCustomButton(
            iconData: Iconsax.message,
            text: 'Rate & Feedback',
            onPressed: () => launchUrl(Uri.parse(
                "https://play.google.com/store/apps/details?id=com.hmz.al_quran")),
          ),
          SizedBox(height: height * 0.02),
          const AppVersion()
        ],
      ),
    );
  }
}
