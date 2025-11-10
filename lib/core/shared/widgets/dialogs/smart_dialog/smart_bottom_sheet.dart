// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';

Future<T?> showAppBottomSheet<T>({
  required Widget child,
  bool showHeaderDivider = false,
  bool isDismissible = false,
  bool showBackgroundImage = true,
  String? tag,
  Color? background,
  EdgeInsets? padding,
}) {
  return SmartDialog.show(
    tag: tag,
    backDismiss: isDismissible,
    clickMaskDismiss: isDismissible,
    alignment: Alignment.bottomCenter,
    builder: (context) {
      return Container(
        constraints: BoxConstraints(
          minHeight: 200,
          maxHeight: MediaQuery.sizeOf(context).height * .85,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: background ?? Colors.black,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Stack(
          children: [
            if (showBackgroundImage)
              const Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  child: AppImage(path: AppImages.bottomSheetBg),
                ),
              ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showHeaderDivider)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppColors.stroke,
                          borderRadius: BorderRadius.circular(99),
                        ),
                      ),
                    ),
                  )
                else
                  const SizedBox(height: 8),
                Flexible(
                  child: SingleChildScrollView(
                    padding:
                        padding ??
                        EdgeInsets.only(
                          bottom: MediaQuery.paddingOf(context).bottom + 8,
                          left: 24,
                          right: 24,
                        ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [child],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Future<T?> showDefaultBottomSheet<T>({
  required Widget child,
  bool isDismissible = true,
  String? tag,
  Color? background,
  EdgeInsets? padding,
}) {
  return SmartDialog.show(
    tag: tag,
    backDismiss: isDismissible,
    clickMaskDismiss: isDismissible,
    alignment: Alignment.bottomCenter,
    builder: (context) {
      return Container(
        constraints: BoxConstraints(
          minHeight: 200,
          maxHeight: MediaQuery.sizeOf(context).height * .85,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: background ?? Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.stroke,
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    padding:
                        padding ??
                        EdgeInsets.only(
                          bottom: MediaQuery.paddingOf(context).bottom + 8,
                        ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [child],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
