import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/extensions/extensions.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';

class MusicCard extends StatelessWidget {
  const MusicCard({
    super.key,
    required this.songName,
    this.author,
    required this.onTap,
  });

  final String songName;
  final String? author;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        decoration: BoxDecoration(color: AppColors.black.withOpacity(.3)),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppImage(path: AppImages.music, size: 15),
            const Gap(6),
            Text(
              songName,
              style: AppTextStyles.text12.copyWith(color: AppColors.white),
            ),
            if (author.isNotNullOrEmpty) ...[
              const Gap(4),
              Text(
                '·',
                style: AppTextStyles.text12.copyWith(color: AppColors.white),
              ),
              const Gap(4),
              Text(
                author!,
                style: AppTextStyles.text12.copyWith(color: AppColors.white),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
