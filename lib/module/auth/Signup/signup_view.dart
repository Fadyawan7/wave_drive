// packages
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/app_bar/app_bar_field.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_button.dart';
import 'package:wave_drive/core/shared/widgets/textfield/text_field.dart';
import 'package:wave_drive/module/auth/Signup/personel_info_view.dart';
// componenets

import 'widgets/select_city_widget.dart';
import 'widgets/terms_checkbox_widget.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});
  // final SignupPhoneController phoneController =
  //     Get.put(SignupPhoneController());
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
            const Gap(27),
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
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(24),
                        // back to login section
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
                            Gap(24),
                            Text(
                              'Back to login',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.primarycolor,
                              ),
                            ),
                          ],
                        ),
                        Gap(24),
                        // email field
                        TextFieldCustom(
                          hintText: 'Email',
                          maxLines: 1,
                          prefixIcon: Icon(
                            Icons.email,
                            color: AppColors.blackcolor,
                          ),
                        ),
                        Gap(24),
                        // phone field
                        Row(
                          children: [
                            // Country Code Picker
                            GestureDetector(
                              onTap: () {
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: true,
                                  countryListTheme: CountryListThemeData(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                    ),
                                    inputDecoration: InputDecoration(
                                      hintText: 'Start typing to search',
                                      labelText: 'Search',
                                    ),
                                  ),
                                  favorite: ['PK'],
                                  onSelect: (Country value) {},
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.28,
                                height: 52,
                                decoration: BoxDecoration(
                                  color: AppColors.inputboxcolor,
                                  border: Border.all(
                                    color: AppColors.inputboxcolor,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text('🇵🇰 92'),
                                      // phoneController.selectedCountry.value ==
                                      //         null
                                      //     ? const Text('🇵🇰 92')
                                      //     : Text(
                                      //         '${phoneController.selectedCountry.value?.flagEmoji} ${phoneController.countryCode.value}',
                                      //       ),
                                      const Gap(8),
                                      Icon(
                                        Icons.expand_more,
                                        color: AppColors.primarycolor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            Gap(10),

                            // Phone Number Field
                            Container(
                              width:
                                  MediaQuery.of(context).size.width *
                                  0.60, // 60% of screen width
                              height: 52,
                              decoration: BoxDecoration(
                                color: AppColors.inputboxcolor,
                                border: Border.all(
                                  color: AppColors.inputboxcolor,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Mobile Number',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(24),
                        // password field
                        TextFieldCustom(
                          hintText: 'password',
                          maxLines: 1,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppColors.blackcolor,
                          ),
                        ),
                        Gap(24),
                        Text('City', style: AppTextStyles.bodytext),
                        Gap(24),
                        // select city drop down
                        CityDropdown(),
                        Gap(24),
                        // terms
                        TermsCheckbox(),
                        Gap(24),
                        Text(
                          "Once you've become a driver, we will occasionally send you offers and promotions related to our services. You can always unsubscribe by changing your communication preferences.",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        Gap(30),
                        RoundedButton(
                          title: 'Register as a driver',
                          onpress: () {
                            // Get.toNamed('personel_info_view');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PersonelInfoView(),
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
