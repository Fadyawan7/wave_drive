import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/extensions/extensions.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_icons.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/utils/numeral.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';
import 'package:wave_drive/core/shared/widgets/misc/shadow_widget.dart';

class MediaCard extends StatelessWidget {
  const MediaCard({
    super.key,
    this.path,
    this.height,
    this.width,
    this.onTap,
    required this.views,
    this.widget,
    this.hasWidget = false,
    this.borderRadius,
  });

  final double? height;
  final String? path;
  final double? width;
  final Function()? onTap;
  final int views;
  final Widget? widget;
  final bool hasWidget;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius ?? 0),
                child: path.isNotNullOrEmpty
                    ? AppImage(path: path!)
                    : const ColoredBox(color: AppColors.black),
              ),
            ),
            Positioned(
              left: 8,
              bottom: 5,
              child: Row(
                children: [
                  const AppImage(path: AppIcons.play),
                  const Gap(4),
                  Text(
                    views.numeral(fractionDigits: 1),
                    style: AppTextStyles.textMed10.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            if (hasWidget)
              Positioned(
                top: 4,
                right: 4,
                child: ShadowWidget(
                  widget: widget ?? const AppImage(path: AppIcons.groupPlay),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
