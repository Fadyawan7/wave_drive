import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

class RCheckBox extends StatelessWidget {
  const RCheckBox({
    super.key,
    required this.onChanged,
    required this.isChecked,
    this.label,
    this.textStyle,
    this.isDisabled = false,
    this.size,
  });

  final Function(bool) onChanged;
  final bool isChecked;
  final String? label;
  final TextStyle? textStyle;
  final bool isDisabled;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isDisabled ? .4 : 1,
      child: Row(
        children: [
          GestureDetector(
            onTap: isDisabled ? null : () => onChanged(!isChecked),
            child: Container(
              height: size ?? 16,
              width: size ?? 16,
              decoration: BoxDecoration(
                color: isChecked ? AppColors.black11 : null,
                border: Border.all(
                  color: isChecked ? AppColors.black11 : AppColors.grayE3,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: isChecked
                  ? const Icon(Icons.check, size: 14, color: AppColors.white)
                  : const SizedBox.shrink(),
            ),
          ),
          if (label != null) ...[
            const SizedBox(width: 8.0),
            Text(
              label!,
              style:
                  textStyle ??
                  AppTextStyles.textMed16.copyWith(color: AppColors.gray),
            ),
          ],
        ],
      ),
    );
  }
}
