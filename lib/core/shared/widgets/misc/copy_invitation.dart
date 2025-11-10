import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/app_overlay.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class CopyInvitation extends StatelessWidget {
  const CopyInvitation({
    super.key,
    required this.id,
    this.isCenter = true,
    this.textStyle,
    this.colorIcon,
  });

  final String id;
  final bool isCenter;
  final TextStyle? textStyle;
  final Color? colorIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: id));
        AppOverlay.showToast('Copied');
      },
      child: Row(
        mainAxisAlignment: isCenter
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          Text(
            "Invite code: ",
            style:
                textStyle ??
                AppTextStyles.text16.copyWith(color: AppColors.white),
          ),
          Text(
            id,
            style: AppTextStyles.textMed16.copyWith(color: AppColors.yellowFF),
          ),
          const Gap(6),
          Icon(
            Icons.copy_outlined,
            size: 16,
            color: colorIcon ?? AppColors.yellowFF,
          ),
        ],
      ),
    );
  }
}
