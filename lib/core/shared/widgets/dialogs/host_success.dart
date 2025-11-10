import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/dialogs/app_blur_dialog.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';

class HostAddedSuccess {
  static Future<T?> show<T>(BuildContext context, {double? width}) async {
    return AppBlurDialog.show(
      context,
      child: Container(
        width: width ?? double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppImage(path: AppImages.successPopup, height: 180),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Now, You are a Host',
                style: AppTextStyles.textMed20.copyWith(
                  color: AppColors.darkPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
