import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/utils/number_format.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class StatisticsText extends StatelessWidget {
  const StatisticsText({
    super.key,
    required this.figures,
    required this.text,
    required this.color,
    this.colorbox,
    this.onTap,
  });

  final int figures;
  final String text;
  final Color color;
  final Color? colorbox;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(3),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: colorbox,
        ),
        child: Column(
          children: [
            Text(
              formatIntNumber(figures),
              style: AppTextStyles.textMed14.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(2),
            Text(
              text,
              style: AppTextStyles.text10.copyWith(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
