// packages
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/cubits/user/user_cubit.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/injector_setup.dart';

class CampaignsView extends StatefulWidget {
  const CampaignsView({super.key});

  @override
  State<CampaignsView> createState() => _CampaignsViewState();
}

class _CampaignsViewState extends State<CampaignsView> {
  final _userCubit = injector<UserCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: MainAppBar(
        leadingColor: AppColors.white,
        backgroundColor: AppColors.primary,
        titleWidget: Text(
          "Campaigns",
          style: AppTextStyles.text18.copyWith(color: AppColors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          const Gap(40),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                children: [
                  // Title
                  Text("Cures bonuses", style: AppTextStyles.text16.copyWith(color: AppColors.gray8F)),
                  const SizedBox(height: 12),
                  // Amount
                  Text(
                    "${_userCubit.currentUser?.driverStates?.bonus ?? 0.0}Kr",
                    style: AppTextStyles.text38.copyWith(color: AppColors.primary),
                  ),
                  const SizedBox(height: 12),
                  // Subtitle
                  Text(
                    "Bonuses are paid out together with earnings",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.text14.copyWith(color: AppColors.gray8F, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 20),
                  // Link
                  Text("View previous campaigns", style: AppTextStyles.text14.copyWith(color: AppColors.primary)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
