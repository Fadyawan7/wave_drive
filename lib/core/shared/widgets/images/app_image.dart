import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wave_drive/core/shared/utils/link_formatter.dart';
import 'package:wave_drive/core/shared/widgets/images/app_network_image.dart';
import 'package:rocco_mobile_plugins/rocco_mobile_plugins.dart';

class AppImage extends StatelessWidget {
  const AppImage({
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
    this.maxHeightDiskCache,
    this.compressionRatio,
    this.colorBlendMode,
    this.loadStateChanged,
    this.loadingWidget,
  });

  final int? cacheHeight;
  final int? cacheWidth;
  final Color? color;
  final WidgetBuilder? errorPlaceHolder;
  final Widget? loadingWidget;
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
    final errorWidget = errorPlaceHolder != null
        ? errorPlaceHolder!(context)
        : emptyWidget;

    final isUrl = Uri.parse(path).isAbsolute;

    if (!path.contains('assets') || isUrl) {
      if (path.isEmpty) return errorWidget;

      final formattedPath = formatFileUrl(path);
      if (path.endsWith('.svg')) {
        return SvgPicture.network(
          formattedPath,
          fit: fit ?? BoxFit.cover,
          width: width ?? size,
          height: height ?? size,
        );
      }

      return AppNetworkImage(
        formattedPath,
        width: width ?? size,
        height: height ?? size,
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight,
        fit: fit ?? BoxFit.cover,
        compressionRatio: compressionRatio,
        errorWidget: errorWidget,
        loadStateChanged: loadStateChanged,
        loadingWidget: loadingWidget,
      );
    }

    final isPathValid =
        path.isNotEmpty &&
        (path.endsWith('.png') ||
            path.endsWith('.svg') ||
            path.endsWith('.jpg') ||
            path.endsWith('.jpeg') ||
            path.endsWith('.gif') ||
            path.endsWith('.webp'));

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
        // ignore: deprecated_member_use
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
