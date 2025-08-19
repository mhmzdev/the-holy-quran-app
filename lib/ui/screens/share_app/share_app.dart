import 'package:al_quran/configs/app.dart';
import 'package:al_quran/configs/theme/app_theme.dart';
import 'package:al_quran/providers/app_provider.dart';
import 'package:al_quran/ui/widgets/core/screen/screen.dart';
import 'package:al_quran/static/assets.dart';
import 'package:al_quran/ui/widgets/app/app_version.dart';
import 'package:al_quran/ui/widgets/button/app_back_button.dart';
import 'package:al_quran/ui/widgets/app/title.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

part 'widgets/share_custom_button.dart';

class ShareAppScreen extends StatelessWidget {
  const ShareAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return const Screen(
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            AppBackButton(),
            CustomTitle(title: 'Share App'),
            ShareInfo(),
          ],
        ),
      ),
    );
  }
}

class ShareInfo extends StatelessWidget {
  const ShareInfo({super.key});

  void share(BuildContext context) {
    final box = context.findRenderObject() as RenderBox;

    final param = ShareParams(
      text:
          "Download the latest no-Ads Holy Qur'an App on Play store\n\n"
          'https://play.google.com/store/apps/details?id=com.hmz.al_quran \n\nShare More! It is Sadaq-e-Jaria :)',
      subject: 'The Holy Qur\'an App',
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );

    SharePlus.instance.share(param);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: height * 0.13),
          Image.asset(StaticAssets.logosGradLogo, height: height * 0.2),
          SizedBox(height: height * 0.02),
          Text(
            "The Holy Qur'an App is also available as Open Source on GitHub!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
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
              Uri.parse('https://github.com/mhmzdev/The_Holy_Quran_App'),
            ),
          ),
          _ShareCustomButton(
            iconData: Iconsax.message,
            text: 'Rate & Feedback',
            onPressed: () => launchUrl(
              Uri.parse(
                'https://play.google.com/store/apps/details?id=com.hmz.al_quran',
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          const AppVersion(),
        ],
      ),
    );
  }
}
