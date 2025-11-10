import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class AppOverlay {
  static void showProgressLoading() {
    EasyLoading.instance
      ..userInteractions = false
      ..dismissOnTap = false;
    //  ..loadingStyle = EasyLoadingStyle.custom
    // ..backgroundColor = Colors.transparent
    // ..indicatorColor = Colors.transparent
    // ..animationDuration = Duration.zero
    // ..textColor = Colors.transparent
    // ..maskColor = Colors.white.withOpacity(.5)
    // ..boxShadow = <BoxShadow>[];

    EasyLoading.show(
      // indicator: const SVGALoading(),
      //maskType: EasyLoadingMaskType.custom,
    );
  }

  static void hideProgressLoading() {
    EasyLoading.dismiss();
  }

  static void showTransparentOverlay() {
    EasyLoading.instance
      ..userInteractions = false
      ..dismissOnTap = false
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.white
      ..indicatorColor = Colors.transparent
      ..maskColor = Colors.transparent
      ..textColor = Colors.black
      ..boxShadow = <BoxShadow>[];

    EasyLoading.show(
      indicator: const SizedBox(),
      maskType: EasyLoadingMaskType.custom,
    );
  }

  static void hideTransparentOverlay() {
    EasyLoading.dismiss();
  }

  static void showToastSuccess(
    String message, {
    EasyLoadingToastPosition toastPosition = EasyLoadingToastPosition.top,
  }) {
    BotToast.showNotification(
      title: (cancelFunc) => Row(
        children: [
          const Icon(Icons.check_circle_outline, color: AppColors.green65),
          const Gap(8),
          Text(
            message,
            style: AppTextStyles.textMed12.copyWith(color: AppColors.white),
            maxLines: 1,
          ),
        ],
      ),
      backgroundColor: AppColors.darkPrimary,
      duration: const Duration(seconds: 4),
    );
  }

  static void showNotification(
    String message, {
    EasyLoadingToastPosition toastPosition = EasyLoadingToastPosition.top,
  }) {
    BotToast.showNotification(
      title: (cancelFunc) => Row(
        children: [
          const Icon(Icons.info_outline, color: AppColors.blue00),
          const Gap(8),
          Expanded(
            child: Text(
              message,
              style: AppTextStyles.textMed12.copyWith(color: AppColors.white),
              maxLines: 2,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.darkPrimary,
      duration: const Duration(seconds: 4),
    );
  }

  static void showToast(
    String message, {
    EasyLoadingToastPosition toastPosition = EasyLoadingToastPosition.bottom,
  }) {
    EasyLoading.instance
      ..displayDuration = const Duration(seconds: 3)
      ..backgroundColor = AppColors.black.withOpacity(0.6)
      ..indicatorColor = Colors.transparent
      ..textColor = AppColors.white
      ..boxShadow = <BoxShadow>[]
      ..userInteractions = true
      ..toastPosition = toastPosition
      ..userInteractions = true
      ..dismissOnTap = false;
    EasyLoading.showToast(message);
  }

  static void showToastError(String message) {
    EasyLoading.instance
      ..displayDuration = const Duration(seconds: 4)
      ..contentPadding = const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      )
      ..textStyle = AppTextStyles.text12.copyWith(color: AppColors.red)
      ..toastPosition = EasyLoadingToastPosition.bottom
      ..textAlign = TextAlign.left
      ..backgroundColor = AppColors.black.withOpacity(0.6)
      ..userInteractions = true
      ..dismissOnTap = false;

    EasyLoading.showToast(message, maskType: EasyLoadingMaskType.none);
  }
}
