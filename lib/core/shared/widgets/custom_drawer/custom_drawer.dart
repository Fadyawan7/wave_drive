import 'dart:ui';
import 'package:flutter/material.dart';
// packages
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
// files

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
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: AppColors.bgdrawer,
          backgroundBlendMode: BlendMode.lighten,
        ),
        child: ClipRRect(
          borderRadius:
              const BorderRadius.horizontal(right: Radius.circular(20)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(50),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: AppColors.inputboxcolor,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Get.toNamed('my_profile_view');
                        },
                        child: Row(
                          children: [
                            // Profile Picture
                            CircleAvatar(
                              backgroundColor: AppColors.inputboxcolor,
                              child: Icon(Icons.person,
                                  color: AppColors.blackcolor),
                            ),
                            Gap(12),
                            Text("Iftikhar Baig",
                                style: AppTextStyles.bodytext1),
                          ],
                        ),
                      ),
                      Gap(16),
                      // driver score batch
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 134,
                              height: 85,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.whitecolor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("98%",
                                      style: AppTextStyles.homeprimarytext),
                                  Text("Driver Score",
                                      style: AppTextStyles.litebuttontext),
                                ],
                              ),
                            ),
                            Container(
                              width: 134,
                              height: 85,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.whitecolor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("95%", style: AppTextStyles.bodytext),
                                  Text("Acceptance Rate",
                                      style: AppTextStyles.litebuttontext),
                                ],
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
                Gap(16),
                ListTile(
                  leading: Icon(Icons.account_balance_wallet),
                  title: Text("Earnings"),
                  onTap: () {
                    // Get.toNamed('earnings_view');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.access_time_filled),
                  title: Text("Trip History"),
                  onTap: () {
                    // Get.toNamed('rides_view');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.sell),
                  title: Text("Compaigns"),
                  onTap: () {
                    // Get.toNamed('campaigns_view');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.percent_sharp),
                  title: Text("Schedule Rides"),
                  onTap: () {
                    // Get.toNamed('schedule_ride_request_view');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  onTap: () {
                    // Get.toNamed('personel_info_view');
                  },
                ),
                Gap(20),
                Divider(),
                ListTile(
                  onTap: () {
                    // Get.toNamed('privacy_view');
                  },
                  title: Text(
                    'Privacy',
                    style: AppTextStyles.litetext,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
