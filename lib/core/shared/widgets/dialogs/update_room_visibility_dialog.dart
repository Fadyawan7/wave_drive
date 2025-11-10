import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/utils/uuid.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class UpdateRoomDialog {
  static Future<Map<String, dynamic>?> show(
    BuildContext context, {
    required bool isPublic,
    required void Function({String? privateRoomId}) onConfirm,
  }) {
    final TextEditingController codeController = TextEditingController();

    return showGeneralDialog<Map<String, dynamic>>(
      barrierLabel: 'RoomVisiblityDialog',
      barrierDismissible: true,
      context: context,
      pageBuilder: (ctx, anim1, anim2) {
        final isSwitchingToPrivate = isPublic;
        if (isSwitchingToPrivate) {
          codeController.text = generateSixDigitUniqueId();
        }

        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isSwitchingToPrivate
                      ? 'Switch to Private Room'
                      : 'Switch to Public Room',
                  style: AppTextStyles.textMed16.copyWith(
                    color: AppColors.primaryD0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Gap(8),
                Text(
                  isSwitchingToPrivate
                      ? 'Only users with the Private ID can join this room.'
                      : 'Anyone with the room link can now join.',
                  style: AppTextStyles.text12.copyWith(color: AppColors.gray),
                  textAlign: TextAlign.center,
                ),
                const Gap(16),
                if (isSwitchingToPrivate) ...[
                  TextField(
                    readOnly: true,
                    controller: codeController,
                    style: AppTextStyles.text14, // smaller text
                    decoration: InputDecoration(
                      labelText: 'Private ID',
                      labelStyle: AppTextStyles.text12.copyWith(
                        color: AppColors.gray,
                      ),
                      isDense: true, // makes it more compact
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 12,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.gray,
                        ), // default border
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.gray,
                        ), // normal state
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.gray,
                        ), // same as normal
                      ),
                      suffixIcon: IconButton(
                        padding: EdgeInsets.zero, // reduces icon padding
                        icon: const Icon(Icons.refresh, size: 20),
                        onPressed: () {
                          codeController.text = generateSixDigitUniqueId();
                        },
                      ),
                    ),
                  ),
                  const Gap(16),
                ],
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        text: 'Cancel',
                        onPressed: () => Navigator.pop(ctx),
                      ),
                    ),
                    const Gap(12),
                    Expanded(
                      child: PrimaryButton(
                        text: 'Confirm',
                        onPressed: () {
                          Navigator.pop(ctx);
                          onConfirm(
                            privateRoomId: isSwitchingToPrivate
                                ? codeController.text.trim()
                                : null,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
