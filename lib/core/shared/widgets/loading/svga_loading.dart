import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SVGALoading extends StatelessWidget {
  const SVGALoading({super.key});

  @override
  Widget build(BuildContext context) {
    // return SVGAWidget(
    //   assetUrl: AppSvga.loading,
    //   isRepeat: true,
    //   size: Size.fromHeight(MediaQuery.sizeOf(context).width),
    // );

    return Center(child: CircularProgressIndicator(color: AppColors.primaryD0));
  }
}
