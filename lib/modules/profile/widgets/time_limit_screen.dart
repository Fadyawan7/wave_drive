import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class TimeLimitScreen extends StatefulWidget {
  const TimeLimitScreen({super.key});

  @override
  State<TimeLimitScreen> createState() => _TimeLimitScreenState();
}

class _TimeLimitScreenState extends State<TimeLimitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Driving time limit",
        leadingColor: AppColors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(24),
              _buildDrivingTimeSummary(),
              const Gap(32),
              _buildLimitedOnlineHoursSection(),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrivingTimeSummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.grayF8,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '13h',
                  style: AppTextStyles.text24.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
                const Gap(4),
                Text(
                  'Driving time limit',
                  style: AppTextStyles.text14.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.grayA9,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 50,
            color: AppColors.grayF8,
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '6h',
                  style: AppTextStyles.text24.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
                const Gap(4),
                Text(
                  'Until time resets',
                  style: AppTextStyles.text14.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.grayA9,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLimitedOnlineHoursSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Limited online hours',
          style: AppTextStyles.text18.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const Gap(12),
        Text(
          'For road safety and to ensure high-quality service, Wave places a 13 hour(s) maximum driving limit from when you go online. After reaching this limit, you\'ll need to take a break before going online again.',
          style: AppTextStyles.text14.copyWith(
            fontWeight: FontWeight.w400,
            color: AppColors.grayA9,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
