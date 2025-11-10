import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/border/gradient_box_border.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/buttons/secondary_button.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/texts/app_styled_text.dart';

class ConfirmDialog {
  static Future<T?> show<T>({
    String? tag,
    double? width,
    required String title,
    String? description,
    bool isVerticalActions = false,
    TextStyle? titleTextStyle,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    TextAlign? titleTextAlign,
    Function()? onCancel,
    Function()? onConfirm,
    bool hasCancelButton = true,
  }) async {
    return SmartDialog.show(
      tag: tag,
      animationType: SmartAnimationType.fade,
      builder: (context) => Container(
        width: double.infinity,
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
              title,
              textAlign: titleTextAlign,
              style: titleTextStyle ?? AppTextStyles.textMed20,
            ),
            if (description != null) ...[
              const Gap(8),
              AppStyledText(
                description,
                style: AppTextStyles.text14.copyWith(color: AppColors.gray),
                textAlign: TextAlign.center,
              ),
            ],
            const Gap(24),
            if (isVerticalActions) ...[
              Column(
                children: [
                  PrimaryButton(
                    text: confirmText,
                    height: 45,
                    onPressed: () {
                      onConfirm?.call();
                      SmartDialog.dismiss(result: true);
                    },
                  ),
                  if (hasCancelButton) ...[
                    const Gap(12),
                    SecondaryButton(
                      color: AppColors.transparent,
                      text: cancelText,
                      height: 45,
                      fitText: false,
                      onPressed: () {
                        onCancel?.call();
                        SmartDialog.dismiss();
                      },
                    ),
                  ],
                ],
              ),
            ] else ...[
              Row(
                children: [
                  if (hasCancelButton) ...[
                    Expanded(
                      child: SecondaryButton(
                        text: cancelText,
                        color: AppColors.transparent,
                        height: 45,
                        onPressed: () {
                          onCancel?.call();
                          SmartDialog.dismiss();
                        },
                      ),
                    ),
                    const Gap(24),
                  ],
                  Expanded(
                    child: PrimaryButton(
                      text: confirmText,
                      height: 45,
                      onPressed: () {
                        onConfirm?.call();
                        SmartDialog.dismiss(result: true);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class ConfirmLiveDialog {
  static Future<T?> show<T>({
    String? tag,
    double? width,
    required String title,
    String? description,
    bool isVerticalActions = false,
    TextStyle? titleTextStyle,
    String endText = 'Exit',
    String minimizeText = 'Minimize',
    String cancelText = 'Cancel',
    TextAlign? titleTextAlign,
    Function()? onCancel,
    Function()? onEndConfirm,
    Function()? onMinimizeConfirm,
    bool hasCancelButton = true,
  }) async {
    return SmartDialog.show(
      tag: tag,
      animationType: SmartAnimationType.fade,
      builder: (context) => Container(
        width: double.infinity,
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
              title,
              textAlign: titleTextAlign,
              style: titleTextStyle ?? AppTextStyles.textMed20,
            ),
            if (description != null) ...[
              const Gap(8),
              AppStyledText(
                description,
                style: AppTextStyles.text14.copyWith(color: AppColors.gray),
                textAlign: TextAlign.center,
              ),
            ],
            const Gap(24),
            if (isVerticalActions) ...[
              Column(
                children: [
                  PrimaryButton(
                    text: endText,
                    height: 45,
                    onPressed: () {
                      onEndConfirm?.call();
                      SmartDialog.dismiss(result: true);
                    },
                  ),
                  const Gap(8),
                  PrimaryButton(
                    text: minimizeText,
                    height: 45,
                    onPressed: () {
                      onMinimizeConfirm?.call();
                      SmartDialog.dismiss(result: true);
                    },
                  ),
                  if (hasCancelButton) ...[
                    const Gap(12),
                    SecondaryButton(
                      color: AppColors.transparent,
                      text: cancelText,
                      height: 45,
                      fitText: false,
                      onPressed: () {
                        onCancel?.call();
                        SmartDialog.dismiss();
                      },
                    ),
                  ],
                ],
              ),
            ] else ...[
              Row(
                children: [
                  if (hasCancelButton) ...[
                    Expanded(
                      child: SecondaryButton(
                        text: cancelText,
                        color: AppColors.transparent,
                        height: 45,
                        onPressed: () {
                          onCancel?.call();
                          SmartDialog.dismiss();
                        },
                      ),
                    ),
                    const Gap(24),
                  ],
                  Expanded(
                    child: PrimaryButton(
                      text: minimizeText,
                      height: 45,
                      onPressed: () {
                        onMinimizeConfirm?.call();
                        SmartDialog.dismiss(result: true);
                      },
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: PrimaryButton(
                      text: endText,
                      height: 45,
                      onPressed: () {
                        onEndConfirm?.call();
                        SmartDialog.dismiss(result: true);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
