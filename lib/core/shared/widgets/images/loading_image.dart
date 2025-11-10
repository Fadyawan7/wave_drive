import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_images.dart';

class LoadingImage extends StatelessWidget {
  final String imagePath;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const LoadingImage({
    super.key,
    this.imagePath = AppImages.loadingplaceholder,
    this.color,
    this.width,
    this.height,
    this.fit,
  });

  factory LoadingImage.placeholder({
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
  }) {
    return LoadingImage(
      imagePath: AppImages.rCoinBlack,
      color: color ?? AppColors.grayD9,
      width: width,
      height: height,
      fit: fit,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      color: color,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }
}
