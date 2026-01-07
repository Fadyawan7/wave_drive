import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:wave_drive/core/routes/routes.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/bottom_sheet/default_bottom_sheet.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';
import 'package:wave_drive/modules/home/widgets/app_toggle_tile.dart';

class DriverPreferenceBotonSheet {
  static Future<T?> show<T>(
    BuildContext context, {
    bool barrierDismissible = true,
    required Function() onTakePhoto,
    required Function(bool) onAutoAccept,
    required bool autoAccept,
    required Function() onChoosePhoto,
    required Function() onChooseCategory,
  }) {
    return DefaultBottomSheet.show<T>(
      boarder: 12,
      context,
      barrierDismissible: barrierDismissible,
      showDivider: false,

      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Driver preference",
                    style: AppTextStyles.text20.copyWith(fontWeight: FontWeight.w600, color: AppColors.black33),
                  ),

                  GestureDetector(
                    onTap: () => AppNavigator.pop(context),
                    child: const AppImage(path: AppIcons.cross, size: 21),
                  ),
                ],
              ),
              Gap(24),
              _buildItem(
                title: 'Vehicle',
                onTap: () {
                  AppNavigator.pop(context);
                  onChoosePhoto();
                },
                subTitle: 'OJB-451 Toyota Prius Plus 2016',
              ),
              _buildItem(
                title: 'Categories',
                onTap: () {
                  AppNavigator.pop(context);
                  onChooseCategory();
                },
                subTitle: 'Wave',
              ),
              _buildItem(
                title: 'Distance to pickup',
                showIcon: false,

                onTap: () {
                  AppNavigator.pop(context);
                },
                subTitle: 'Travel outside this distance will NOT reduce your acceptance rate.',
              ),
              AppToggleTile(
                isOnline: autoAccept,
                onTap: (autoAccept) {
                  onAutoAccept(autoAccept);
                },
                title: 'Auto-accept',
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildItem({
    required String title,
    required String subTitle,
    bool showIcon = true,
    bool showDivider = true,
    required Function() onTap,
  }) => InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.text16.copyWith(color: AppColors.black33)),
                    const Gap(4),
                    Text(
                      subTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.text16.copyWith(color: AppColors.grayA9),
                    ),
                  ],
                ),
              ),
              if (showIcon) const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.grayA9),
            ],
          ),
          if (showDivider)
            const Padding(
              padding: EdgeInsets.only(top: 4),
              child: Divider(thickness: 0.1, color: AppColors.grayA9),
            ),
        ],
      ),
    ),
  );
}
