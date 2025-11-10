// packages
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
// files


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
        title: Text(
          'Earn More',
          style: AppTextStyles.bodytext,
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(30),
            Container(
              height: 70,
              width: double.infinity,
              color: AppColors.liteprimarycolor,
              child: ListTile(
                leading: Icon(
                  Icons.payment,
                  color: AppColors.primarycolor,
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
              onTap: () {},
              child: Row(
                spacing: 16,
                children: [
                  Icon(
                    Icons.pending_actions,
                    color: AppColors.graycolor,
                  ),
                  Text(
                    'Scheduled Rides requests',
                    style: AppTextStyles.litetext,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
