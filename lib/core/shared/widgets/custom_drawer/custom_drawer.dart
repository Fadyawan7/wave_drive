import 'package:flutter/material.dart';
// packages
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/app_divider.dart';
import 'package:wave_drive/core/shared/widgets/avatar/avatar_default.dart';
import 'package:wave_drive/core/shared/widgets/custom_drawer/menu/campains_view.dart';
import 'package:wave_drive/core/shared/widgets/custom_drawer/menu/earnings_view.dart';
import 'package:wave_drive/core/shared/widgets/custom_drawer/menu/personel_data_view.dart';
import 'package:wave_drive/core/shared/widgets/custom_drawer/menu/privacy_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(0),
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      backgroundColor: AppColors.white,
      elevation: 16,

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: AppColors.inputboxcolor,
            child: Column(
              children: [
                Gap(24),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      AvatarDefault(
                        username: "Iftikhar Baig",
                        imageUrl: "",
                        radius: 24,
                      ),

                      Gap(12),
                      Text(
                        "Iftikhar Baig",
                        style: AppTextStyles.text16.copyWith(
                          color: AppColors.black33,
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(16),
                Row(
                  spacing: 6,

                  children: [
                    Expanded(child: _drawerStat("98%", "Driver Score")),

                    Expanded(child: _drawerStat("95%", "Acceptance Rate")),
                  ],
                ),
              ],
            ),
          ),
          Gap(16),
          _drawerTile(
            context,
            Icons.account_balance_wallet,
            "Earnings",
            const EarningsView(),
          ),
          _drawerTile(context, Icons.access_time_filled, "Trip History", null),
          _drawerTile(context, Icons.sell, "Compaigns", const CampaignsView()),
          _drawerTile(context, Icons.percent_sharp, "Schedule Rides", null),
          _drawerTile(
            context,
            Icons.settings,
            "Settings",
            const PersonalDataView(),
          ),
          AppDivider(),
          _drawerTile(
            context,
            Icons.privacy_tip,
            "Privacy",
            const PrivacyView(),
          ),
        ],
      ),
    );
  }

  Widget _drawerStat(String value, String label) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.whitecolor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: AppTextStyles.text20.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.black33,
            ),
          ),
          Gap(6),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: AppTextStyles.text12.copyWith(color: AppColors.grayA9),
          ),
        ],
      ),
    );
  }

  Widget _drawerTile(
    BuildContext context,
    IconData icon,
    String title,
    Widget? navigateTo,
  ) {
    return ListTile(
      leading: Icon(icon, color: AppColors.black33),
      title: Text(title, style: AppTextStyles.text16),
      onTap: () {
        Navigator.pop(context); // Close drawer first
        if (navigateTo != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigateTo),
          );
        }
      },
    );
  }
}
