import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/utils/number_format.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/misc/shadow_widget.dart';

class VideoActionsButton extends StatelessWidget {
  const VideoActionsButton({
    super.key,
    required this.figures,
    required this.widget,
    this.onTap,
  });

  final num figures;
  final Widget widget;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ShadowWidget(widget: _buildAction());
  }

  Widget _buildAction() {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          widget,
          const Gap(2),
          Text(
            figures.isNegative ? '0' : formatNumber(figures),
            style: AppTextStyles.textMed12.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
