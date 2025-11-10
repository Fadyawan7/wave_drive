import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';

class AppBlurDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    Function()? onPressed,
    double paddingTopButton = 32,
    bool barrierDismissible = true,
    bool canPop = true,
    required Widget child,
  }) async {
    return showGeneralDialog(
      barrierLabel: 'AppBlurDialog',
      barrierDismissible: barrierDismissible,
      context: context,
      barrierColor: AppColors.black.withOpacity(.2),
      transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 25 * anim1.value,
          sigmaY: 25 * anim1.value,
        ),
        child: FadeTransition(opacity: anim1, child: child),
      ),
      pageBuilder: (ctx, anim1, anim2) => WillPopScope(
        onWillPop: () async {
          return canPop;
        },
        child: Material(
          type: MaterialType.transparency,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [child],
          ),
        ),
      ),
    );
  }
}
