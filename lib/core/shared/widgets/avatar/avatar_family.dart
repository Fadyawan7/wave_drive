import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/avatar/avatar_default.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/generated/locale_keys.dart';

class AvatarFamily extends StatelessWidget {
  const AvatarFamily({
    super.key,
    this.imageUrl,
    this.onTap,
    required this.familyName,
    required this.familyId,
  });

  final Function()? onTap;
  final String? imageUrl;
  final String familyName;
  final String familyId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AvatarDefault(imageUrl: imageUrl, radius: 60),
        const Gap(8),
        Text(
          familyName,
          style: AppTextStyles.textMed20.copyWith(color: AppColors.black),
        ),
        Text(
          '${LocaleKeys.family_family_id.tr()}: $familyId',
          style: AppTextStyles.text12.copyWith(color: AppColors.gray),
        ),
      ],
    );
  }
}
