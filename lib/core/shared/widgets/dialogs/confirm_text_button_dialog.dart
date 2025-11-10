import 'package:flutter/material.dart';
import 'package:wave_drive/core/routes/routes.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/dialogs/app_blur_dialog.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class ConfirmTextButtonDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    Function()? onCancel,
    required Function() onConfirm,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
  }) async {
    return AppBlurDialog.show(
      context,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppTextStyles.text14.copyWith(color: AppColors.gray),
              textAlign: TextAlign.center,
            ),
            const Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: onCancel ?? () => AppNavigator.pop(context),
                  child: Text(
                    cancelText,
                    style: AppTextStyles.textMed14.copyWith(
                      color: AppColors.blue02,
                    ),
                  ),
                ),
                const Gap(24),
                TextButton(
                  onPressed: onConfirm,
                  child: Text(
                    confirmText,
                    style: AppTextStyles.textMed14.copyWith(
                      color: AppColors.blue02,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
