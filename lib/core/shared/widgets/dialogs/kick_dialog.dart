import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/dialogs/app_blur_dialog.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';

class KickDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    double? width,
    bool isBanned = false,
  }) async {
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
            const AppImage(path: AppImages.kickAlert, height: 120),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                isBanned
                    ? 'You have been banned from the room'
                    : 'You are kicked from this live',
                textAlign: TextAlign.center,
                style: AppTextStyles.textMed18.copyWith(color: AppColors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
