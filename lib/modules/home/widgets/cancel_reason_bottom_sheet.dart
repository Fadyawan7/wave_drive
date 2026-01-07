// packages
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_icons.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/bottom_sheet/default_bottom_sheet.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';

class CancelReasonBottomSheet {
  static Future<T?> show<T>(BuildContext context, {bool barrierDismissible = true, required Function() onCancal}) {
    return DefaultBottomSheet.show<T>(
      boarder: 12,

      context,
      barrierDismissible: barrierDismissible,
      showDivider: false,

      child: CancelReason(onCancal: onCancal),
    );
  }
}

class CancelReason extends StatefulWidget {
  final Function() onCancal;
  const CancelReason({super.key, required this.onCancal});

  @override
  State<CancelReason> createState() => _CancelReasonState();
}

class _CancelReasonState extends State<CancelReason> {
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                Text("Cancel a ride", style: AppTextStyles.text10.copyWith(fontWeight: FontWeight.bold, fontSize: 18)),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const AppImage(path: AppIcons.cross, color: AppColors.black),
                ),
              ],
            ),
            const Gap(4),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Select reason for cancellation", style: AppTextStyles.text10),
            ),
            const Gap(16),

            // Reason options
            ...reasons.map((reason) => _buildReasonOption(reason)),
          ],
        ),
      ),
    );
  }

  Widget _buildReasonOption(String reason) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 24,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
              widget.onCancal();
            },
            child: Text(
              reason,
              style: AppTextStyles.text16.copyWith(fontWeight: FontWeight.w400, color: AppColors.black33),
            ),
          ),
        ),
        const Divider(thickness: 1, color: AppColors.grayF8),
      ],
    );
  }
}
