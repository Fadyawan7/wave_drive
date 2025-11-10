import 'package:flutter/widgets.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';

class GameButton extends StatelessWidget {
  const GameButton({super.key, required this.text, required this.onTap});

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.gameButtonBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.textMed16.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
