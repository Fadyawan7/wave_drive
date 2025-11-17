import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';

class AppVerticalDivider extends StatelessWidget {
  const AppVerticalDivider({super.key, 
    this.gap = 10,
    this.color = AppColors.gray,
    this.height = 20.0,
  });
  final double gap;
  final double height;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gap),
      child: Container(
        height: height,
        width: 1.0,
        alignment: Alignment.center,
        color: color,
      ),
    );
  }
}
