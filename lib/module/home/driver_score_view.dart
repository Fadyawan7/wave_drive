import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

class DriverScoreView extends StatelessWidget {
  const DriverScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Driver Score', style: AppTextStyles.bodytext),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.whitecolor,
        foregroundColor: AppColors.blackcolor,
      ),
      backgroundColor: AppColors.whitecolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(24),

              /// Top Section
              Text(
                'Your Driver Score',
                style: AppTextStyles.homesecoundarytext,
              ),
              const Gap(8),
              Text('100%', style: AppTextStyles.logotext),
              const Gap(4),
              Text('Guidance', style: AppTextStyles.homeprimarytext),
              const Gap(20),

              /// Progress Bar
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: 1.0,
                  minHeight: 8,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: AlwaysStoppedAnimation(AppColors.primarycolor),
                ),
              ),
              const Gap(20),

              /// Info box with icon
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.liteprimarycolor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info, color: AppColors.primarycolor),
                    const Gap(8),
                    Expanded(
                      child: Text(
                        'You start with 100 good rides that '
                        'gradually get replaced with actual trip',
                        style: AppTextStyles.litebuttontext,
                      ),
                    ),
                  ],
                ),
              ),

              const Gap(16),

              /// Bottom description
              Text(
                'Calculated based on your past 100 Journey',
                style: AppTextStyles.homesecoundarytext,
                textAlign: TextAlign.center,
              ),
              const Gap(4),
              TextButton(
                onPressed: () {
                  // Get.toNamed('more_driver_score_view');
                },
                child: Text(
                  'Find out more about Driver Score',
                  style: AppTextStyles.homeprimarytext,
                ),
              ),

              const Gap(24),

              /// Keep your score high!
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Keep your score high!',
                      style: AppTextStyles.bodytext.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      'To maintain a high score',
                      style: AppTextStyles.homesecoundarytext,
                    ),
                    const Gap(12),

                    /// Bullet points
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("• Complete rides as requested by your rider"),
                        Gap(6),
                        Text("• Stay polite and respectful"),
                        Gap(6),
                        Text("• Ensure that your riders feel safe"),
                        Gap(6),
                        Text("• Keep your car clean and in good condition"),
                      ],
                    ),
                  ],
                ),
              ),

              const Gap(40),

              /// Compliments Section
              Column(
                children: [
                  Icon(
                    Icons.thumb_up_alt_outlined,
                    size: 64,
                    color: AppColors.primarycolor,
                  ),
                  const Gap(12),
                  Text('Compliments', style: AppTextStyles.homeprimarytext),
                  const Gap(8),
                  Text(
                    '890 arriving passengers will share their appreciation here',
                    style: AppTextStyles.homesecoundarytext,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              const Gap(46),
            ],
          ),
        ),
      ),
    );
  }
}
