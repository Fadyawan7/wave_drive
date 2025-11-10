import 'package:flutter/material.dart';
import 'package:wave_drive/core/routes/routes.dart';
import 'package:wave_drive/core/shared/constants/enums.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/border/gradient_box_border.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/buttons/secondary_button.dart';
import 'package:wave_drive/core/shared/widgets/dialogs/app_blur_dialog.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class DeleteDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    double? width,
    Function()? onDelete,
    required DeleteType type,
  }) async {
    return AppBlurDialog.show(
      context,
      child: Container(
        width: width ?? double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          border: GradientBoxBorder(
            width: 3,
            gradient: AppColors.gradientbutton,
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              getTitle(type),
              style: AppTextStyles.textMed20.copyWith(color: AppColors.black),
            ),
            const Gap(32),
            PrimaryButton(text: 'Confirm', onPressed: onDelete),
            const Gap(16),
            SecondaryButton(
              text: 'Cancel',
              fitText: false,
              onPressed: () => AppNavigator.pop(context),
              color: AppColors.transparent,
              borderWidth: 1,
              textStyle: AppTextStyles.text16.copyWith(color: AppColors.gray),
            ),
          ],
        ),
      ),
    );
  }

  static String getTitle(DeleteType type) {
    switch (type) {
      case DeleteType.user:
        return "Delete this user";
      case DeleteType.video:
        return "Delete this video";
      case DeleteType.moment:
        return "Delete this moment";
      default:
        return "Delete";
    }
  }
}
