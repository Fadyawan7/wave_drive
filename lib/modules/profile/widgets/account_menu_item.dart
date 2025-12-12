import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class AccountMenuItem extends StatelessWidget {
  const AccountMenuItem({
    super.key,
    required this.title,
    this.icon,
    this.value,
    this.onTap,
    this.showChevron = true,
    this.textColor,
  });

  final String title;
  final Widget? icon;
  final String? value;
  final VoidCallback? onTap;
  final bool showChevron;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final titleColor = textColor ?? AppColors.black;
    final valueColor = textColor ?? AppColors.grayA9;

    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                if (icon != null) ...[
                  icon!,
                  const Gap(12),
                ],
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.text16.copyWith(
                      fontWeight: FontWeight.w600,
                      color: titleColor,
                    ),
                  ),
                ),
                if (value != null) ...[
                  const Gap(8),
                  Text(
                    value!,
                    style: AppTextStyles.text14.copyWith(
                      color: valueColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
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

