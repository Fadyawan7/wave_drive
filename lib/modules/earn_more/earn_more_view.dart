// packages
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_images.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
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
      appBar: MainAppBar(
        titleWidget: Text(
          "Earn more",
          style: AppTextStyles.text18.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Gap(24),
            Container(
              decoration: BoxDecoration(
                color: AppColors.blueFF.withValues(alpha: 3),
                borderRadius: BorderRadius.circular(4),
              ),
              child: ListTile(
                leading: Image.asset(
                  AppImages.earnedCard,
                  color: AppColors.primarycolor,
                  height: 20,
                  width: 32,
                ),
                title: Text(
                  '0.00 KR',
                  style: AppTextStyles.text18.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black33,
                  ),
                ),
                subtitle: Text(
                  'Earned this work',
                  style: AppTextStyles.text14.copyWith(
                    fontWeight: FontWeight.w300,
                    color: AppColors.black33,
                  ),
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
                  Expanded(
                    child: Text(
                      'Scheduled Rides requests',
                      style: AppTextStyles.text16.copyWith(
                        color: AppColors.black33,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),

                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.grayA9,
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
