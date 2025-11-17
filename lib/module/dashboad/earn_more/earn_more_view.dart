// packages
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_images.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
// files
import 'ride_history.dart';

class EarnMoreView extends StatefulWidget {
  const EarnMoreView({super.key});

  @override
  State<EarnMoreView> createState() => _EarnMoreViewState();
}

class _EarnMoreViewState extends State<EarnMoreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Earn More', style: AppTextStyles.bodytext),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(30),
            Container(
              height: 70,
              width: double.infinity,
              color: AppColors.liteprimarycolor,
              child: ListTile(
                leading: Image.asset(
                  AppImages.earnedCard,
                  color: AppColors.primarycolor,
                  height: 20,
                  width: 32,
                ),
                title: Text('0.00 KR', style: AppTextStyles.bodytext),
                subtitle: Text(
                  'Earned this work',
                  style: AppTextStyles.homesecoundarytext,
                ),
              ),
            ),
            Gap(24),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RideHistoryScreen(),
                  ),
                );
              },
              child: Row(
                spacing: 16,
                children: [
                  Image.asset(
                    AppImages.scheduleCalender,
                    color: AppColors.black33,
                    height: 20,
                    width: 32,
                  ),
                  Text(
                    'Scheduled Rides requests',
                    style: AppTextStyles.earnprimary.copyWith(
                      color: AppColors.blackcolor,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.graycolor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
