import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

class RequiredTextFiledLabel extends StatelessWidget {
  const RequiredTextFiledLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: label,
        style: AppTextStyles.text14.copyWith(color: AppColors.gray),
        children: [
          TextSpan(
            text: ' *',
            style: AppTextStyles.text14.copyWith(color: AppColors.red),
          ),
        ],
      ),
    );
  }
}
