import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class AppBlurBottomSheet {
  static Future<T?> show<T>(
    BuildContext context, {
    bool barrierDismissible = true,
    double? heightFactor,
    bool hideBackground = false,
    required Widget child,
  }) async {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: barrierDismissible,
      backgroundColor: Colors.transparent,
      elevation: 0,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
      ),
      builder: (context) => FractionallySizedBox(
        heightFactor: heightFactor ?? .5,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            decoration: BoxDecoration(
              color: hideBackground ? Colors.transparent : Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0),
              ),
            ),
            child: Column(
              children: [
                const Gap(8),
                if (hideBackground)
                  const SizedBox()
                else
                  Container(
                    width: 45,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.gray,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                Expanded(child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppWalletBottomSheet {
  static Future<T?> show<T>(
    BuildContext context, {
    bool barrierDismissible = true,
    double? heightFactor,
    bool hideBackground = false,
    required Widget child,
  }) async {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: barrierDismissible,
      //  backgroundColor: AppColors.transparent,
      //  elevation: 0,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
      ),
      builder: (context) => FractionallySizedBox(
        heightFactor: heightFactor ?? .5,
        child: Container(
          decoration: BoxDecoration(
            gradient: AppColors.gradientbottomsheet,
            //     color: hideBackground ? Colors.transparent : Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Column(
            children: [
              const Gap(8),
              if (hideBackground)
                const SizedBox()
              else
                Container(
                  width: 45,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.gray,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}
