import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/border/gradient_box_border.dart';
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
    this.maxLength,
    this.isRequired = false,
    this.onChanged,
    this.initialValue,
    this.isUnderlineBorder = false,
    this.textAlign,
    this.controller,
  });
  final TextEditingController? controller;
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
  final int? maxLength;
  final bool isRequired;
  final Function(String?)? onChanged;
  final String? initialValue;
  final bool isUnderlineBorder;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
            border: GradientBoxBorder(
              gradient: AppColors.gradientbutton,
              borderRadius: BorderRadius.circular(40),
            ),
            borderRadius: BorderRadius.circular(40),
            gradient: AppColors.gradienttextfield,
          ),
          child: FormBuilderTextField(
            maxLength: maxLength,
            buildCounter:
                (
                  BuildContext context, {
                  required int currentLength,
                  required bool isFocused,
                  required int? maxLength,
                }) {
                  return null;
                },
            controller: controller,
            name: name,
            validator: validator,
            style: AppTextStyles.textMed14,
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
              // errorBorder: const OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(40)),
              //   borderSide: BorderSide(color: AppColors.error),
              // ),
              errorStyle: const TextStyle(fontSize: 0),
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
              hintStyle: AppTextStyles.text14.copyWith(
                color: AppColors.black6A,
              ),
              fillColor: Colors.transparent,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(40.r),
              ),
              labelText: isRequired ? null : labelText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: AppTextStyles.text14.copyWith(color: AppColors.gray),
              floatingLabelStyle: AppTextStyles.text14.copyWith(
                color: AppColors.gray,
              ),
              label: isRequired
                  ? RequiredTextFiledLabel(label: labelText ?? '')
                  : null,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Builder(
          builder: (context) {
            final field = FormBuilder.of(context)?.fields[name];
            if (field != null && field.hasError) {
              return Padding(
                padding: EdgeInsets.only(left: 18.w),
                child: Text(
                  field.errorText ?? '',
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
