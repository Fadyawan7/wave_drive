import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:rocco_mobile_plugins/rocco_mobile_plugins.dart';

class CircleCheckbox extends StatefulWidget {
  const CircleCheckbox({
    super.key,
    required this.onChanged,
    this.isChecked = false,
    this.label,
    this.textStyle,
    this.isDisabled = false,
    this.size = 20,
    this.borderColor,
    this.colorSelected = AppColors.redFF,
  });

  final Function(bool) onChanged;
  final bool isChecked;
  final String? label;
  final TextStyle? textStyle;
  final bool isDisabled;
  final double size;
  final Color? borderColor;
  final Color colorSelected;

  @override
  State<CircleCheckbox> createState() => _CircleCheckboxState();
}

class _CircleCheckboxState extends State<CircleCheckbox> {
  bool _selected = false;

  @override
  void initState() {
    _selected = widget.isChecked;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CircleCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _selected = widget.isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.isDisabled ? .4 : 1,
      child: Row(
        children: [
          GestureDetector(
            onTap: widget.isDisabled
                ? null
                : () {
                    setState(() {
                      _selected = !_selected;
                    });
                    widget.onChanged(_selected);
                  },
            child: Container(
              height: widget.size,
              width: widget.size,
              decoration: BoxDecoration(
                color: _selected ? widget.colorSelected : null,
                border: Border.all(
                  color: _selected
                      ? widget.colorSelected
                      : widget.borderColor ?? AppColors.white,
                ),
                borderRadius: BorderRadius.circular(99.0),
              ),
              child: _selected
                  ? const Icon(
                      Bootstrap.check,
                      size: 18.0,
                      color: AppColors.white,
                    )
                  : const SizedBox.shrink(),
            ),
          ),
          if (widget.label != null) ...[
            const SizedBox(width: 8.0),
            Text(
              widget.label!,
              style:
                  widget.textStyle ??
                  AppTextStyles.textMed16.copyWith(color: AppColors.gray),
            ),
          ],
        ],
      ),
    );
  }
}
