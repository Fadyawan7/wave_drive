import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/forms/textfields/radio_button.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class VehicleListItem extends StatelessWidget {
  const VehicleListItem({
    super.key,
    required this.vehicleId,
    required this.vehicleDescription,
    required this.isSelected,
    required this.onTap,
    required this.uniqueValue,
  });

  final String vehicleId;
  final String vehicleDescription;
  final bool isSelected;
  final VoidCallback onTap;
  final String uniqueValue;

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
                        vehicleId,
                        style: AppTextStyles.text16.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                      const Gap(4),
                      Text(
                        vehicleDescription,
                        style: AppTextStyles.text14.copyWith(
                          color: AppColors.grayA9,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(12),
                RadioButton<String>(
                  value: uniqueValue,
                  groupValue: isSelected ? uniqueValue : null,
                  onChanged: (_) => onTap(),
                  activeColor: AppColors.primarycolor,
                ),
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

