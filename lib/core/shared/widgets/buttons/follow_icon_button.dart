import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/widgets/loading/app_loading.dart';

class FollowIconButton extends StatelessWidget {
  const FollowIconButton({
    super.key,
    this.onPressed,
    this.textStyle,
    this.backgroundColor,
    this.iconColor = AppColors.white,
    this.sizeIcon = 22,
    this.sizeLoadingIcon = 12,
    this.paddingIcon = const EdgeInsets.symmetric(horizontal: 4),
    this.height = 24.0,
    this.radius = 50.0,
    this.borderWidth = 1,
    this.isLoading = false,
    this.isFollowed = false,
  });

  final Function()? onPressed;
  final double borderWidth;
  final Color? backgroundColor;
  final Color iconColor;
  final double sizeIcon;
  final double sizeLoadingIcon;
  final EdgeInsets paddingIcon;
  final double height;
  final double radius;
  final TextStyle? textStyle;
  final bool isLoading;
  final bool isFollowed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        splashFactory: InkRipple.splashFactory,
        borderRadius: BorderRadius.circular(radius),
        overlayColor: WidgetStateColor.resolveWith(
          (states) => AppColors.stroke.withOpacity(.2),
        ),
        child: Ink(
          height: height,
          padding: paddingIcon,
          decoration: BoxDecoration(
            gradient: backgroundColor == null ? AppColors.gradientRed : null,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Center(
            child: isLoading
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: AppLoading(size: sizeLoadingIcon, color: iconColor),
                  )
                : !isFollowed
                ? Icon(Icons.add_rounded, color: iconColor, size: sizeIcon)
                : Icon(Icons.check_rounded, color: iconColor, size: sizeIcon),
          ),
        ),
      ),
    );
  }
}
