import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/border/gradient_box_border.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/loading/app_loading.dart';

class PrimaryOutlinedButton extends StatelessWidget {
  const PrimaryOutlinedButton({
    super.key,
    this.onPressed,
    required this.text,
    this.textStyle,
    this.color,
    this.height = 48.0,
    this.radius = 8.0,
    this.fitText = false,
    this.borderWidth = 1,
    this.isLoading = false,
    this.isDisabled = false,
    this.prefix,
    this.suffix,
    this.loadingText,
    this.loadingSize = 20,
    this.prefixPadding = const EdgeInsets.symmetric(horizontal: 20),
    this.suffixPadding = const EdgeInsets.symmetric(horizontal: 20),
    this.padding,
    this.gradient = AppColors.outlinebuttongradient,
  });

  final Function()? onPressed;
  final Color? color;
  final double height;
  final double radius;
  final String text;
  final TextStyle? textStyle;
  final bool fitText;
  final double borderWidth;
  final double loadingSize;
  final bool isLoading;
  final bool isDisabled;
  final Widget? prefix;
  final Widget? suffix;
  final String? loadingText;
  final EdgeInsets prefixPadding;
  final EdgeInsets suffixPadding;
  final EdgeInsets? padding;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    final hasIcon = suffix != null || prefix != null;
    return Opacity(
      opacity: isDisabled ? .4 : 1,
      child: Container(
        decoration: BoxDecoration(
          border: GradientBoxBorder(
            gradient: gradient,
            borderRadius: BorderRadius.circular(radius),
            width: borderWidth,
          ),
        ),
        width: fitText ? null : double.infinity,
        height: height,
        child: OutlinedButton(
          onPressed: (isLoading || isDisabled) ? null : onPressed,
          style: OutlinedButton.styleFrom(
            splashFactory: InkRipple.splashFactory,
            side: BorderSide(
              width: borderWidth,
              color: color ?? AppColors.darkPrimary,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            padding: padding,
          ),
          child: isLoading
              ? Row(
                  mainAxisSize: fitText ? MainAxisSize.min : MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppLoading(color: AppColors.white, size: loadingSize),
                    if (loadingText != null) ...[
                      const Gap(8),
                      Text(
                        loadingText!,
                        style: AppTextStyles.textMed12.copyWith(
                          color: AppColors.darkPrimary,
                        ),
                      ),
                    ],
                  ],
                )
              : Row(
                  mainAxisSize: fitText ? MainAxisSize.min : MainAxisSize.max,
                  mainAxisAlignment: hasIcon
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    if (prefix != null)
                      Padding(padding: prefixPadding, child: prefix),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return AppColors.outlinebuttongradient.createShader(
                          bounds,
                        );
                      },
                      child: Text(
                        text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            textStyle ??
                            AppTextStyles.text14.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                      ),
                    ),
                    if (suffix != null)
                      Padding(padding: suffixPadding, child: suffix),
                  ],
                ),
        ),
      ),
    );
  }
}
