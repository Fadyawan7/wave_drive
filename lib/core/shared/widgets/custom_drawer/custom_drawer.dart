import 'package:flutter/material.dart';
// packages
import 'package:gap/gap.dart';
import 'package:wave_drive/core/cubits/user/user_cubit.dart';
import 'package:wave_drive/core/routes/app_router.gr.dart';
import 'package:wave_drive/core/routes/routes.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/app_divider.dart';
import 'package:wave_drive/core/shared/widgets/avatar/avatar_default.dart';
import 'package:wave_drive/core/shared/widgets/custom_drawer/menu/campains_view.dart';
import 'package:wave_drive/core/shared/widgets/custom_drawer/menu/earning/earning_screen.dart';
import 'package:wave_drive/core/shared/widgets/custom_drawer/menu/personel_data_view.dart';
import 'package:wave_drive/core/shared/widgets/custom_drawer/menu/privacy_view.dart';
import 'package:wave_drive/injector_setup.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final _userCubit = injector<UserCubit>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(0)),
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
                const Gap(24),
                GestureDetector(
                  onTap: () {
                    AppNavigator.push(context, const ProfileRoute());
                  },
                  child: Row(
                    children: [
                      AvatarDefault(
                        username:
                            "${_userCubit.state.currentUser?.firstName} ${_userCubit.state.currentUser?.lastName}",
                        imageUrl: _userCubit.state.currentUser?.image,
                        radius: 24,
                      ),

                      const Gap(12),
                      Text(
                        "${_userCubit.state.currentUser?.firstName} ${_userCubit.state.currentUser?.lastName}",
                        style: AppTextStyles.text16.copyWith(color: AppColors.black33),
                      ),
                    ],
                  ),
                ),
                const Gap(16),
                Row(
                  spacing: 6,

                  children: [
                    Expanded(
                      child: _drawerStat("${_userCubit.state.currentUser?.driverStates?.score ?? 0}%", "Driver Score"),
                    ),

                    Expanded(
                      child: _drawerStat(
                        "${_userCubit.state.currentUser?.driverStates?.acceptanceRate ?? 0}%",
                        "Acceptance Rate",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap(16),
          _drawerTile(context, Icons.account_balance_wallet, "Earnings", const EarningScreen()),
          _drawerTile(context, Icons.access_time_filled, "Trip History", null),
          _drawerTile(context, Icons.sell, "Compaigns", const CampaignsView()),
          _drawerTile(context, Icons.percent_sharp, "Schedule Rides", null),
          _drawerTile(context, Icons.settings, "Settings", const PersonalDataView()),
          const AppDivider(),
          _drawerTile(context, Icons.privacy_tip, "Privacy", const PrivacyView()),
        ],
      ),
    );
  }

  Widget _drawerStat(String value, String label) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: AppColors.whitecolor, borderRadius: BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: AppTextStyles.text20.copyWith(fontWeight: FontWeight.w600, color: AppColors.black33),
          ),
          const Gap(6),
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

  Widget _drawerTile(BuildContext context, IconData icon, String title, Widget? navigateTo) {
    return ListTile(
      leading: Icon(icon, color: AppColors.black33),
      title: Text(title, style: AppTextStyles.text16),
      onTap: () {
        Navigator.pop(context); // Close drawer first
        if (navigateTo != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => navigateTo));
        }
      },
    );
  }
}
