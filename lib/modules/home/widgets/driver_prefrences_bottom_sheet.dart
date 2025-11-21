import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

class DriverPreferencesBottomSheet extends StatefulWidget {
  const DriverPreferencesBottomSheet({super.key});

  @override
  State<DriverPreferencesBottomSheet> createState() =>
      _DriverPreferencesBottomSheetState();
}

class _DriverPreferencesBottomSheetState
    extends State<DriverPreferencesBottomSheet> {
  bool autoAccept = false; // UI-only toggle state

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.42,
      minChildSize: 0.2,
      maxChildSize: 0.55,
      builder: (_, scrollController) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: const BoxDecoration(
          color: AppColors.whitecolor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ListView(
          controller: scrollController,
          children: [
            Text('Driver preference', style: AppTextStyles.text10),
            const Gap(8),
            Text('Select reason for cancellation', style: AppTextStyles.text10),
            const Gap(20),
            _preferenceTile(
              'Vehicle',
              'OJB-451 Toyota Prius Plus 2016',
            ),
            _preferenceTile(
              'Categories',
              'Wave',
              icon: Icons.arrow_forward_ios,
              onTap: () {
                // Placeholder for navigation
              },
            ),
            _preferenceTile(
              'Distance to pickup',
              'Travel outside this distance will NOT reduce your acceptance rate.',
            ),
            const Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Auto-accept', style: AppTextStyles.text10),
                _toggleSwitch(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _preferenceTile(
    String title,
    String subtitle, {
    IconData? icon,
    Function()? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: AppTextStyles.text10),
                      const Gap(4),
                      Text(subtitle, style: AppTextStyles.text10),
                    ],
                  ),
                ),
                if (icon != null)
                  Icon(icon, size: 16, color: AppColors.graycolor),
              ],
            ),
          ),
          const Gap(8),
          const Divider(height: 1),
        ],
      ),
    );
  }

  Widget _toggleSwitch() {
    return GestureDetector(
      onTap: () {
        setState(() {
          autoAccept = !autoAccept;
        });
      },
      child: Container(
        width: 60,
        height: 30,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: autoAccept ? AppColors.primarycolor : AppColors.whitecolor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
            )
          ],
        ),
        alignment: autoAccept ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: autoAccept ? AppColors.whitecolor : AppColors.primarycolor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
