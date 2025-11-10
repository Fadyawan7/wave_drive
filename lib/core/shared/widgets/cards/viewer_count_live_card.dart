import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/cards/glass_card.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';

class ViewerCountLiveCard extends StatelessWidget {
  const ViewerCountLiveCard({
    super.key,
    required this.count,
    required this.onTap,
  });

  final int count;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassCard(
        opacity: .2,
        hasBorder: false,
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Row(
            children: [
              const AppImage(
                path: AppImages.liveImg,
                size: 30,
                fit: BoxFit.cover,
              ),
              const Gap(3),
              Text(
                '$count',
                style: AppTextStyles.textMed12.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
