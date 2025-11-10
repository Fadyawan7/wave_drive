import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/constants/constants.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_icons.dart';
import 'package:wave_drive/core/shared/themes/app_images.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/dialogs/app_blur_dialog.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';

class RechargeDiamondGame {
  static Future<T?> show<T>(
    BuildContext context, {
    required Function() onCancel,
    required Function() onConfirm,
  }) {
    return AppBlurDialog.show(
      context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.rechargeDiamondGameFrame),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(28),
                Text(
                  "Unable to Start Game",
                  style: AppTextStyles.textMed20.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Gap(8),
                Text(
                  "Your balance of Diamond is insufficient, you can get more Diamond by recharging.",
                  style: AppTextStyles.textMed16.copyWith(
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Gap(8),
                GestureDetector(
                  onTap: onConfirm,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 12,
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
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const AppImage(path: AppIcons.diamondBlue, size: 20),
                        const Gap(8),
                        Text(
                          "$moneyToPlayMultiplayer Diamond",
                          style: AppTextStyles.textMed16.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(8),
                Text(
                  "1 ROUND",
                  style: AppTextStyles.textMed16.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onCancel,
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
