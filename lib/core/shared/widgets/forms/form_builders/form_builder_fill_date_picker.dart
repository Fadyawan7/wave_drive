import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:jiffy/jiffy.dart';
import 'package:wave_drive/core/shared/constants/constants.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

class FormBuilderFillDatePicker extends StatefulWidget {
  const FormBuilderFillDatePicker({
    super.key,
    required this.name,
    this.displayFormat = "dd/MM/yyyy",
    this.validator,
    this.initialValue,
    this.labelText,
    this.prefix,
    this.suffix,
    this.suffixIcon,
    this.enable = true,
    this.readOnly = false,
    this.focusNode,
    this.inputType,
    this.borderRadius = 8,
    this.hintText,
    this.inputFormatters,
    this.onChanged,
    this.isDateOfBirth = true,
  });

  final String name;
  final String? initialValue;
  final String displayFormat;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String? labelText;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool enable;
  final bool readOnly;
  final TextInputType? inputType;
  final double borderRadius;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String? text)? onChanged;
  final bool isDateOfBirth;

  @override
  State<FormBuilderFillDatePicker> createState() =>
      _FormBuilderFillDatePickerState();
}

class _FormBuilderFillDatePickerState extends State<FormBuilderFillDatePicker> {
  bool _isFocusing = false;
  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: widget.name,
      validator: widget.validator,
      onChanged: widget.onChanged,
      initialValue: widget.initialValue,
      builder: (field) {
        return GestureDetector(
          onTap: () async {
            setState(() {
              _isFocusing = true;
            });
            await showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) {
                final today = DateTime.now();
                return Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    gradient: AppColors.gradientbg,
                  ),
                  child: CupertinoTheme(
                    data: const CupertinoThemeData(
                      brightness: Brightness.light,
                    ),
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,

                      //    backgroundColor: Colors.white,
                      initialDateTime: widget.initialValue == null
                          ? DateTime(
                              today.year - minimumAge,
                              today.month,
                              today.day,
                            )
                          : Jiffy.parse(
                              widget.initialValue!,
                              pattern: widget.displayFormat,
                            ).dateTime,
                      onDateTimeChanged: (DateTime newDateTime) {
                        field.didChange(
                          Jiffy.parseFromDateTime(
                            newDateTime,
                          ).format(pattern: appDateTimeFormat),
                        );
                        field.validate();
                      },
                      maximumDate: widget.isDateOfBirth
                          ? DateTime(
                              today.year - minimumAge,
                              today.month,
                              today.day,
                            )
                          : null,
                    ),
                  ),
                );
              },
            );
            setState(() {
              _isFocusing = false;
            });
          },
          behavior: HitTestBehavior.opaque,
          child: InputDecorator(
            isFocused: _isFocusing,
            decoration: InputDecoration(
              suffix: widget.suffix,
              fillColor: Colors.white,
              filled: true,
              errorText: field.errorText,
              hintText: widget.hintText,
              prefixIcon: widget.prefix,
              hintStyle: AppTextStyles.text14.copyWith(color: AppColors.gray),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grayF1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: const BorderSide(color: AppColors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: const BorderSide(color: AppColors.white),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: const BorderSide(color: AppColors.grayF1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: const BorderSide(color: AppColors.error),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: const BorderSide(color: AppColors.error),
              ),
              labelText: widget.labelText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: AppTextStyles.text16.copyWith(color: AppColors.gray),
              floatingLabelStyle: AppTextStyles.text16.copyWith(
                color: AppColors.gray,
              ),
            ),
            child: field.value == null
                ? Text(
                    widget.hintText ?? "",
                    style: AppTextStyles.text14.copyWith(color: AppColors.gray),
                  )
                : Text('${field.value}', style: AppTextStyles.textMed14),
          ),
        );
      },
    );
  }
}
