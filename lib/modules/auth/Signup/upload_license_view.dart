// packages
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_border_button.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_button.dart';
import 'package:wave_drive/modules/auth/Signup/document_confirmation_view.dart';

class UploadLicenseView extends StatelessWidget {
  UploadLicenseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Gap(24),
              Text(
                'Upload a photo of your Driver license',
                style: GoogleFonts.poppins(
                  color: AppColors.blackcolor,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              Gap(16),
              Text(
                'Regulations require you to upload a Driver license card. Don\'t worry, your data will stay safe and private',
                style: AppTextStyles.text12,
              ),
              Gap(32),
              Container(
                height: 188,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.boxbgcolor,
                  border: Border.all(width: 1, color: AppColors.primarycolor),
                ),
                child: GestureDetector(
                  onTap: () {
                    // controller.pickFromGallery();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, color: AppColors.graycolor, size: 50),
                      Text(
                        'Select file',
                        style: TextStyle(color: AppColors.graycolor),
                      ),
                    ],
                  ),
                ),
              ),

              Gap(24),
              customDividerWithText('or'),
              Spacer(),
              RoundedBorderButton(
                icon: Icons.photo_camera,
                title: 'Take a Photo',
                onpress: () {},
              ),
              Gap(24),
              RoundedButton(
                title: 'Continue',
                onpress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DocumentConfirmationView(),
                    ),
                  );
                  // Get.toNamed('document_confirmation_view',
                  //     arguments: controller.selectedImage.value);
                },
              ),
              Gap(24),
            ],
          ),
        ),
      ),
    );
  }

  // divider
  Widget customDividerWithText(String text) {
    return SizedBox(
      height: 24,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(child: Divider(thickness: 1, color: Colors.grey.shade300)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.blackcolor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(child: Divider(thickness: 1, color: Colors.grey.shade300)),
        ],
      ),
    );
  }
}
