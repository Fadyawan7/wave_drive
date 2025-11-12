// packages
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/app_bar/app_bar_field.dart';
import 'package:wave_drive/core/shared/widgets/language_field/language_field.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_border_button.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_button.dart';
import 'package:wave_drive/module/auth/Signup/price_details_view.dart';
import 'package:wave_drive/module/auth/Signup/register_doc_view.dart';

// widgets
import 'widgets/custom_horizontal_divider.dart';
import 'widgets/driver_category_widget.dart';

class RegisterCategoryView extends StatelessWidget {
  const RegisterCategoryView({super.key});

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
                Navigator.pop(context);
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
                        // language field
                        LanguageField(),
                        Gap(24),
                        // cutom divider
                        CustomHorizontalDivider(activeSections: 1),
                        Gap(24),
                        Text(
                          'Legal and pricing details',
                          style: AppTextStyles.bodytext,
                        ),
                        Gap(10),
                        Text(
                          'Your national ID and license will be kept Private',
                          style: AppTextStyles.litetext,
                        ),
                        Gap(24),
                        Text(
                          'I want to join wave as:*',
                          style: AppTextStyles.bodytext1,
                        ),
                        Gap(10),
                        DriverCategoryWidget(),
                        Gap(24),
                        RoundedBorderButton(
                          title: 'Back',
                          onpress: () {
                            Navigator.pop(context);
                          },
                        ),
                        Gap(24),
                        RoundedButton(
                          title: 'Next',
                          onpress: () {
                            // Get.toNamed('register_doc_view');
                            // Get.toNamed('price_detail_view');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PriceDetailsView(),
                              ),
                            );
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
