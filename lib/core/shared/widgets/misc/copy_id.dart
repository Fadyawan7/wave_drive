import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class CopyId extends StatelessWidget {
  const CopyId({
    super.key,
    required this.id,
    this.isCenter = true,
    this.textStyle,
    this.colorIcon,
    this.expandedId = false,
  });

  final String id;
  final bool isCenter;
  final TextStyle? textStyle;
  final Color? colorIcon;
  final bool expandedId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: id));
        // AppOverlay.showToast('Copied');
      },
      child: Row(
        mainAxisAlignment: isCenter
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          if (expandedId) ...[
            Expanded(
              child: Text(
                "UID: $id",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    textStyle ??
                    AppTextStyles.text12.copyWith(
                      color: AppColors.white.withValues(alpha: .5),
                    ),
              ),
            ),
          ] else ...[
            Text(
              "UID: $id",
              style:
                  textStyle ??
                  AppTextStyles.text12.copyWith(
                    color: AppColors.white.withValues(alpha: .5),
                  ),
            ),
          ],
          const Gap(6),

          Icon(Icons.copy, size: 14, color: colorIcon ?? AppColors.white),
        ],
      ),
    );
  }
}
