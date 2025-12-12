import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class AppSettingMenuItem extends StatelessWidget {
  const AppSettingMenuItem({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
    this.showChevron = true,
  });

  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool showChevron;

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.text16.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                      if (subtitle != null) ...[
                        const Gap(4),
                        Text(
                          subtitle!,
                          style: AppTextStyles.text14.copyWith(
                            color: AppColors.grayA9,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (showChevron) ...[
                  const Gap(12),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: AppColors.black1F,
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

