import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/utils/number_format.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';

class PkStreamingCard extends StatelessWidget {
  const PkStreamingCard({
    super.key,
    required this.imageUrl,
    this.height = 170,
    this.width,
    this.onTap,
    this.viewCount = 0,
    required this.title,
  });

  final double? height;
  final String imageUrl;
  final String title;
  final double? width;
  final int viewCount;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.darkPrimary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AppImage(
                  path: imageUrl,
                  errorPlaceHolder: (context) => const SizedBox(),
                ),
              ),
            ),
            Positioned(
              bottom: 6,
              left: 6,
              right: 6,
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.textMed12.copyWith(color: AppColors.white),
              ),
            ),
            Positioned(
              top: 6,
              right: 6,
              child: Text(
                formatIntNumber(viewCount),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.textMed12.copyWith(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
