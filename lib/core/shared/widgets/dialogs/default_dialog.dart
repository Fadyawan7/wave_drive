import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';

class DefaultDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    Function()? onPressed,
    double paddingTopButton = 32,
    bool barrierDismissible = true,
    Color? barrierColor,
    required Widget child,
  }) async {
    return showGeneralDialog(
      barrierLabel: 'DefaultDialog',
      barrierDismissible: barrierDismissible,
      context: context,
      barrierColor: barrierColor ?? AppColors.black.withOpacity(.2),
      transitionBuilder: (ctx, anim1, anim2, child) =>
          FadeTransition(opacity: anim1, child: child),
      pageBuilder: (ctx, anim1, anim2) => Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [child],
        ),
      ),
    );
  }
}
