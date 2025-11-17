// packages
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/app_bar/app_bar_field.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_button.dart';
import 'package:wave_drive/module/auth/Signup/payment_details_view.dart';

class LicenseExpiresView extends StatelessWidget {
  LicenseExpiresView({super.key});
  // final LicenseExpireController controller = Get.put(LicenseExpireController());
  @override
  Widget build(BuildContext context) {
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
                              'Documents Details',
                              style: AppTextStyles.bodytext,
                            ),
                          ],
                        ),
                        Gap(16),
                        Text(
                          'Please Provide The Following Information About These Documents',
                          style: AppTextStyles.litetext,
                        ),
                        Gap(24),
                        Text('Expires', style: AppTextStyles.bodytext),
                        Gap(16),
                        // choose expiry date
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 56,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'License expires',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 28,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Gap(24),
                        RoundedButton(
                          title: 'Confirm',
                          onpress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentDetailsView(),
                              ),
                            );
                            // Get.toNamed('payment_details_view');
                          },
                        ),
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
}
