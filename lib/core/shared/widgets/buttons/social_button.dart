import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/loading/app_loading.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    this.onPressed,
    required this.text,
    this.textStyle,
    this.color,
    this.height = 48.0,
    this.radius = 90.0,
    this.fitText = false,
    this.borderWidth = 0,
    this.isLoading = false,
    this.isDisabled = false,
    this.prefix,
    this.suffix,
    this.centerIcon,
    this.textPadding,
    this.isRecommended = false,
  });

  final Function()? onPressed;
  final Color? color;
  final double height;
  final double radius;
  final String text;
  final TextStyle? textStyle;
  final bool fitText;
  final bool isRecommended;
  final double borderWidth;
  final bool isLoading;
  final bool isDisabled;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? centerIcon;
  final EdgeInsets? textPadding;

  @override
  Widget build(BuildContext context) {
    final hasIcon = suffix != null || prefix != null;
    return Opacity(
      opacity: isDisabled ? .4 : 1,
      child: SizedBox(
        width: fitText ? null : double.infinity,
        height: height,
        child: ElevatedButton(
          onPressed: (isLoading || isDisabled) ? null : onPressed,
          style: ButtonStyle(
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            splashFactory: InkRipple.splashFactory,
            overlayColor: WidgetStateColor.resolveWith(
              (states) => AppColors.stroke.withOpacity(.2),
            ),
            backgroundColor: WidgetStateProperty.all(
              color ?? AppColors.darkPrimary,
            ),
            elevation: WidgetStateProperty.all(0),

            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: BorderSide(
                  color: Colors.grey.shade800, // light grey stroke
                  width: borderWidth, // use the parameter
                ),
              ),
            ),
          ),
          child: isLoading
              ? const AppLoading(color: AppColors.white)
              : Stack(
                  clipBehavior: Clip.none,
                  fit: fitText ? StackFit.expand : StackFit.loose,
                  alignment: Alignment.centerLeft,
                  children: [
                    if (prefix != null)
                      Positioned.fill(
                        left: 20,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: prefix,
                        ),
                      ),

                    if (centerIcon != null) ...[
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ?centerIcon,
                              Gap(12),

                              Text(
                                text,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    textStyle ??
                                    AppTextStyles.textMed16.copyWith(
                                      color: AppColors.white,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ] else ...[
                      Positioned.fill(
                        child: Align(
                          child: Padding(
                            padding:
                                textPadding ??
                                EdgeInsets.symmetric(
                                  horizontal: hasIcon ? 60.0 : 20,
                                ),
                            child: Text(
                              text,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  textStyle ??
                                  AppTextStyles.textMed16.copyWith(
                                    color: AppColors.white,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],

                    if (suffix != null)
                      Positioned.fill(
                        right: 20,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: suffix,
                        ),
                      ),
                    if (isRecommended)
                      Positioned(
                        top: -13.h,
                        right: 15,
                        child: Card(
                          elevation: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: AppColors.gradientbutton,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            child: Text(
                              "Recommended",
                              style: AppTextStyles.text8.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
