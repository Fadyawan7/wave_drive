import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/loading/app_loading.dart';

class AgencyButton extends StatelessWidget {
  const AgencyButton({
    super.key,
    this.onPressed,
    required this.text,
    this.textStyle,
    this.color,
    this.height = 44.0,
    this.radius = 40.0,
    this.fitText = false,
    this.borderWidth = 0,
    this.isLoading = false,
    this.isDisabled = false,
    this.prefix,
    this.suffix,
    this.loadingText,
    this.loadingSize = 20,
    this.padding,
    this.prefixPadding = const EdgeInsets.symmetric(horizontal: 20),
    this.suffixPadding = const EdgeInsets.symmetric(horizontal: 20),
    this.loadingColor,
    this.textColor,
    this.isCenter = false,
  });

  final Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final double height;
  final double radius;
  final String text;
  final TextStyle? textStyle;
  final bool fitText;
  final double borderWidth;
  final double loadingSize;
  final bool isLoading;
  final bool isDisabled;
  final bool isCenter;
  final Widget? prefix;
  final Widget? suffix;
  final String? loadingText;
  final EdgeInsets? padding;
  final EdgeInsets prefixPadding;
  final EdgeInsets suffixPadding;
  final Color? loadingColor;

  @override
  Widget build(BuildContext context) {
    final hasIcon = suffix != null || prefix != null;
    return Opacity(
      opacity: isDisabled ? .4 : 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(radius),
            bottomRight: Radius.circular(radius),
          ),
          gradient: AppColors.gradientbutton,
        ),
        width: fitText ? null : double.infinity,
        height: height,
        child: ElevatedButton(
          onPressed: (isLoading || isDisabled) ? null : onPressed,
          style: ButtonStyle(
            padding: WidgetStateProperty.all(padding ?? EdgeInsets.zero),
            splashFactory: InkRipple.splashFactory,
            overlayColor: WidgetStateColor.resolveWith(
              (states) => AppColors.stroke.withOpacity(.2),
            ),
            backgroundColor: WidgetStateProperty.all(
              color ?? Colors.transparent,
            ),
            elevation: WidgetStateProperty.all(0),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius),
                ),
              ),
            ),
          ),
          child: isLoading
              ? Row(
                  mainAxisSize: fitText ? MainAxisSize.min : MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppLoading(
                      color: loadingColor ?? AppColors.white,
                      size: loadingSize,
                    ),
                    if (loadingText != null) ...[
                      const Gap(8),
                      Text(
                        loadingText!,
                        style: AppTextStyles.textMed20.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ],
                )
              : Row(
                  mainAxisSize: fitText ? MainAxisSize.min : MainAxisSize.max,
                  mainAxisAlignment: isCenter
                      ? MainAxisAlignment.center
                      : hasIcon
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    if (prefix != null)
                      Padding(padding: prefixPadding, child: prefix),
                    Text(
                      text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          textStyle ??
                          AppTextStyles.textMed16.copyWith(
                            color: textColor ?? AppColors.white,
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
