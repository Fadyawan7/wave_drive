import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/widgets/loading/svga_loading.dart';

class WebPageOverLay {
  static Future<void> webPageLoadings(
    BuildContext context, {
    Duration delay = const Duration(seconds: 2),
  }) async {
    showDialog(
      barrierColor: AppColors.transparent,
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const SVGALoading();
      },
    );

    await Future.delayed(delay);
  }

  static void hideWebProgressLoading(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}
