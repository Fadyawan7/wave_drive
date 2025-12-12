import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class AutoAcceptToggleItem extends StatelessWidget {
  const AutoAcceptToggleItem({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.text16.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),
          GestureDetector(
            onTap: () {
              onChanged(!value);
            },
            child: Container(
              width: 51,
              height: 31,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: value
                    ? AppColors.primarycolor
                    : AppColors.white,
                borderRadius: BorderRadius.circular(15.5),
                border: Border.all(
                  color: value
                      ? AppColors.primarycolor
                      : AppColors.grayE3,
                  width: 1,
                ),
              ),
              alignment: value
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                width: 27,
                height: 27,
                decoration: BoxDecoration(
                  color: value
                      ? AppColors.white
                      : AppColors.grayE3,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

