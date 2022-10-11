part of '../onboarding.dart';

class _Indicator extends StatelessWidget {
  final bool isSelected;
  const _Indicator({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: Space.hf(0.2),
      duration: const Duration(milliseconds: 150),
      width:
          isSelected ? AppDimensions.normalize(12) : AppDimensions.normalize(4),
      height: AppDimensions.normalize(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(360.0),
        color: isSelected ? AppTheme.c!.accent : Colors.grey,
      ),
    );
  }
}
