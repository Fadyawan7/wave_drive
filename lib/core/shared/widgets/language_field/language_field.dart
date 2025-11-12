import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
class LanguageField extends StatelessWidget {
  const LanguageField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Wave ',
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.primarycolor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: 'Driver',
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.blackcolor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 27,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.inputboxcolor,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.language,
                  color: AppColors.blackcolor,
                ),
                Gap(8),
                Text(
                  'English',
                  style: TextStyle(
                      color: AppColors.blackcolor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
