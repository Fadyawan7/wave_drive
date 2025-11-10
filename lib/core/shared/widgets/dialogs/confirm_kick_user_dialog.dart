import 'package:flutter/material.dart';
import 'package:wave_drive/core/routes/app_navigator.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/border/gradient_box_border.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/buttons/secondary_button.dart';
import 'package:wave_drive/core/shared/widgets/dialogs/app_blur_dialog.dart';
import 'package:wave_drive/core/shared/widgets/forms/circle_check_box.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class ConfirmKickUserDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    required Function(bool isBanUser) onConfirm,
  }) async {
    bool shouldBan = false;
    return AppBlurDialog.show(
      context,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        decoration: BoxDecoration(
          border: GradientBoxBorder(
            width: 3,
            gradient: AppColors.gradientbutton,
            borderRadius: BorderRadius.circular(32),
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Do you want to kick out this viewer?",
              textAlign: TextAlign.center,
              style: AppTextStyles.text14.copyWith(color: AppColors.gray),
            ),
            const Gap(16),
            Row(
              children: [
                CircleCheckbox(
                  onChanged: (isChecked) {
                    shouldBan = isChecked;
                  },
                  borderColor: AppColors.gray,
                ),
                const Gap(8),
                Expanded(
                  child: Text(
                    'Block and prohibit entering into your room',
                    style: AppTextStyles.text11.copyWith(color: AppColors.gray),
                  ),
                ),
              ],
            ),
            const Gap(24),
            PrimaryButton(
              text: 'Confirm',
              height: 45,
              onPressed: () async {
                await AppNavigator.pop(context);
                onConfirm(shouldBan);
              },
            ),
            const Gap(16),
            SecondaryButton(
              color: AppColors.transparent,
              text: 'Cancel',
              height: 45,
              fitText: false,
              onPressed: () {
                AppNavigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
