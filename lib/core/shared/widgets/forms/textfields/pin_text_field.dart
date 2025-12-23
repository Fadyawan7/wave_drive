import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

class PinTextField extends StatelessWidget {
  const PinTextField({
    super.key,
    this.length = 6,
    this.hasError = false,
    this.errorText,
    this.onCompleted,
    this.onChanged,
    required this.pinController,
    this.focusNode,
  });

  final int length;
  final bool hasError;
  final String? errorText;
  final void Function(String)? onCompleted;
  final void Function(String)? onChanged;
  final TextEditingController pinController;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: AppTextStyles.textMed20.copyWith(color: AppColors.black33),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grayE7),
      ),
    );

    final focusedTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primary),
    );

    final errorTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.error),
    );

    return Pinput(
      length: length,
      focusNode: focusNode,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedTheme,
      errorPinTheme: errorTheme,
      errorText: errorText,
      autofocus: true,
      errorTextStyle: AppTextStyles.text12.copyWith(color: AppColors.error),
      forceErrorState: hasError,
      onCompleted: onCompleted,
      onChanged: onChanged,
      controller: pinController,
    );
  }
}
