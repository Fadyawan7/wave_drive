import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_images.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class EmptyBox extends StatelessWidget {
  final String text;
  final double? sizeImage;

  const EmptyBox({super.key, required this.text, this.sizeImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppImages.followingbox,
          width: double.infinity / 2,
          height: sizeImage,
        ),
        const Gap(20),
        Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyles.text12.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.black54,
            fontFamily: AppFontFamily.svnGilroy,
          ),
        ),
      ],
    );
  }
}
