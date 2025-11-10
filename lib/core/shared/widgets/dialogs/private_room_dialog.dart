import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/border/gradient_box_border.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/buttons/secondary_button.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/texts/app_styled_text.dart';

class PrivateDialog {
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
    Function(String val)? onConfirm,
    bool hasCancelButton = true,
  }) async {
    final TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormBuilderState>();
    bool obscureText = true;

    return SmartDialog.show(
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return Container(
            width: MediaQuery.sizeOf(context).width * .9,
            decoration: BoxDecoration(
              border: GradientBoxBorder(
                width: 3,
                gradient: AppColors.gradientbutton,
                borderRadius: BorderRadius.circular(16),
              ),
              borderRadius: BorderRadius.circular(16),
              color: AppColors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: FormBuilder(
                key: formKey,
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
                        style: AppTextStyles.text14.copyWith(
                          color: AppColors.gray,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                    const Gap(24),

                    // Centered input field
                    Center(
                      child: SizedBox(
                        width: 280.w,
                        child: TextFormField(
                          obscureText: obscureText,
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "This field is required";
                            }
                            return null;
                          },
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 6,
                            ),
                            isDense: true,
                            fillColor: AppColors.black.withOpacity(.25),
                            hintText: "Please enter room code",
                            hintStyle: AppTextStyles.text14.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.black.withOpacity(.5),
                            ),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.black.withOpacity(0.5),
                              ),
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),

                    const Gap(24),

                    if (isVerticalActions) ...[
                      Column(
                        children: [
                          SizedBox(
                            width: 280.w,
                            child: PrimaryButton(
                              text: confirmText,
                              height: 45,
                              onPressed: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  FocusScope.of(context).unfocus();
                                  onConfirm?.call(
                                    passwordController.text.trim(),
                                  );
                                  SmartDialog.dismiss(result: true);
                                }
                              },
                            ),
                          ),
                          if (hasCancelButton) ...[
                            const Gap(12),
                            SizedBox(
                              width: 280.w,
                              child: SecondaryButton(
                                text: cancelText,
                                color: AppColors.transparent,
                                textStyle: const TextStyle(
                                  color: AppColors.black,
                                ),
                                height: 45,
                                fitText: false,
                                onPressed: () {
                                  onCancel?.call();
                                  SmartDialog.dismiss();
                                },
                              ),
                            ),
                          ],
                        ],
                      ),
                    ] else ...[
                      Center(
                        child: SizedBox(
                          width: 280.w,
                          child: Row(
                            children: [
                              if (hasCancelButton) ...[
                                Expanded(
                                  child: SecondaryButton(
                                    color: AppColors.transparent,
                                    textStyle: const TextStyle(
                                      color: AppColors.black,
                                    ),
                                    text: cancelText,
                                    height: 40,
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
                                  height: 40,
                                  onPressed: () {
                                    if (formKey.currentState?.validate() ??
                                        false) {
                                      FocusScope.of(context).unfocus();
                                      onConfirm?.call(
                                        passwordController.text.trim(),
                                      );
                                      SmartDialog.dismiss(result: true);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
