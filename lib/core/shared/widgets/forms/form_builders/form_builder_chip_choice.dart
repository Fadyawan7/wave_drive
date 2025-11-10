import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

/// Field with chips that acts like a list checkboxes.
class FormBuilderChipChoice<T> extends FormBuilderFieldDecoration<List<T>> {
  //TODO: Add documentation
  final Color? backgroundColor;
  final Color? disabledColor;
  final Color? selectedColor;
  final Color? selectedShadowColor;
  final Color? shadowColor;
  final double? elevation;
  final double? pressElevation;
  final List<FormBuilderChipOption<T>> options;
  final MaterialTapTargetSize? materialTapTargetSize;
  final OutlinedBorder? shape;

  // Wrap Settings
  final Axis direction;
  final bool showCheckmark;
  final Clip clipBehavior;
  final Color? checkmarkColor;
  final double runSpacing;
  final double spacing;
  final EdgeInsets? labelPadding;
  final EdgeInsets? padding;
  final TextDirection? textDirection;
  final TextStyle? labelStyle;
  final VerticalDirection verticalDirection;
  final WrapAlignment alignment;
  final WrapAlignment runAlignment;
  final WrapCrossAlignment crossAxisAlignment;

  final int? maxChips;
  final ShapeBorder avatarBorder;

  /// Creates field with chips that acts like a list checkboxes.
  FormBuilderChipChoice({
    super.autovalidateMode = AutovalidateMode.disabled,
    super.enabled,
    super.focusNode,
    super.onSaved,
    super.validator,
    super.decoration,
    super.key,
    super.initialValue,
    required super.name,
    super.restorationId,
    required this.options,
    this.alignment = WrapAlignment.start,
    this.avatarBorder = const CircleBorder(),
    this.backgroundColor,
    this.checkmarkColor,
    this.clipBehavior = Clip.none,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.direction = Axis.horizontal,
    this.disabledColor,
    this.elevation,
    this.labelPadding,
    this.labelStyle,
    this.materialTapTargetSize,
    this.maxChips,
    this.padding,
    this.pressElevation,
    this.runAlignment = WrapAlignment.start,
    this.runSpacing = 0.0,
    this.selectedColor,
    this.selectedShadowColor,
    this.shadowColor,
    this.shape,
    this.showCheckmark = true,
    this.spacing = 16.0,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    super.onChanged,
    super.valueTransformer,
    super.onReset,
  }) : assert((maxChips == null) || ((initialValue ?? []).length <= maxChips)),
       super(
         builder: (FormFieldState<List<T>?> field) {
           final state = field as _FormBuilderChipChoiceState<T>;
           final fieldValue = field.value ?? [];

           return InputDecorator(
             decoration: state.decoration.copyWith(border: InputBorder.none),
             child: Wrap(
               direction: direction,
               alignment: alignment,
               crossAxisAlignment: crossAxisAlignment,
               runAlignment: runAlignment,
               runSpacing: runSpacing,
               spacing: spacing,
               textDirection: textDirection,
               verticalDirection: verticalDirection,
               children: <Widget>[
                 for (final FormBuilderChipOption<T> option in options)
                   FilterChip(
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(42),
                     ),
                     label: option,
                     selected: fieldValue.contains(option.value),
                     avatar: option.avatar,
                     onSelected:
                         state.enabled &&
                             (null == maxChips ||
                                 fieldValue.length < maxChips ||
                                 fieldValue.contains(option.value))
                         ? (selected) {
                             final currentValue = [...fieldValue];
                             selected
                                 ? currentValue.add(option.value)
                                 : currentValue.remove(option.value);

                             field.didChange(currentValue);
                           }
                         : null,
                     side: BorderSide.none,
                     selectedColor: selectedColor ?? AppColors.darkPrimary,
                     disabledColor: disabledColor,
                     backgroundColor: backgroundColor ?? AppColors.grayF0,
                     selectedShadowColor: AppColors.primary,
                     elevation: 0,
                     pressElevation: 0,
                     materialTapTargetSize: materialTapTargetSize,
                     labelStyle:
                         labelStyle ??
                         AppTextStyles.text14.copyWith(
                           color: fieldValue.contains(option.value)
                               ? AppColors.white
                               : AppColors.gray,
                         ),
                     showCheckmark: false,
                     padding: const EdgeInsets.all(4),
                     avatarBorder: avatarBorder,
                   ),
               ],
             ),
           );
         },
       );

  @override
  FormBuilderFieldDecorationState<FormBuilderChipChoice<T>, List<T>>
  createState() => _FormBuilderChipChoiceState<T>();
}

class _FormBuilderChipChoiceState<T>
    extends
        FormBuilderFieldDecorationState<FormBuilderChipChoice<T>, List<T>> {}
