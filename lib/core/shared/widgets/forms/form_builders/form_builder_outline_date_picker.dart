import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';
import 'package:wave_drive/core/shared/constants/constants.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/utils/date_time_format.dart';
import 'package:wave_drive/core/shared/widgets/border/gradient_box_border.dart';

class FormBuilderOutlineDatePicker extends StatefulWidget {
  const FormBuilderOutlineDatePicker({
    super.key,
    required this.name,
    this.displayFormat = "dd/MM/yyyy",
    this.validator,
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
    this.isRequired = true,
    this.initialValue,
    this.isDateOfBirth = true,
  });
  final String name;
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
  final bool isRequired;
  final String? initialValue;
  final bool isDateOfBirth;

  @override
  State<FormBuilderOutlineDatePicker> createState() =>
      _FormBuilderOutlineDatePickerState();
}

class _FormBuilderOutlineDatePickerState
    extends State<FormBuilderOutlineDatePicker> {
  bool _isFocusing = false;

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
          child: FormBuilderField(
            name: widget.name,
            validator: widget.validator,
            initialValue:
                (widget.initialValue == null || widget.initialValue == "")
                ? null
                : convertServerDateTime(widget.initialValue!),
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
                        color: Colors.white,
                        child: CupertinoTheme(
                          data: const CupertinoThemeData(
                            brightness: Brightness.light,
                          ),
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            backgroundColor: Colors.white,
                            initialDateTime:
                                (widget.initialValue != null &&
                                    widget.initialValue!.isNotEmpty)
                                ? DateTime.parse(widget.initialValue!)
                                : DateTime(
                                    today.year - minimumAge,
                                    today.month,
                                    today.day,
                                  ),

                            minimumDate: DateTime(
                              today.year - 99,
                              today.month,
                              today.day,
                            ),
                            onDateTimeChanged: (DateTime newDateTime) {
                              field.didChange(
                                Jiffy.parseFromDateTime(
                                  newDateTime,
                                ).format(pattern: widget.displayFormat),
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
                    filled: true,
                    prefix: widget.prefix,
                    suffix: widget.suffix,
                    errorText: field.errorText,
                    // suffixIcon: const Icon(Icons.keyboard_arrow_down,
                    //     size: 24, color: AppColors.purpleC4),
                    hintText: widget.hintText,
                    errorStyle: TextStyle(fontSize: 0),
                    hintStyle: AppTextStyles.text14.copyWith(
                      color: AppColors.gray,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.transparent,

                    labelText: widget.isRequired ? null : widget.labelText,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: AppTextStyles.text16.copyWith(
                      color: AppColors.gray,
                    ),
                    floatingLabelStyle: AppTextStyles.text16.copyWith(
                      color: AppColors.gray,
                    ),
                    // label: widget.isRequired
                    //     ? RequiredTextFiledLabel(
                    //         label: widget.labelText ?? 'Date of Birth')
                    //     : null,
                  ),
                  child: field.value == null
                      ? Text(
                          widget.hintText ?? "",
                          style: AppTextStyles.text14.copyWith(
                            color: AppColors.black6A,
                          ),
                        )
                      : Text('${field.value}', style: AppTextStyles.textMed14),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 4),
        Builder(
          builder: (context) {
            final field = FormBuilder.of(context)?.fields[widget.name];
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
