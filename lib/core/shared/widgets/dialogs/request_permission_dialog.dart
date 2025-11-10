import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:wave_drive/core/routes/routes.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/buttons/secondary_button.dart';
import 'package:wave_drive/core/shared/widgets/dialogs/app_blur_dialog.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class RequestPermissionDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    String? title,
    String? description,
  }) async {
    return AppBlurDialog.show(
      context,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title ?? '"RB Live" would like to access your storage',
              style: AppTextStyles.textMed20.copyWith(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
            const Gap(16),
            Text(
              description ??
                  'Granting storage access allows this app to save your videos. Enable this permission in your device settings.',
              style: AppTextStyles.text14.copyWith(color: AppColors.gray),
              textAlign: TextAlign.center,
            ),
            const Gap(32),
            PrimaryButton(
              text: 'Settings',
              onPressed: () {
                AppNavigator.pop(context);
                AppSettings.openAppSettings();
              },
            ),
            const Gap(16),
            SecondaryButton(
              text: 'Cancel',
              fitText: false,
              onPressed: () => AppNavigator.pop(context),
              color: AppColors.gray,
              borderWidth: 1,
              textStyle: AppTextStyles.text16.copyWith(color: AppColors.gray),
            ),
          ],
        ),
      ),
    );
  }
}
