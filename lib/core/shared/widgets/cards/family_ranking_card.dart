import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/buttons/navigate_button.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/misc/member_list.dart';
import 'package:wave_drive/generated/locale_keys.dart';

class FamilyRankingCard extends StatelessWidget {
  const FamilyRankingCard({super.key, this.onTap, required this.urlImages});

  final Function()? onTap;
  final List<String> urlImages;

  @override
  Widget build(BuildContext context) {
    return NavigateButton(
      onTap: onTap,
      iconColor: AppColors.blue1E,
      widget: Row(
        children: [
          MemberList(urlImages: urlImages, size: 30, showOrderNumber: true),
          const Gap(12),
          Expanded(
            child: Text(
              LocaleKeys.family_family_ranking.tr(),
              style: AppTextStyles.text16.copyWith(color: AppColors.black11),
            ),
          ),
        ],
      ),
      border: Border.all(color: AppColors.blue1E, width: .5),
    );
  }
}
