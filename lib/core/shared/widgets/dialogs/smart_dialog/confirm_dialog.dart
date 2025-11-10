import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/border/gradient_box_border.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/buttons/secondary_button.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/timer_count_down.dart';

class SmartConfirmDialog {
  static Future<T?> show<T>({
    double? width,
    required String title,
    String? description,
    bool isVerticalActions = false,
    TextStyle? titleTextStyle,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    TextAlign? titleTextAlign,
    bool isAutoClose = false,
    Function()? onCancel,
    required Function() onConfirm,
  }) async {
    return SmartDialog.show(
      animationType: SmartAnimationType.fade,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.sizeOf(context).width * .8,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            border: GradientBoxBorder(
              width: 3,
              gradient: AppColors.gradientbutton,
              borderRadius: BorderRadius.circular(12),
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: titleTextAlign ?? TextAlign.center,
                style: titleTextStyle ?? AppTextStyles.textMed16,
              ),
              if (isAutoClose) ...[
                Countdown(
                  seconds: 15,
                  build: (_, count) {
                    return Text(
                      '(${count.toStringAsFixed(0)})',
                      style: AppTextStyles.textMed14,
                    );
                  },
                  onFinished: () {
                    SmartDialog.dismiss();
                  },
                ),
              ],
              if (description != null) ...[
                const Gap(8),
                Text(
                  description,
                  style: AppTextStyles.text14.copyWith(color: AppColors.gray),
                  textAlign: TextAlign.center,
                ),
              ],
              const Gap(16),
              if (isVerticalActions) ...[
                Column(
                  children: [
                    PrimaryButton(
                      text: confirmText,
                      height: 40,
                      onPressed: onConfirm,
                    ),
                    const Gap(12),
                    SecondaryButton(
                      text: cancelText,
                      height: 40,
                      fitText: false,
                      onPressed: onCancel,
                    ),
                  ],
                ),
              ] else ...[
                Row(
                  children: [
                    Expanded(
                      child: SecondaryButton(
                        color: AppColors.transparent,
                        text: 'Cancel',
                        textStyle: AppTextStyles.textMed16.copyWith(
                          color: AppColors.black,
                        ),
                        height: 40,
                        onPressed: () async {
                          await SmartDialog.dismiss();
                          onCancel?.call();
                        },
                      ),
                    ),
                    const Gap(12),
                    Expanded(
                      child: PrimaryButton(
                        text: 'Confirm',
                        height: 40,
                        onPressed: () async {
                          await SmartDialog.dismiss();
                          onConfirm();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
