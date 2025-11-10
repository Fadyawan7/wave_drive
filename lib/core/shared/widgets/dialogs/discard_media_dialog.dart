import 'package:flutter/material.dart';
import 'package:wave_drive/core/routes/app_navigator.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/dialogs/app_blur_dialog.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class DiscardMediaDialog {
  static Future<T?> show<T>(BuildContext context) async {
    return AppBlurDialog.show(
      context,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Discard media?",
              style: AppTextStyles.textMed20.copyWith(color: AppColors.black1F),
            ),
            Text(
              "If you go back now, you will lose any changes you’ve made.",
              style: AppTextStyles.text14.copyWith(color: AppColors.gray),
              textAlign: TextAlign.center,
            ),
            const Gap(16),
            const Divider(thickness: 0.1, color: AppColors.gray),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                AppNavigator.popUntilMain(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "Discard",
                  style: AppTextStyles.textMed16.copyWith(color: AppColors.red),
                ),
              ),
            ),
            // const Divider(thickness: 1, color: AppColors.grayED),
            // const Gap(16),
            // GestureDetector(
            //   onTap: () {},
            //   child: Text(
            //     "Save draft",
            //     style: AppTextStyles.textMed16.copyWith(color: AppColors.gray55),
            //   ),
            // ),
            // const Gap(16),
            const Divider(thickness: 1, color: AppColors.grayED),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                AppNavigator.pop(context);
              },
              child: Column(
                children: [
                  const Gap(16),
                  Text(
                    "Keep editing",
                    style: AppTextStyles.textMed16.copyWith(
                      color: AppColors.gray55,
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
