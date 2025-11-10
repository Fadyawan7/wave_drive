// ignore: depend_on_referenced_packages
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wave_drive/core/shared/utils/link_formatter.dart';
import 'package:rocco_mobile_plugins/rocco_mobile_plugins.dart';

class CacheAppImage extends StatelessWidget {
  const CacheAppImage({
    super.key,
    required this.path,
    this.size,
    this.height,
    this.width,
    this.fit,
    this.errorPlaceHolder,
    this.color,
    this.showImageLoading = true,
    this.cacheHeight,
    this.cacheWidth,
    this.maxWidthDiskCache,
    this.loadingPlaceholder,
    this.maxHeightDiskCache,
    this.compressionRatio,
    this.colorBlendMode,
    this.loadStateChanged,
  });

  final int? cacheHeight;
  final int? cacheWidth;
  final Color? color;
  final WidgetBuilder? errorPlaceHolder;
  final WidgetBuilder? loadingPlaceholder;
  final BoxFit? fit;
  final double? height;
  final int? maxHeightDiskCache;
  final int? maxWidthDiskCache;
  final String path;
  final bool showImageLoading;
  final double? size;
  final double? width;
  final double? compressionRatio;
  final BlendMode? colorBlendMode;
  final Function(ExtendedImageState)? loadStateChanged;

  @override
  Widget build(BuildContext context) {
    final emptyWidget = SizedBox(height: size, width: size);
    final loadWidget = SizedBox(
      height: size,
      width: size,
      child: Center(
        child:
            loadingPlaceholder?.call(context) ??
            const CircularProgressIndicator(color: AppColors.primaryDA),
      ),
    );
    final errorWidget = errorPlaceHolder != null
        ? errorPlaceHolder!(context)
        : emptyWidget;

    if (path.isEmpty) return errorWidget;

    final isUrl = Uri.tryParse(path)?.hasAbsolutePath ?? false;

    if (isUrl) {
      final formattedPath = formatFileUrl(path);
      if (path.endsWith('.svg')) {
        return SvgPicture.network(
          formattedPath,
          fit: fit ?? BoxFit.cover,
          width: width ?? size,
          height: height ?? size,
        );
      }
      return CachedNetworkImage(
        imageUrl: formattedPath,
        width: width ?? size,
        height: height ?? size,
        fit: fit ?? BoxFit.cover,
        placeholder: (context, url) =>
            showImageLoading ? loadWidget : emptyWidget,
        errorWidget: (context, url, error) => errorWidget,
      );
    }

    final isPathValid =
        path.endsWith('.png') ||
        path.endsWith('.svg') ||
        path.endsWith('.jpg') ||
        path.endsWith('.jpeg') ||
        path.endsWith('.webp');

    if (!isPathValid) return errorWidget;

    if (path.endsWith('.svg')) {
      return SvgPicture.asset(
        path,
        fit: fit ?? BoxFit.cover,
        width: width ?? size,
        height: height ?? size,
        theme: SvgTheme(
          currentColor: color ?? Colors.black,
          fontSize: size ?? 24,
        ),
        color: color,
      );
    }

    return Image.asset(
      path,
      fit: fit ?? BoxFit.cover,
      width: width ?? size,
      height: height ?? size,
      color: color,
      colorBlendMode: colorBlendMode,
      errorBuilder: (context, error, stackTrace) => errorWidget,
    );
  }
}
