import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/texts/required_text_filed_label.dart';

class FormBuilderOutlineTextField extends StatelessWidget {
  const FormBuilderOutlineTextField({
    super.key,
    required this.name,
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
    this.borderRadius = 8,
    this.hintText,
    this.inputFormatters,
    this.obscureText = false,
    this.prefixIconConstraints,
    this.contentPadding,
    this.maxLines = 1,
    this.isRequired = false,
    this.onChanged,
    this.initialValue,
    this.isUnderlineBorder = false,
    this.textAlign,
    this.autovalidateMode,
    this.maxLength,
  });
  final String name;
  final String? Function(String?)? validator;
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
  final int? maxLines;
  final bool isRequired;
  final Function(String?)? onChanged;
  final String? initialValue;
  final bool isUnderlineBorder;
  final TextAlign? textAlign;
  final AutovalidateMode? autovalidateMode;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      buildCounter: (_,
              {required int currentLength,
              required bool isFocused,
              required int? maxLength}) =>
          null,
      maxLength: maxLength,
      name: name,
      validator: validator,
      style: AppTextStyles.textMed14.copyWith(color: AppColors.primary),
      focusNode: focusNode,
      readOnly: readOnly,
      keyboardType: inputType,
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      onChanged: onChanged,
      initialValue: initialValue,
      textAlign: textAlign ?? TextAlign.start,
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
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 18,
            ),
        hintStyle: AppTextStyles.text14.copyWith(color: AppColors.grayA9),
        border:  OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grayE7)),
        enabledBorder: isUnderlineBorder
            ? const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.grayE7),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                borderSide: const BorderSide(color: AppColors.grayE8),
              ),
        focusedBorder: isUnderlineBorder
            ? const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
        disabledBorder: isUnderlineBorder
            ? const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.grayF1),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                borderSide: const BorderSide(color: AppColors.grayE8),
              ),
        errorBorder: isUnderlineBorder
            ? const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.error),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                borderSide: const BorderSide(color: AppColors.error),
              ),
        focusedErrorBorder: isUnderlineBorder
            ? const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.error),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                borderSide: const BorderSide(color: AppColors.error),
              ),
        labelText: isRequired ? null : labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: AppTextStyles.text14.copyWith(color: AppColors.gray),
        floatingLabelStyle:
            AppTextStyles.text14.copyWith(color: AppColors.gray),
        label:
            isRequired ? RequiredTextFiledLabel(label: labelText ?? '') : null,
      ),
    );
  }
}

class MonthYearInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text.replaceAll('/', '');

    // Limit to 6 digits (MMYYYY)
    if (text.length > 6) text = text.substring(0, 6);

    String newText = '';
    for (int i = 0; i < text.length; i++) {
      if (i == 2) newText += '/';
      newText += text[i];
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}





class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');
    final buffer = StringBuffer();
    for (int i = 0; i < digitsOnly.length; i++) {
      buffer.write(digitsOnly[i]);
      if ((i + 1) % 4 == 0 && i + 1 != digitsOnly.length) {
        buffer.write(' ');
      }
    }
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
