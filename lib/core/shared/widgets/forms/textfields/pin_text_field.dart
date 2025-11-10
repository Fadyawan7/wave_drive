import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:rocco_mobile_plugins/rocco_mobile_plugins.dart';

class PinTextField extends StatelessWidget {
  const PinTextField({
    super.key,
    this.length = 4,
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
      width: 35,
      height: 46,

      textStyle: AppTextStyles.textMed20.copyWith(color: AppColors.white),
      decoration: BoxDecoration(
        color: AppColors.black11,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.white.withValues(alpha: .1)),
        boxShadow: [
          BoxShadow(blurRadius: 1, color: Colors.black.withOpacity(.1)),
        ],
      ),
    );

    final focusedTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.purple),
      color: AppColors.black,
      boxShadow: [
        BoxShadow(blurRadius: 1, color: Colors.black.withOpacity(.3)),
      ],
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
