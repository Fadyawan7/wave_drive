import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wave_drive/core/shared/widgets/forms/textfields/grouped_radio.dart';

class AppFormBuilderRadioGroup extends StatelessWidget {
  const AppFormBuilderRadioGroup({
    super.key,
    required this.options,
    required this.name,
    this.initialValue,
    this.onChanged,
  });

  final List<String> options;
  final String name;
  final String? initialValue;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return _FormBuilderRadioGroup(
      name: name,
      onChanged: onChanged,
      orientation: OptionsOrientation.vertical,
      activeColor: AppColors.purple,
      initialValue: initialValue,
      options: options
          .map(
            (e) => FormBuilderFieldOption(
              value: e,
              child: Text(
                e,
                style: AppTextStyles.text16.copyWith(color: AppColors.gray),
              ),
            ),
          )
          .toList(),
      decoration: const InputDecoration(
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),
    );
  }
}

class _FormBuilderRadioGroup<T> extends FormBuilderFieldDecoration<T> {
  final Axis wrapDirection;
  final Color? activeColor;
  final Color? focusColor;
  final Color? hoverColor;
  final ControlAffinity controlAffinity;
  final double wrapRunSpacing;
  final double wrapSpacing;
  final List<FormBuilderFieldOption<T>> options;
  final List<T>? disabled;
  final MaterialTapTargetSize? materialTapTargetSize;
  final OptionsOrientation orientation;
  final TextDirection? wrapTextDirection;
  final VerticalDirection wrapVerticalDirection;
  final Widget? separator;
  final WrapAlignment wrapAlignment;
  final WrapAlignment wrapRunAlignment;
  final WrapCrossAlignment wrapCrossAxisAlignment;

  /// Creates field to select one value from a list of Radio Widgets
  _FormBuilderRadioGroup({
    super.autovalidateMode = AutovalidateMode.disabled,
    super.enabled,
    super.focusNode,
    super.onSaved,
    super.validator,
    super.decoration,
    super.key,
    required super.name,
    required this.options,
    super.initialValue,
    this.activeColor,
    this.controlAffinity = ControlAffinity.leading,
    this.disabled,
    this.focusColor,
    this.hoverColor,
    this.materialTapTargetSize,
    this.orientation = OptionsOrientation.wrap,
    this.separator,
    this.wrapAlignment = WrapAlignment.start,
    this.wrapCrossAxisAlignment = WrapCrossAlignment.start,
    this.wrapDirection = Axis.horizontal,
    this.wrapRunAlignment = WrapAlignment.start,
    this.wrapRunSpacing = 0.0,
    this.wrapSpacing = 0.0,
    this.wrapTextDirection,
    this.wrapVerticalDirection = VerticalDirection.down,
    super.onChanged,
    super.valueTransformer,
    super.onReset,
    super.restorationId,
  }) : super(
         builder: (FormFieldState<T?> field) {
           final state = field as __FormBuilderRadioGroupState<T>;

           return InputDecorator(
             decoration: state.decoration,
             child: AppGroupedRadio<T>(
               activeColor: activeColor,
               controlAffinity: controlAffinity,
               disabled: state.enabled
                   ? disabled
                   : options.map((option) => option.value).toList(),
               focusColor: focusColor,
               hoverColor: hoverColor,
               materialTapTargetSize: materialTapTargetSize,
               onChanged: (value) {
                 state.didChange(value);
               },
               options: options,
               orientation: orientation,
               separator: separator,
               value: state.value,
               wrapAlignment: wrapAlignment,
               wrapCrossAxisAlignment: wrapCrossAxisAlignment,
               wrapDirection: wrapDirection,
               wrapRunAlignment: wrapRunAlignment,
               wrapRunSpacing: wrapRunSpacing,
               wrapSpacing: wrapSpacing,
               wrapTextDirection: wrapTextDirection,
               wrapVerticalDirection: wrapVerticalDirection,
             ),
           );
         },
       );

  @override
  FormBuilderFieldDecorationState<_FormBuilderRadioGroup<T>, T> createState() =>
      __FormBuilderRadioGroupState<T>();
}

class __FormBuilderRadioGroupState<T>
    extends FormBuilderFieldDecorationState<_FormBuilderRadioGroup<T>, T> {}
