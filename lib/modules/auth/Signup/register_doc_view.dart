import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/app_bar/app_bar_field.dart';
import 'package:wave_drive/core/shared/widgets/language_field/language_field.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_border_button.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_button.dart';
import 'package:wave_drive/core/shared/widgets/textfield/text_field.dart';
import 'package:wave_drive/modules/auth/Signup/upload_license_view.dart';

import 'widgets/custom_horizontal_divider.dart';

class RegisterDocView extends StatefulWidget {
  const RegisterDocView({super.key});

  @override
  State<RegisterDocView> createState() => _RegisterDocViewState();
}

class _RegisterDocViewState extends State<RegisterDocView> {
  File? profilePicture;
  File? driversLicense;
  File? toolDrivingLicense;
  File? companyCertificate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primarycolor,
      body: SafeArea(
        child: Column(
          children: [
            const Gap(20),
            AppBarField(text: 'Sign Up', onpress: () {}),
            const Gap(16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whitecolor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(24),
                        const LanguageField(),
                        const Gap(24),
                        const CustomHorizontalDivider(activeSections: 3),
                        const Gap(24),
                        Text('Documents', style: AppTextStyles.text12),
                        const Gap(10),
                        Text(
                          "We're legally required to ask you for some documents to sign you up as a driver. Document scans and quality photos are accepted.",
                          style: AppTextStyles.text12,
                        ),
                        const Gap(24),
                        Text(
                          'Driver license number',
                          style: AppTextStyles.text12,
                        ),
                        const Gap(16),
                        const TextFieldCustom(
                          maxLines: 1,
                          hintText: 'Enter license number',
                        ),
                        const Gap(24),

                        // Profile Picture Section
                        _buildDocumentSection(
                          title: 'Profile Picture*',
                          description:
                              'A picture of you where your face is clearly visible without sunglasses or a hat. Take the photo in a well-lit place.',
                          buttonText: 'Upload A File',
                          file: profilePicture,
                          onPressed: () {
                            setState(
                              () => profilePicture = File('dummy_profile.png'),
                            );
                          },
                          onDelete: () {
                            setState(() => profilePicture = null);
                          },
                        ),

                        const Gap(24),
                        // Driver's License Section
                        _buildDocumentSection(
                          title: "Driver's License*",
                          description:
                              'We need a clear copy of your driver\'s license to identify you.',
                          buttonText: 'Upload A File',
                          file: driversLicense,
                          onPressed: () {
                            setState(
                              () => driversLicense = File('dummy_license.png'),
                            );
                          },
                          onDelete: () {
                            setState(() => driversLicense = null);
                          },
                        ),

                        const Gap(24),
                        // Tool Driving License Section
                        _buildDocumentSection(
                          title: 'Tool Driving License*',
                          description:
                              'To drive with us, you must have a total driving license. Please upload it for approval.',
                          buttonText: 'Upload A File',
                          file: toolDrivingLicense,
                          onPressed: () {
                            setState(
                              () => toolDrivingLicense = File(
                                'dummy_tool_license.png',
                              ),
                            );
                          },
                          onDelete: () {
                            setState(() => toolDrivingLicense = null);
                          },
                        ),

                        const Gap(24),
                        // Company Certificate Section
                        _buildDocumentSection(
                          title: 'Company Registration Certificate',
                          description:
                              'If you are a fleet owner, please upload your company registration certificate. This is the last required document for approval.',
                          buttonText: 'Upload A File',
                          file: companyCertificate,
                          onPressed: () {
                            setState(
                              () => companyCertificate = File(
                                'dummy_company_cert.png',
                              ),
                            );
                          },
                          onDelete: () {
                            setState(() => companyCertificate = null);
                          },
                        ),

                        const Gap(32),
                        RoundedButton(
                          title: 'Next',
                          onpress: () {
                          //  if (_validateDocuments()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UploadLicenseView(),
                                ),
                              );
                            // } else {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //       content: Text(
                            //         'Please upload all required documents',
                            //       ),
                            //     ),
                            //   );
                            // }
                          },
                        ),
                        const Gap(24),
                        RoundedBorderButton(
                          title: 'Back',
                          onpress: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Gap(24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentSection({
    required String title,
    required String description,
    required String buttonText,
    required File? file,
    required VoidCallback onPressed,
    required VoidCallback onDelete,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.text12),
        const Gap(8),
        Text(description, style: AppTextStyles.text12),
        const Gap(16),
        file != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      file.path.split('/').last,
                      style: const TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete_forever_rounded,
                      color: AppColors.blackcolor,
                    ),
                    onPressed: onDelete,
                  ),
                ],
              )
            : GestureDetector(
                onTap: onPressed,
                child: Container(
                  height: 31,
                  width: 118,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.inputboxcolor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, size: 16, color: AppColors.primarycolor),
                      const SizedBox(width: 4),
                      Text(buttonText, style: AppTextStyles.text12),
                    ],
                  ),
                ),
              ),
      ],
    );
  }

  bool _validateDocuments() {
    return profilePicture != null &&
        driversLicense != null &&
        toolDrivingLicense != null;
  }
}
