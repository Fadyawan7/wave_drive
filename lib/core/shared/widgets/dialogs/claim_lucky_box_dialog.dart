import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/dialogs/app_blur_dialog.dart';

class ClaimLucyBoxDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    double? width,
    Function()? onOpenBox,
  }) async {
    return AppBlurDialog.show(
      context,
      child: Container(
        width: width ?? double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          //color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 175,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: AppColors.red,
              ),
            ),
            Positioned(
              top: 160,
              left: 0,
              right: 0,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.gray,
                ),
                child: const Column(children: [Text("Je;;;p ")]),
              ),
            ),
            const Positioned(
              top: 340,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: PrimaryButton(text: "Open the Box"),
              ),
            ),
            const Positioned(
              top: 400,
              left: 0,
              right: 0,
              child: Center(
                child: Icon(Icons.close_outlined, color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
