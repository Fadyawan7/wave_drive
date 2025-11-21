// packages
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/app_bar/app_bar_field.dart';
import 'package:wave_drive/core/shared/widgets/language_field/language_field.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_button.dart';
import 'package:wave_drive/core/shared/widgets/textfield/text_field.dart';
import 'package:wave_drive/modules/auth/Signup/register_category_view.dart';

import 'widgets/custom_horizontal_divider.dart';

class PersonelInfoView extends StatelessWidget {
  const PersonelInfoView({super.key});

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
                        // language field
                        LanguageField(),
                        Gap(24),
                        // cutom divider
                        CustomHorizontalDivider(activeSections: 0),
                        Gap(24),
                        Text(
                          'Personel Information',
                          style: AppTextStyles.text10,
                        ),
                        Gap(10),
                        Text(
                          'Only your first name and vehicle to clients during the booking.',
                          style: AppTextStyles.text10,
                        ),
                        Gap(24),
                        Text('First name*', style: AppTextStyles.text10),
                        Gap(16),
                        TextFieldCustom(maxLines: 1, hintText: 'First name'),
                        Gap(16),
                        Text('Last name*', style: AppTextStyles.text10),
                        Gap(16),
                        TextFieldCustom(maxLines: 1, hintText: 'Last name'),
                        Gap(16),
                        Text('National id', style: AppTextStyles.text10),
                        Gap(16),
                        TextFieldCustom(maxLines: 1, hintText: 'National id'),
                        Gap(16),
                        Text('Language', style: AppTextStyles.text10),
                        Gap(16),
                        TextFieldCustom(maxLines: 1, hintText: 'Norweign'),
                        Gap(16),
                        Text('Referral code', style: AppTextStyles.text10),
                        Gap(16),
                        TextFieldCustom(maxLines: 1, hintText: 'Referral code'),
                        Gap(10),
                        Text(
                          'If someone referred you, biter their code',
                          style: AppTextStyles.text10,
                        ),
                        Gap(16),
                        RoundedButton(
                          title: 'Next',
                          onpress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterCategoryView(),
                              ),
                            );
                          },
                        ),
                        Gap(30),
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
