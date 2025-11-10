import 'package:flutter/material.dart';
import 'package:wave_drive/core/routes/routes.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class DefaultBottomSheet {
  static Future<T?> show<T>(
    BuildContext context, {
    bool barrierDismissible = true,
    double? boarder,
    bool showDivider = true,
    bool isCenterHeader = true,
    required Widget child,
    Widget? header,
    Widget? footer,
    bool hasCloseButton = false,
    double? closeButtonTop,
    double? closeButtonRight,
    LinearGradient? gradient,
    Color? color,
    Color? closeBtnColor,
  }) async {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: barrierDismissible,
      isScrollControlled: true, // ✅ allows full height adjustment
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(boarder ?? 24.0),
        ),
      ),
      builder: (context) {
        return Padding(
          // ✅ Adds space for keyboard when content grows
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: color ?? Colors.white,
              gradient: gradient,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(boarder ?? 24.0),
                topRight: Radius.circular(boarder ?? 24.0),
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min, // ✅ auto height based on content
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (showDivider) ...[
                        Center(
                          child: Container(
                            width: 45,
                            height: 4,
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: AppColors.gray72,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                      if (header != null)
                        Align(
                          alignment: isCenterHeader
                              ? Alignment.center
                              : Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: header,
                          ),
                        ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: child,
                          ),
                        ),
                      ),
                      if (footer != null) footer,
                      const Gap(12),
                    ],
                  ),
                ),

                // ✅ Optional close button
                if (hasCloseButton)
                  Positioned(
                    top: closeButtonTop ?? 8,
                    right: closeButtonRight ?? 8,
                    child: IconButton(
                      icon: Icon(
                        Icons.close_rounded,
                        size: 20,
                        color: closeBtnColor ?? AppColors.gray,
                      ),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        AppNavigator.pop(context);
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
