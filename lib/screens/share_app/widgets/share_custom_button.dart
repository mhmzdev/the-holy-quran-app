part of '../share_app.dart';

class _ShareCustomButton extends StatelessWidget {
  final String? text;
  final IconData? iconData;
  final void Function()? onPressed;
  const _ShareCustomButton({
    Key? key,
    required this.iconData,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.55,
        height: MediaQuery.of(context).size.height * 0.055,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              AppTheme.c!.accent,
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                iconData,
                size: MediaQuery.of(context).size.height * 0.03,
                color: appProvider.isDark ? Colors.black : Colors.white,
              ),
              Text(
                "  $text",
                style: TextStyle(
                  color: appProvider.isDark ? Colors.black : Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
