import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/images/cache_app_image.dart';
import 'package:wave_drive/core/shared/widgets/shimmers/base_shimmer.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({
    super.key,
    required this.label,
    this.onTap,
    this.padding,
    this.textStyle,
    this.height = 50.0,
    this.fitText = false,
    this.isDisabled = false,
    this.align,
  });

  final String label;
  final Function()? onTap;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final double height;
  final bool fitText;
  final bool isDisabled;
  final AlignmentGeometry? align;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDisabled ? .4 : 1,
      child: MouseRegion(
        cursor: isDisabled
            ? SystemMouseCursors.basic
            : SystemMouseCursors.click,
        child: GestureDetector(
          onTap: isDisabled ? null : onTap,
          child: Container(
            alignment: align,
            width: fitText ? null : double.infinity,
            height: height,
            padding: padding ?? EdgeInsets.zero,
            child: Text(
              label,
              style:
                  textStyle ??
                  AppTextStyles.textMed16.copyWith(color: AppColors.gray),
            ),
          ),
        ),
      ),
    );
  }
}

class CountrySelectButton extends StatelessWidget {
  const CountrySelectButton({
    super.key,
    required this.label,
    this.onTap,
    this.padding,
    this.textStyle,
    this.height = 50.0,
    this.fitText = false,
    this.isDisabled = false,
    this.align,
    required this.flagImg,
    this.gradient,
  });

  final String label;
  final Function()? onTap;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final double height;
  final bool fitText;
  final bool isDisabled;
  final String flagImg;
  final AlignmentGeometry? align;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDisabled ? .4 : 1,
      child: MouseRegion(
        cursor: isDisabled
            ? SystemMouseCursors.basic
            : SystemMouseCursors.click,
        child: GestureDetector(
          onTap: isDisabled ? null : onTap,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: gradient,
            ),
            padding: const EdgeInsets.all(1),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: AppColors.white,
              ),
              alignment: align,
              width: fitText ? null : double.infinity,
              // height: height,
              padding: padding ?? EdgeInsets.zero,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: CacheAppImage(
                      loadingPlaceholder: (context) =>
                          const BaseShimmer(width: 20, height: 20),
                      path: flagImg,
                      size: 20,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Gap(4),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      label,
                      style:
                          textStyle ??
                          AppTextStyles.textMed16.copyWith(
                            color: AppColors.gray,
                          ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
