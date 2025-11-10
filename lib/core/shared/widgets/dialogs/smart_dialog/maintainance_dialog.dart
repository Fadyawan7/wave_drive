import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

void showMaintenanceDialog() {
  SmartDialog.show(
    animationType: SmartAnimationType.fade,
    builder: (context) {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Upgrading in Progess", style: AppTextStyles.textMed20),
            const Gap(24),
            PrimaryButton(
              text: "Done",
              onPressed: () {
                SmartDialog.dismiss();
              },
            ),
          ],
        ),
      );
    },
  );
}
