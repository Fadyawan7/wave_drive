// packages
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

class CancelReasonBottomSheet extends StatelessWidget {
  CancelReasonBottomSheet({super.key});

  final List<String> reasons = const [
    "Passenger requested cancellation",
    "Rider requested cancellation",
    "Too many passengers",
    "Problem with the car",
    "Safety concerns",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cancel a ride",
                  style: AppTextStyles.bodytext.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const Gap(4),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select reason for cancellation",
                style: AppTextStyles.litetext,
              ),
            ),
            const Gap(16),

            // Reason options
            ...reasons.map((reason) => _buildReasonOption(reason)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildReasonOption(String reason) {
    return GestureDetector(
      onTap: () {
        // Get.toNamed('dashboard_view');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          const Gap(5),
          Material(
            color: Colors.transparent,
            child: Text(reason, style: AppTextStyles.bodytext1),
          ),
          Divider(thickness: 1, color: AppColors.strockcolor),
        ],
      ),
    );
  }
}
