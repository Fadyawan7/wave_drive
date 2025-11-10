import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
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
    this.borderRadius = 8,
    this.hintText,
    this.inputFormatters,
    this.obscureText = false,
    this.prefixIconConstraints,
    this.contentPadding,
    this.onChanged,
    this.controller,
    this.textCapitalization = TextCapitalization.sentences,
    this.maxLength,
    this.maxLines,
  });
  final FocusNode? focusNode;
  final String? labelText;
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? prefixText;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool enable;
  final bool readOnly;
  final bool obscureText;
  final TextInputType? inputType;
  final double borderRadius;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? contentPadding;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.textMed14,
      controller: controller,
      focusNode: focusNode,
      readOnly: readOnly,
      keyboardType: inputType,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      maxLines: obscureText ? 1 : maxLines,
      decoration: InputDecoration(
        prefix: prefix,
        prefixIcon: prefixIcon,
        prefixText: prefixText,
        prefixIconConstraints: prefixIconConstraints,
        suffix: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: suffix,
        ),
        suffixIcon: suffixIcon,
        hintText: hintText,
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(horizontal: 20),
        hintStyle: AppTextStyles.text10.copyWith(color: AppColors.gray),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.gray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: const BorderSide(color: AppColors.gray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: const BorderSide(color: AppColors.gray),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: const BorderSide(color: AppColors.grayF1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: AppTextStyles.text16.copyWith(color: AppColors.gray),
        floatingLabelStyle: AppTextStyles.text16.copyWith(
          color: AppColors.gray,
        ),
      ),
      onChanged: onChanged,
      textCapitalization: textCapitalization,
    );
  }
}

//..............................   comment textformfield

class AppCommentTextField extends StatelessWidget {
  const AppCommentTextField({
    super.key,
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
    this.borderRadius = 8,
    this.hintText,
    this.inputFormatters,
    this.obscureText = false,
    this.prefixIconConstraints,
    this.contentPadding,
    this.onChanged,
    this.controller,
    this.colorborder,
    this.textCapitalization = TextCapitalization.sentences,
    this.maxLength,
    this.maxLines,
  });
  final FocusNode? focusNode;
  final String? labelText;
  final Widget? prefix;
  final Color? colorborder;

  final Widget? prefixIcon;
  final String? prefixText;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool enable;
  final bool readOnly;
  final bool obscureText;
  final TextInputType? inputType;
  final double borderRadius;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? contentPadding;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.textMed14,
      controller: controller,
      focusNode: focusNode,
      readOnly: readOnly,
      keyboardType: inputType,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      maxLines: obscureText ? 1 : maxLines,
      decoration: InputDecoration(
        prefix: prefix,
        prefixIcon: prefixIcon,
        prefixText: prefixText,
        prefixIconConstraints: prefixIconConstraints,
        suffix: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: suffix,
        ),
        suffixIcon: suffixIcon,
        hintText: hintText,
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(horizontal: 20),
        hintStyle: AppTextStyles.text14.copyWith(color: AppColors.gray),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colorborder ?? AppColors.gray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: BorderSide(color: colorborder ?? AppColors.gray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: const BorderSide(color: AppColors.gray),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: const BorderSide(color: AppColors.grayF1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: AppTextStyles.text16.copyWith(color: AppColors.gray),
        floatingLabelStyle: AppTextStyles.text16.copyWith(
          color: AppColors.gray,
        ),
      ),
      onChanged: onChanged,
      textCapitalization: textCapitalization,
    );
  }
}
