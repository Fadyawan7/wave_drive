import 'package:flutter/material.dart';
import 'package:wave_drive/core/routes/routes.dart';
import 'package:wave_drive/core/shared/extensions/extensions.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_images.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/dialogs/app_blur_dialog.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';

class GeneralGameDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    String? description,
    String? textButton,
    required Function() onConfirm,
    Function()? onCancel,
    bool hasCancelButton = false,
  }) {
    return AppBlurDialog.show(
      context,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.gameDialogBackground),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTextStyles.textBold20.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (description.isNotNullOrEmpty) ...[
                  const Gap(8),
                  Text(
                    description!,
                    style: AppTextStyles.textMed16.copyWith(
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
                const Gap(32),
                GestureDetector(
                  onTap: onConfirm,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 32,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.green26,
                          AppColors.green31,
                          AppColors.green65,
                        ],
                        stops: [0.0, 0.5051, 1.0],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Text(
                      textButton ?? "Try again",
                      style: AppTextStyles.textMed16.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const Gap(12),
              ],
            ),
          ),
          if (hasCancelButton)
            GestureDetector(
              onTap: onCancel ?? () => AppNavigator.pop(context),
              child: const AppImage(
                path: AppImages.buttonBackRechargeGame,
                width: 60,
                height: 42,
              ),
            ),
        ],
      ),
    );
  }
}
