// packages
import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_outlined_button.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/modules/auth/signup/document_confirmation_view.dart';

class UploadLicenseView extends StatelessWidget {
  UploadLicenseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primarycolor,
      appBar: MainAppBar(
        titleWidget: Text(
          "Sign Up",
          style: AppTextStyles.text22.copyWith(
            fontWeight: FontWeight.w700,

            color: AppColors.white,
          ),
        ),
      ),

      body: Column(
        children: [
          Gap(48),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whitecolor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),

              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Gap(24),

                    Text(
                      'Upload a photo of your Driver license',

                      style: AppTextStyles.text24.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(16),
                    Text(
                      'Regulations require you to upload a Driver license card. Don\'t worry, your data will stay safe and private',
                      style: AppTextStyles.text14.copyWith(
                        fontWeight: FontWeight.w300,
                        color: AppColors.grayA3,
                      ),
                    ),
                    Gap(32),
                    Container(
                      height: 188,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.boxbgcolor,
                        border: Border.all(
                          width: 1,
                          color: AppColors.primarycolor,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // controller.pickFromGallery();
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              color: AppColors.graycolor,
                              size: 50,
                            ),
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
                    Gap(24),

                    PrimaryOutlinedButton(
                      text: "Take a Photo",
                      prefix: Icon(
                        Icons.photo_camera,
                        color: AppColors.primary,
                        size: 24,
                      ),
                    ),

                    Gap(24),
                    PrimaryButton(
                      text: "Continue",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DocumentConfirmationView(),
                          ),
                        );
                      },
                    ),

                    Gap(24),
                  ],
                ),
              ),
            ),
          ),
        ],
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
