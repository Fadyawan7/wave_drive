import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

class MoreDriverScoreView extends StatelessWidget {
  const MoreDriverScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitecolor,
      appBar: AppBar(
        backgroundColor: AppColors.whitecolor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackcolor),
          onPressed: () {
          },
        ),
        title: Text(
          'Driver Score',
          style: AppTextStyles.bodytext,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            Text(
              'How Is The Driver Score?',
              style: AppTextStyles.bodytext,
              textAlign: TextAlign.center,
            ),
            Gap(16),
            // Description Section
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  height: 1.4,
                ),
                children: [
                  TextSpan(
                      text: 'Your Driver Score Shows The ',
                      style: AppTextStyles.inputLabel),
                  TextSpan(
                    text: '100% Of Good Journeys ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text:
                          'From All Orders You Confirmed On The Wave Platform. A Drop In Your Score Can Only Be Caused By Dangerous Or Harmful On-Trip Conduct.',
                      style: AppTextStyles.inputLabel),
                ],
              ),
            ),
            Gap(24),

            // Reduce Score Section
            Text(
              'Following may reduce your score:',
              style: AppTextStyles.bodytext,
            ),
            Gap(12),
            _buildBulletPoint(
                'Not moving towards the pick-up point resulting in the passenger cancelling a journey.'),
            _buildBulletPoint(
                'Passenger cancelling a journey after you have picked them up, for safety concerns.'),
            _buildBulletPoint(
                'You cancelling the journey before reaching the pick-up point.'),
            _buildBulletPoint(
                'You cancelling the journey after reaching the pick-up and not calling or messaging the passenger.'),
            _buildBulletPoint(
                'The passenger giving you a 1–2 star rating due to safety concern, cleanliness or bad behaviour.'),
            _buildBulletPoint('A passenger support claim being against you.'),
            const SizedBox(height: 24),
            // Calculation Section
            Text(
              'How Is It Calculated?',
              style: AppTextStyles.bodytext,
            ),
            Gap(12),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  height: 1.4,
                ),
                children: [
                  TextSpan(
                      text:
                          'Each Driver Starts With A Score Of 100. Your Score is Based On Your ',
                      style: AppTextStyles.inputLabel),
                  TextSpan(
                    text: 'Previous 100 Journeys. ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text:
                          'As A New Driver, You Begin With 100 Good Journeys That Gradually Get Replaced With Actual Journey Date. This Make Sure That Everyone Is Treated Fairly. If Your Score is Nearing A Threshold For Disabling Access To Bolt Platform ',
                      style: AppTextStyles.inputLabel),
                  TextSpan(
                    text: 'We Will Notify You. ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text:
                          ' We Will Also Offer Additional Guidance That May Help You To Improve Your Score.',
                      style: AppTextStyles.inputLabel),
                ],
              ),
            ),
            Gap(24),
            const Divider(thickness: 1, color: AppColors.inputboxcolor),
            Gap(24),
            // Coasting Section
            _buildScoreSection(
              context: context,
              label: "Coasting",
              labelColor: Colors.orange,
              subtitle: "Guidance Needed-77%",
              description:
                  "Consistently dangerous or harmful behaviour is not tolerated and falling below an absolute minimum threshold will result in your access to offer services on Bolt platform being disabled.",
              progressValue: 0.77,
            ),
            Gap(32),
            // Disable Section
            _buildScoreSection(
              context: context,
              label: "Disable",
              labelColor: Colors.red,
              subtitle: "Disabled threshold-61%",
              progressValue: 0.61,
            ),
            Gap(46),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(fontSize: 14),
          ),
          Expanded(
            child: Text(text, style: AppTextStyles.inputLabel),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreSection({
    required BuildContext context,
    required String label,
    required Color labelColor,
    required String subtitle,
    String? description,
    required double progressValue,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Label Button (Coasting / Disable)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: labelColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Gap(12),
        // Progress bar with indicator
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            // Track
            Container(
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            // Fill
            FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progressValue,
              child: Container(
                height: 10,
                decoration: BoxDecoration(
                  color: labelColor,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            // Indicator (% above bar)
            Positioned(
              left: MediaQuery.of(context).size.width * progressValue - 40,
              child: Column(
                children: [
                  Container(
                    height: 14,
                    width: 3,
                    color: Colors.white,
                  ),
                  Container(
                    height: 14,
                    width: 3,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
        Gap(6),
        // Percentage Below
        Text(
          "${(progressValue * 100).toInt()}%",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Gap(12),
        Divider(thickness: 1, color: AppColors.inputboxcolor),
        // Subtitle
        Text(
          subtitle,
          style: AppTextStyles.homesecoundarytext,
        ),
        if (description != null) ...[
          const SizedBox(height: 12),
          Text(
            description,
            textAlign: TextAlign.start,
            style: AppTextStyles.inputLabel,
          ),
        ],
        Gap(16),
      ],
    );
  }
}
