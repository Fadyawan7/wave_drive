import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/widgets/loading/app_loading.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    this.onTap,
    this.padding,
    this.textStyle,
    this.backgroundColor,
    this.iconColor,
    this.backgroundLinearGradient,
    this.isLoading = false,
    this.isDisabled = false,
    this.size,
    required this.icon,
  });

  final Function()? onTap;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? iconColor;
  final LinearGradient? backgroundLinearGradient;
  final bool isLoading;
  final bool isDisabled;
  final Widget icon;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDisabled ? .4 : 1,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: (isLoading || isDisabled) ? null : onTap,
          overlayColor: MaterialStateColor.resolveWith(
            (states) => AppColors.stroke.withOpacity(.2),
          ),
          radius: 99,
          borderRadius: BorderRadius.circular(99),

          child: Container(
            padding: padding ?? const EdgeInsets.all(8.0),
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
              gradient: backgroundLinearGradient,
            ),
            child: isLoading ? const AppLoading(color: AppColors.white) : icon,
          ),
        ),
      ),
    );
  }
}
