import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/app_overlay.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_button.dart';

class PersonalDataView extends StatelessWidget {
  const PersonalDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whitecolor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackcolor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Your personal data",
          style: GoogleFonts.poppins(textStyle: AppTextStyles.text14),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "A confirmation of your request will be sent to you at nassiri@live.se",
              style: GoogleFonts.poppins(textStyle: AppTextStyles.text15),
            ),
            const SizedBox(height: 12),
            RichText(
              text: TextSpan(
                text:
                    "For more detailed information about the file formats and the data included in the package, please visit ",
                style: GoogleFonts.poppins(textStyle: AppTextStyles.text15),
                children: [
                  TextSpan(
                    text: "our FAQ page",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(color: AppColors.primarycolor),
                    ),
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
              onChanged: (value) {},
            ),

            const SizedBox(height: 12),

            // Account Security
            buildDataCard(
              title: "Account Security",
              subtitle:
                  "This category tracks key account security information.",
              value: false,
              onChanged: (value) {},
            ),

            const Gap(12),

            // Consents
            buildDataCard(
              title: "Consents",
              subtitle:
                  "This category logs your consents for data processing and communication preferences.",
              value: false,
              onChanged: (value) {},
            ),
            const Spacer(),

            // Button
            RoundedButton(
              title: 'Request my data',
              onpress: () {
                AppOverlay.showToast(
                  'Request Sent Data request submitted successfully!',
                );
              },
            ),

            const Gap(30),
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
      child: Theme(
        data: ThemeData(
          switchTheme: SwitchThemeData(
            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          ),
        ),
        child: SwitchListTile(
          activeColor: AppColors.whitecolor,
          inactiveThumbColor: AppColors.primarycolor,
          activeTrackColor: AppColors.primarycolor,

          title: Text(
            title,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          subtitle: Text(
            subtitle,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          value: value,
          onChanged: onChanged,
          dense: true, // makes it tighter, no extra spacing
        ),
      ),
    );
  }
}
