import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:wave_drive/core/routes/app_navigator.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/core/shared/utils/link_formatter.dart';
import 'package:wave_drive/core/shared/widgets/app_overlay.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';

class ImageView extends StatelessWidget {
  final String imageUrl;

  const ImageView({super.key, required this.imageUrl});

  Future<void> _downloadImage() async {
    try {
      AppOverlay.showProgressLoading();
      final formattedPath = formatFileUrl(imageUrl);
      final response = await Dio().get(
        formattedPath,
        options: Options(responseType: ResponseType.bytes),
      );

      if (response.statusCode == 200) {
        final Uint8List bytes = Uint8List.fromList(response.data as List<int>);
        final result = await ImageGallerySaverPlus.saveImage(bytes);

        AppOverlay.hideProgressLoading();
        if (result['isSuccess'] as bool) {
          AppOverlay.showToast("Image saved successfully!");
        }
      }
    } catch (e) {
      AppOverlay.hideProgressLoading();
      AppLogger.d("Image not download $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: _downloadImage,
        child: const Icon(Icons.download, color: Colors.black),
      ),
      appBar: MainAppBar(
        backgroundColor: AppColors.black,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            splashRadius: 20,
            splashColor: AppColors.stroke.withOpacity(.2),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: AppColors.white,
            ),
            onPressed: () {
              AppNavigator.pop(context);
            },
          ),
        ),
      ),
      body: InteractiveViewer(
        child: Hero(
          tag: 'imageHerofamily_$imageUrl',
          child: AppImage(
            path: imageUrl,
            fit: BoxFit.contain,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
