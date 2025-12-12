import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    this.gap = 10,
    this.padding = 10,
    this.color = AppColors.grayF8,
    this.thickness = 1.0,
    this.width,
    this.radius = 0,
  });

  final double gap;
  final double padding;

  final double thickness;
  final double radius;

  final Color color;

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: gap, horizontal: padding),
      child: Container(
        width: width ?? double.infinity,
        height: thickness,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
