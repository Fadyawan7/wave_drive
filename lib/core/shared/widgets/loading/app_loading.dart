import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({
    super.key,
    this.color = AppColors.primaryD1,
    this.size = 24,
  });

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      widthFactor: 1,
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(strokeWidth: 2, color: color),
      ),
    );
  }
}
