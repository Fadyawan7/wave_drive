import 'package:flutter/material.dart';
import 'package:wave_drive/core/routes/app_navigator.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/themes/app_icons.dart';

class SelectWithdrawMethodBottomSheet extends StatelessWidget {
  const SelectWithdrawMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.35,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.black0A,
          borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
          border: Border(top: BorderSide(color: Colors.white24, width: 1.2)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(5),
              Center(
                child: Container(
                  width: 45,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Withdraw Method",
                    style: AppTextStyles.text17.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: AppImage(
                      path: AppIcons.close,
                      width: 20,
                      height: 20,
                      color: AppColors.white01,
                    ),
                  ),
                ],
              ),
              const Gap(24),
              _buildMethodTile(
                context,
                icon: AppIcons.onchaintransfer,
                title: "On-chain Withdrawal",
                subtitle: "Transfer Crypto to Wallets or Other Exchanges",
                onTap: () {
                },
              ),
              const Gap(12),
              _buildMethodTile(
                context,
                icon: AppIcons.extransfer,
                title: "EXbotix Transfer",
                subtitle:
                    "Enjoy speedy transfers with 0 transaction fee to other EXbotix users using email, mobile number or UID.",
                onTap: () {
                  Navigator.pop(context);
                  // Handle EXbotix transfer logic here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMethodTile(
    BuildContext context, {
    required String icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        decoration: BoxDecoration(
          color: AppColors.black14,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            AppImage(path: icon, width: 16, height: 16, color: AppColors.white),
            const Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.text15.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    subtitle,
                    style: AppTextStyles.text12.copyWith(
                      color: AppColors.gray6F,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: AppColors.gray6F,
            ),
          ],
        ),
      ),
    );
  }
}
