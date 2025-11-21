import 'dart:ui';
import 'package:flutter/material.dart';
// packages
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/custom_drawer/menu/campains_view.dart';
import 'package:wave_drive/core/shared/widgets/custom_drawer/menu/earnings_view.dart';
import 'package:wave_drive/core/shared/widgets/custom_drawer/menu/personel_data_view.dart';
import 'package:wave_drive/core/shared/widgets/custom_drawer/menu/privacy_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.85,
      backgroundColor: AppColors.inputboxcolor,
      elevation: 16,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: AppColors.bgdrawer,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: AppColors.inputboxcolor,
                  child: Column(
                    children: [
                      Gap(50),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.inputboxcolor,
                              child: Icon(
                                Icons.person,
                                color: AppColors.blackcolor,
                              ),
                            ),
                            Gap(12),
                            Text(
                              "Iftikhar Baig",
                              style: AppTextStyles.text15,
                            ),
                          ],
                        ),
                      ),
                      Gap(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _drawerStat("98%", "Driver Score"),
                          _drawerStat("95%", "Acceptance Rate"),
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
                _drawerTile(
                  context,
                  Icons.access_time_filled,
                  "Trip History",
                  null,
                ),
                _drawerTile(
                  context,
                  Icons.sell,
                  "Compaigns",
                  const CampaignsView(),
                ),
                _drawerTile(
                  context,
                  Icons.percent_sharp,
                  "Schedule Rides",
                  null,
                ),
                _drawerTile(
                  context,
                  Icons.settings,
                  "Settings",
                  const PersonalDataView(),
                ),
                const Gap(20),
                const Divider(),
                _drawerTile(
                  context,
                  Icons.privacy_tip,
                  "Privacy",
                  const PrivacyView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawerStat(String value, String label) {
    return Container(
      width: 134,
      height: 85,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.whitecolor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: AppTextStyles.text15),
          Text(label, style: AppTextStyles.text16),
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
      leading: Icon(icon),
      title: Text(title),
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
