import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wave_drive/core/shared/widgets/forms/textfields/radio_button.dart';

class AppGroupedRadio<T> extends StatefulWidget {
  final List<FormBuilderFieldOption<T>> options;
  final T? value;
  final List<T>? disabled;
  final OptionsOrientation orientation;
  final ValueChanged<T?> onChanged;
  final Color? activeColor;
  final MaterialTapTargetSize? materialTapTargetSize;
  final Color? focusColor;
  final Color? hoverColor;
  final Axis wrapDirection;
  final WrapAlignment wrapAlignment;
  final double wrapSpacing;
  final WrapAlignment wrapRunAlignment;
  final double wrapRunSpacing;
  final WrapCrossAlignment wrapCrossAxisAlignment;
  final TextDirection? wrapTextDirection;
  final VerticalDirection wrapVerticalDirection;
  final Widget? separator;
  final ControlAffinity controlAffinity;

  const AppGroupedRadio({
    super.key,
    required this.options,
    required this.orientation,
    required this.onChanged,
    this.value,
    this.disabled,
    this.activeColor,
    this.focusColor,
    this.hoverColor,
    this.materialTapTargetSize,
    this.wrapDirection = Axis.horizontal,
    this.wrapAlignment = WrapAlignment.start,
    this.wrapSpacing = 0.0,
    this.wrapRunAlignment = WrapAlignment.start,
    this.wrapRunSpacing = 0.0,
    this.wrapCrossAxisAlignment = WrapCrossAlignment.start,
    this.wrapTextDirection,
    this.wrapVerticalDirection = VerticalDirection.down,
    this.separator,
    this.controlAffinity = ControlAffinity.leading,
  });

  @override
  State<AppGroupedRadio<T?>> createState() => _AppGroupedRadioState<T>();
}

class _AppGroupedRadioState<T> extends State<AppGroupedRadio<T?>> {
  @override
  Widget build(BuildContext context) {
    final widgetList = <Widget>[];
    for (int i = 0; i < widget.options.length; i++) {
      widgetList.add(_buildRadioButton(i));
    }

    switch (widget.orientation) {
      case OptionsOrientation.vertical:
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widgetList,
          ),
        );
      case OptionsOrientation.horizontal:
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: widgetList),
        );
      case OptionsOrientation.wrap:
      default:
        return SingleChildScrollView(
          child: Wrap(
            spacing: widget.wrapSpacing,
            runSpacing: widget.wrapRunSpacing,
            textDirection: widget.wrapTextDirection,
            crossAxisAlignment: widget.wrapCrossAxisAlignment,
            verticalDirection: widget.wrapVerticalDirection,
            alignment: widget.wrapAlignment,
            runAlignment: widget.wrapRunAlignment,
            children: widgetList,
          ),
        );
    }
  }

  Widget _buildRadioButton(int index) {
    final option = widget.options[index];
    final optionValue = option.value;
    final isOptionDisabled = true == widget.disabled?.contains(optionValue);
    final control = RadioButton<T?>(
      groupValue: widget.value,
      activeColor: widget.activeColor,
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      materialTapTargetSize: widget.materialTapTargetSize,
      value: optionValue,
      onChanged: isOptionDisabled
          ? null
          : (T? selected) {
              widget.onChanged(selected);
            },
    );

    final label = GestureDetector(
      onTap: isOptionDisabled
          ? null
          : () {
              widget.onChanged(optionValue);
            },
      child: option,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.controlAffinity == ControlAffinity.leading) control,
            Flexible(child: label),
            if (widget.controlAffinity == ControlAffinity.trailing) control,
            if (widget.orientation != OptionsOrientation.vertical &&
                widget.separator != null &&
                index != widget.options.length - 1)
              widget.separator!,
          ],
        ),
        if (widget.orientation == OptionsOrientation.vertical &&
            widget.separator != null &&
            index != widget.options.length - 1)
          widget.separator!,
      ],
    );
  }
}
