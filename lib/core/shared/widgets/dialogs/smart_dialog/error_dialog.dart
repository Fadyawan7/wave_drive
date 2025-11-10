import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lottie/lottie.dart';
import 'package:wave_drive/core/shared/themes/app_lotties.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class ErrorDialog {
  static Future<void> show(String message) async {
    return SmartDialog.show(
      builder: (context) {
        return Container(
          width: MediaQuery.sizeOf(context).width * .8,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(AppLotties.error, repeat: true, width: 120),
              Text(
                message,
                textAlign: TextAlign.center,
                style: AppTextStyles.text16,
              ),
              const Gap(24),
            ],
          ),
        );
      },
    );
  }
}
