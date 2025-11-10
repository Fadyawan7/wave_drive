import 'package:flutter/material.dart';
import 'package:wave_drive/core/routes/app_navigator.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/timer_count_down.dart';

class CountDownDialog {
  static Future<T?> show<T>(BuildContext rContext, {int seconds = 3}) async {
    return showGeneralDialog(
      context: rContext,
      barrierColor: AppColors.black.withOpacity(.8),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Countdown(
          seconds: seconds,
          build: (context, count) {
            return Center(
              child: Text(
                count.toStringAsFixed(0),
                style: AppTextStyles.textMed10.copyWith(
                  color: AppColors.white,
                  fontSize: 96,
                ),
              ),
            );
          },
          onFinished: () {
            AppNavigator.pop(rContext);
          },
        );
      },
    );
  }
}
