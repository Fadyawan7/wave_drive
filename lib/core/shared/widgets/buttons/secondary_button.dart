import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/border/gradient_box_border.dart';
import 'package:wave_drive/core/shared/widgets/loading/app_loading.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    this.onPressed,
    this.text,
    this.textStyle,
    this.color,
    this.height = 48.0,
    this.radius = 50.0,
    this.borderWidth = 2,
    this.fitText = true,
    this.isLoading = false,
    this.isDisabled = false,
    this.content,
    this.contentPadding,
    this.gradient = AppColors.gradientbutton,
  }) : assert(content != null || text != null);

  final Function()? onPressed;
  final double borderWidth;
  final Color? color;
  final double height;
  final double radius;
  final String? text;
  final TextStyle? textStyle;
  final bool fitText;
  final bool isLoading;
  final bool isDisabled;
  final Widget? content;
  final EdgeInsets? contentPadding;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDisabled ? .4 : 1,
      child: Container(
        width: fitText ? null : double.infinity,
        height: height,
        decoration: BoxDecoration(
          border: GradientBoxBorder(
            gradient: gradient,
            borderRadius: BorderRadius.circular(radius),
            width: borderWidth,
          ),
        ),
        child: OutlinedButton(
          onPressed: (isLoading || isDisabled) ? null : onPressed,
          style: OutlinedButton.styleFrom(
            splashFactory: InkRipple.splashFactory,
            side: BorderSide(
              width: borderWidth,
              color: color ?? AppColors.primary,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            padding: contentPadding,
          ),
          child: isLoading
              ? const AppLoading()
              : content ??
                    Text(
                      text!,
                      style:
                          textStyle ??
                          AppTextStyles.textMed16.copyWith(
                            color: AppColors.primary,
                          ),
                    ),
        ),
      ),
    );
  }
}
