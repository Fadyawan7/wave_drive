import 'package:flutter/material.dart';
import 'package:wave_drive/core/routes/app_navigator.dart';
import 'package:wave_drive/core/shared/extensions/extensions.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';

class ComingSoonDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    double? width,
    String title = 'Coming Soon!',
    String description = 'Updates are coming to the RB Live. Check back soon.',
  }) async {
    return showGeneralDialog(
      barrierLabel: 'ComingSoonDialog',
      barrierDismissible: true,
      context: context,
      barrierColor: Colors.transparent,
      transitionBuilder: (ctx, anim1, anim2, child) =>
          FadeTransition(opacity: anim1, child: child),
      pageBuilder: (ctx, anim1, anim2) => Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const AppImage(path: AppImages.comingSoon, size: 80),
                        const Gap(8),
                        Text(
                          title,
                          style: AppTextStyles.textMed20.copyWith(
                            color: AppColors.gray,
                          ),
                        ),
                        const Gap(8),
                        if (description.isNotNullOrEmpty)
                          Text(
                            description,
                            style: AppTextStyles.text14.copyWith(
                              color: AppColors.gray,
                            ),
                            textAlign: TextAlign.center,
                          ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: () {
                        AppNavigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close_rounded,
                        color: AppColors.gray,
                        size: 24,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
