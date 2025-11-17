import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class NavigateButton extends StatelessWidget {
  const NavigateButton({
    super.key,
    required this.widget,
    this.border,
    this.iconColor = AppColors.darkPrimary,
    this.backgroundColor = AppColors.white,
    this.onTap,
    this.padding,
  });

  final Widget widget;
  final Color iconColor;
  final Border? border;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashFactory: InkRipple.splashFactory,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(99),
      ),
      overlayColor: WidgetStateColor.resolveWith(
        (states) => AppColors.stroke.withOpacity(.2),
      ),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        child: Ink(
          padding:
              padding ??
              const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(child: widget),
              const Gap(16),
              Icon(Icons.arrow_forward_sharp, color: iconColor),
            ],
          ),
        ),
      ),
    );
  }
}
