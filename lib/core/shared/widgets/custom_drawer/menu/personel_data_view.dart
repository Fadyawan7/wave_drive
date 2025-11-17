import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/app_overlay.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_button.dart';

class PersonalDataView extends StatelessWidget {
  const PersonalDataView({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(PersonalDataController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whitecolor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackcolor),
          onPressed: () {Navigator.pop(context);},
        ),
        title: Text("Your personal data", style: AppTextStyles.bodytext1),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "A confirmation of your request will be sent to you at nassiri@live.se",
              style: AppTextStyles.litetext,
            ),
            const SizedBox(height: 12),
            RichText(
              text: TextSpan(
                text:
                    "For more detailed information about the file formats and the data included in the package, please visit ",
                style: AppTextStyles.litetext,
                children: [
                  TextSpan(
                    text: "our FAQ page",
                    style: TextStyle(color: AppColors.primarycolor),
                  ),
                ],
              ),
            ),
            const Gap(20),

            // Account Profile
          buildDataCard(
                  title: "Account Profile",
                  subtitle:
                      "This category includes essential information about your account and profile, and documents submitted to Bolt.",
                  value: false,
                  onChanged: (value) {
                    
                  },
                ),

            const SizedBox(height: 12),

            // Account Security
          buildDataCard(
                  title: "Account Security",
                  subtitle:
                      "This category tracks key account security information.",
                   value: false,
                  onChanged: (value) {
                    
                  },
                ),

            const Gap(12),

            // Consents
           buildDataCard(
                  title: "Consents",
                  subtitle:
                      "This category logs your consents for data processing and communication preferences.",
                  value: false,
                  onChanged: (value) {
                    
                  },
                ),
            const Spacer(),

            // Button
            RoundedButton(
                title: 'Request my data',
                onpress: () {
                 AppOverlay.showToast('Request Sent Data request submitted successfully!');
                }),

            Gap(30),
          ],
        ),
      ),
    );
  }

  Widget buildDataCard({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SwitchListTile(
        activeColor: AppColors.whitecolor,
        activeTrackColor: AppColors.primarycolor,
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text(subtitle),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
