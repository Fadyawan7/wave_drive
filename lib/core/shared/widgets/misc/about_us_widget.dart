import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
  });

  final String text;
  final Function() onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          icon,
          const Gap(12),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.text16.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Gap(12),
          const Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: AppColors.black1F,
          ),
        ],
      ),
    );
  }
}
