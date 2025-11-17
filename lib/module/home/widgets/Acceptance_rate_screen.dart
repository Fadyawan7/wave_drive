// packages
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/module/home/widgets/info_expansion_tile.dart';

class AcceptanceRateView extends StatelessWidget {
  const AcceptanceRateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.blackcolor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Acceptance rate', style: AppTextStyles.bodytext),
        centerTitle: true,
      ),
      backgroundColor: AppColors.whitecolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: AppColors.liteprimarycolor,
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                Text(
                  '92%',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackcolor,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.arrow_drop_up,
                      size: 48,
                      color: AppColors.primarycolor,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '9',
                            style: const TextStyle(
                              color: AppColors.primarycolor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const TextSpan(
                            text: '/10',
                            style: TextStyle(
                              color: AppColors.primarycolor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Gap(4),
                    Text(
                      'Last 10 requests',
                      style: AppTextStyles.homesecoundarytext,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              spacing: 24,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Trips requested', style: AppTextStyles.bodytext1),
                    Text('100', style: AppTextStyles.bodytext1),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.check, color: Colors.green, size: 20),
                        const SizedBox(width: 8),
                        Text('Accepted', style: AppTextStyles.bodytext1),
                      ],
                    ),
                    Text('92', style: AppTextStyles.bodytext1),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.close, color: Colors.red, size: 20),
                        const SizedBox(width: 8),
                        Text('Declined', style: AppTextStyles.bodytext1),
                      ],
                    ),
                    Text('8', style: AppTextStyles.bodytext1),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Based on your last 100 requests',
                    style: AppTextStyles.homesecoundarytext,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          const Gap(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Text('More information', style: AppTextStyles.bodytext),
          ),
          const Gap(10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                InfoExpansionTile(
                  icon: Icons.calculate_outlined,
                  title: 'How acceptance rate is calculated',
                  content:
                      'This percentage shows how often a driver accepts incoming ride requests. For example, if a driver receives 50 requests and accepts 45, their acceptance rate is 90%.',
                ),
                Gap(12),
                Divider(),
                InfoExpansionTile(
                  icon: Icons.access_alarm,
                  title: 'Why acceptance rate matters',
                  content:
                      'A high acceptance rate reflects your reliability and increases your chances of getting more ride requests and rewards.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
