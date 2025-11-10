import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:styled_text/tags/styled_text_tag.dart';
import 'package:styled_text/widgets/styled_text.dart';

class AppStyledText extends StatelessWidget {
  const AppStyledText(this.text, {super.key, this.style, this.textAlign});

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return StyledText(
      text: text,
      textAlign: textAlign,
      style: style,
      tags: {
        'b': StyledTextTag(
          style:
              style?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ) ??
              AppTextStyles.textBold14.copyWith(color: Colors.black),
        ),
      },
    );
  }
}
