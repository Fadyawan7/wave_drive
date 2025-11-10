import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class OfflineDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    double? width,
    String title = 'No Internet Connection',
    String description =
        "You're offline. Please check your internet connection.",
  }) async {
    return showGeneralDialog(
      barrierLabel: 'OfflineDialog',
      barrierDismissible: false,
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (ctx, anim1, anim2, child) =>
          FadeTransition(opacity: anim1, child: child),
      pageBuilder: (ctx, anim1, anim2) => Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            width: width ?? double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.wifi_off,
                      color: Colors.redAccent,
                      size: 64,
                    ),
                    const Gap(12),
                    Text(
                      title,
                      style: AppTextStyles.textMed20.copyWith(
                        color: AppColors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(8),
                    Text(
                      description,
                      style: AppTextStyles.text14.copyWith(
                        color: AppColors.gray,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
