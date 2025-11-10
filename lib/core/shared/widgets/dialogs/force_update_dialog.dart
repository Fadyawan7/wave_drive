import 'package:flutter/material.dart';
import 'package:wave_drive/core/configs/app_config.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/utils/app_version.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';

class ForceUpdateDialog {
  static Future<bool?> show(BuildContext context) async {
    return showGeneralDialog(
      barrierLabel: 'AppUpdateDialog',
      context: context,
      barrierColor: AppColors.black.withOpacity(.6),
      pageBuilder: (ctx, anim1, anim2) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Container(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: AppImage(
                      path: AppImages.forceUpdate,
                      width: 90,
                      height: 90,
                    ),
                  ),
                  const Gap(16),
                  Center(
                    child: Text(
                      'New version available',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textMed16,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    'There are new features available, please update your app',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.text12.copyWith(color: AppColors.gray),
                  ),
                  const Gap(16),
                  PrimaryButton(
                    text: 'Update',
                    onPressed: () {
                      if (AppConfig.flavor != Environment.production) {
                        Navigator.pop(context);
                        return;
                      }
                      launchStore();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
