import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class SoundOptionItem extends StatelessWidget {
  const SoundOptionItem({
    super.key,
    required this.title,
    required this.isSelected,
    this.showDownloadIcon = false,
    this.onTap,
  });

  final String title;
  final bool isSelected;
  final bool showDownloadIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.text16.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                ),
                if (showDownloadIcon) ...[
                  const Gap(12),
                  const Icon(
                    Icons.download,
                    size: 20,
                    color: AppColors.grayA9,
                  ),
                ] else if (isSelected) ...[
                  const Gap(12),
                  const Icon(
                    Icons.check,
                    size: 20,
                    color: AppColors.primarycolor,
                  ),
                ],
              ],
            ),
          ),
        ),
        const Divider(
          height: 1,
          thickness: 1,
          color: AppColors.grayF8,
        ),
      ],
    );
  }
}

