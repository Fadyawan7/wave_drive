import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

class FormBuilderFillTextField extends StatelessWidget {
  const FormBuilderFillTextField({
    super.key,
    required this.name,
    this.initialValue,
    this.validator,
    this.labelText,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    this.prefixText,
    this.enable = true,
    this.readOnly = false,
    this.focusNode,
    this.inputType,
    this.autofocus = false,
    this.borderRadius = 0,
    this.hintText,
    this.inputFormatters,
    this.obscureText = false,
    this.prefixIconConstraints,
    this.contentPadding,
    this.onChanged,
    this.maxLines = 1,
    this.suffixIconConstraints,
    this.fillColor,
    this.hintColor,
    this.focusColor,
    this.textColor,
    this.maxLength,
  });

  final String name;
  final String? initialValue;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String? labelText;
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? prefixText;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffix;
  final Widget? suffixIcon;
  final int? maxLength;

  final bool enable;
  final bool readOnly;
  final bool autofocus;
  final bool obscureText;
  final TextInputType? inputType;
  final double borderRadius;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? contentPadding;
  final Function(String? text)? onChanged;
  final int maxLines;
  final BoxConstraints? suffixIconConstraints;
  final Color? fillColor;
  final Color? hintColor;
  final Color? focusColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      autofocus: autofocus,
      name: name,
      validator: validator,
      style: AppTextStyles.textMed14.copyWith(
        fontWeight: FontWeight.w500,
        color: textColor ?? AppColors.black,
      ),
      focusNode: focusNode,
      readOnly: readOnly,
      keyboardType: inputType,
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      initialValue: initialValue,
      maxLines: maxLines,
      maxLength: maxLength,
      buildCounter: maxLength != null
          ? (_, {required currentLength, required isFocused, maxLength}) => null
          : null,
      decoration: InputDecoration(
        prefix: prefix,
        prefixIcon: prefixIcon,
        prefixText: prefixText,
        filled: true,
        fillColor: fillColor ?? AppColors.white,
        prefixIconConstraints: prefixIconConstraints,
        suffix: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: suffix,
        ),
        suffixIcon: suffixIcon,
        suffixIconConstraints: suffixIconConstraints,
        hintText: hintText,
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(horizontal: 20),
        hintStyle: AppTextStyles.text14.copyWith(
          color: hintColor ?? AppColors.gray,
        ),

        /// ✅ NORMAL BORDER
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: const BorderSide(color: AppColors.gray, width: 0.2),
        ),

        /// ✅ FOCUSED BORDER (Purple)
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: BorderSide(color: AppColors.purple, width: 1.0),
        ),

        /// ⚠️ DISABLED BORDER
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: const BorderSide(color: AppColors.white),
        ),

        /// ✅ ERROR
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: const BorderSide(color: AppColors.error, width: 1.6),
        ),

        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: AppTextStyles.text16.copyWith(color: AppColors.gray),
        floatingLabelStyle: AppTextStyles.text16.copyWith(
          color: AppColors.gray,
        ),
      ),
    );
  }
}
