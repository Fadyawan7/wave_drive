import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/widgets/loading/app_loading.dart';

class CircleOutlinedIconButton extends StatelessWidget {
  const CircleOutlinedIconButton({
    super.key,
    this.onTap,
    this.padding,
    this.borderColor,
    this.isLoading = false,
    this.isDisabled = false,
    required this.icon,
    this.circleColor,
  });

  final Function()? onTap;
  final EdgeInsets? padding;
  final Color? borderColor;
  final bool isLoading;
  final bool isDisabled;
  final Widget icon;
  final Color? circleColor;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDisabled ? .4 : 1,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: (isLoading || isDisabled) ? null : onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99),
          ),
          overlayColor: MaterialStateColor.resolveWith(
            (states) => AppColors.stroke.withOpacity(.2),
          ),
          splashFactory: InkRipple.splashFactory,
          child: Container(
            padding: padding ?? const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              gradient: AppColors.gradientbutton,
              shape: BoxShape.circle,
              border: Border.all(color: borderColor ?? AppColors.darkPrimary),
              color: circleColor,
            ),
            child: isLoading ? const AppLoading() : icon,
          ),
        ),
      ),
    );
  }
}
