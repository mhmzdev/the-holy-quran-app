part of '../home_screen.dart';

class _CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const _CustomButton({Key? key, required this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.normalize(100),
      height: AppDimensions.normalize(20),
      child: MaterialButton(
        shape: const StadiumBorder(),
        onPressed: onPressed,
        child: WidgetAnimator(
          child: Text(
            title,
            style: AppText.b1,
          ),
        ),
        color: const Color(0xffee8f8b),
      ),
    );
  }
}
