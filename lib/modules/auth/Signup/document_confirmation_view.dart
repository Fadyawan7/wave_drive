// packages
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/app_bar/app_bar_field.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_button.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_unfil_button.dart';
import 'package:wave_drive/modules/auth/Signup/license_expires_view.dart';

class DocumentConfirmationView extends StatelessWidget {
  const DocumentConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    // final File? imageFile = Get.arguments;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primarycolor,
      body: SafeArea(
        child: Column(
          children: [
            Gap(20),
            AppBarField(
              text: 'Sign Up',
              onpress: () {
                // Get.back();
              },
            ),
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
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(24),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                // Get.back();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: AppColors.primarycolor,
                              ),
                            ),
                            Text(
                              'Documents Confirmation',
                              style: AppTextStyles.text10,
                            ),
                          ],
                        ),
                        Gap(24),
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
                          child: Text('No image selected'),
                          //  imageFile != null
                          //     ? Image.file(
                          //         imageFile,
                          //         fit: BoxFit.cover,
                          //       )
                          //     : Text('No image selected'),
                        ),
                        const Gap(16),
                        Text(
                          'Confirm The Following:',
                          style: AppTextStyles.text10,
                        ),
                        Gap(24),
                        _buildCheckboxItem(
                          'The document is fully visible and nothing is covering the information',
                          false,
                        ),
                        Divider(thickness: 1, color: AppColors.inputboxcolor),
                        Gap(10),
                        _buildCheckboxItem(
                          'All information is clearly readable and evenly lit, with no blur or glare',
                          true,
                        ),
                        Divider(thickness: 1, color: AppColors.inputboxcolor),
                        Gap(10),
                        _buildCheckboxItem(
                          'This is a real document, not a photo of a screen',
                          false,
                        ),
                        Divider(thickness: 1, color: AppColors.inputboxcolor),
                        const Gap(24),
                        RoundedButton(
                          title: 'Confirm',
                          onpress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LicenseExpiresView(),
                              ),
                            );
                            // Get.toNamed('license_expires_view');
                          },
                        ),
                        const Gap(24),
                        RoundedUnfillButton(
                          title: 'Change a Photo',
                          onpress: () {
                            // Get.back();
                          },
                        ),
                        Gap(24),
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

  Widget _buildCheckboxItem(String label, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: value ? AppColors.primarycolor : Colors.grey,
                width: 1.5,
              ),
              color: value ? AppColors.primarycolor : Colors.transparent,
            ),
            child: Theme(
              data: ThemeData(unselectedWidgetColor: Colors.transparent),
              child: Checkbox(
                value: value,
                onChanged: (bool? newValue) {
                  // Handle checkbox state change
                },
                activeColor: Colors.transparent,
                checkColor: Colors.white,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                side: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(label, style: AppTextStyles.text10)),
        ],
      ),
    );
  }
}
