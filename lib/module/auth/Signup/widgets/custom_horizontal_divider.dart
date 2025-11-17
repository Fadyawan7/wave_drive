import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';

class CustomHorizontalDivider extends StatelessWidget {
  final double thickness;
  final double indent;
  final double endIndent;
  final int activeSections;

  const CustomHorizontalDivider({
    super.key,
    this.thickness = 5,
    this.indent = 1,
    this.endIndent = 1,
    required this.activeSections,
  });

  @override
  Widget build(BuildContext context) {
    // Clamp activeSections between 0 and 3 to avoid overflow
    final clampedSections = activeSections.clamp(0, 5);

    return Padding(
      padding: EdgeInsets.only(left: indent, right: endIndent),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          children: List.generate(5, (index) {
            final isActive = index < clampedSections;
            final isSemiActive = index == clampedSections;
            return Expanded(
              child: Container(
                height: thickness,
                color: isActive
                    ? AppColors.primarycolor
                    : isSemiActive
                        ? AppColors.liteprimarycolor
                        : AppColors.inputboxcolor,
                margin: EdgeInsets.symmetric(horizontal: index == 1 ? 5 : 5),
              ),
            );
          }),
        ),
      ),
    );
  }
}
