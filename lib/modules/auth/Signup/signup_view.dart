// packages
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/extensions/alignment_extension.dart';
import 'package:wave_drive/core/shared/mixins/form_mixin.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/base/base_screen.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/drop_downs/app_dropdown.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_country_picker.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_fill_text_field.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_phone_textfield.dart';
import 'package:wave_drive/modules/auth/Signup/personel_info_view.dart';
import 'package:wave_drive/modules/auth/Signup/signup_otp_screen.dart';
// componenets

import 'widgets/select_city_widget.dart';
import 'widgets/terms_checkbox_widget.dart';

class SignupView extends StatefulWidget {
  SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends BaseScreen<SignupView> with FormMixin {
  final _scrollController = ScrollController();

  // final SignupPhoneController phoneController =
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: MainAppBar(
        titleWidget: Text(
          "Register",
          style: AppTextStyles.text18.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: FormBuilder(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 30),

          child: Column(
            children: [
              Gap(24),
              Text(
                "Become a driver",
                style: AppTextStyles.text18.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.black33,
                ),
              ).centerLeft,
              Gap(18),

              FormBuilderFillTextField(
                name: 'email',
                hintText: "Email address",
                validator: emailValidators,
                obscureText: false,

                prefixIcon: Icon(Icons.lock, color: AppColors.blackcolor),
              ),

              Gap(18),

              FormBuilderPhoneField(
                label: "Phone number",
                name: 'phone',
                validator: requiredValidators,
              ),

              Gap(18),

              FormBuilderFillTextField(
                name: 'password',
                hintText: "Password",
                validator: confirmPasswordValidators,
                obscureText: true,

                prefixIcon: Icon(Icons.lock, color: AppColors.blackcolor),
              ),

              Gap(18),
              FormBuilderCountryPicker(
                name: 'country',
                validator: Platform.isIOS ? null : countryValidators,
                hintText: 'Country',
                onSearching: (searching) {
                  if (searching) {
                    _scrollController.animateTo(
                      200,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linear,
                    );
                  }
                },
                initialValue: "Pakistan",
                isRequired: !Platform.isIOS,
              ),
              Gap(18),

              // select city drop down
              // CityDropdown(),
              AppDropdownField(
                validator: requiredValidators,

                hint: 'City',

                items: [
                  "Karachi",
                  "Lahore",
                  "Islamabad",
                  "Rawalpindi",
                  "Multan",
                  "Faisalabad",
                  "Peshawar",
                  "Quetta",
                  "Sialkot",
                  "Gujranwala",
                  "Bahawalpur",
                  "Sukkur",
                  "Hyderabad",
                  "Abbottabad",
                  "Mardan",
                  "Jhang",
                  "Sheikhupura",
                  "Rahim Yar Khan",
                  "Dera Ghazi Khan",
                  "Okara",
                ],
                onChanged: (String? value) {},
                name: 'city',
              ),

              Gap(18),
              // terms
              TermsCheckbox(),
              Gap(18),

              Text(
                "Once you've become a driver, we will occasionally send you offers and promotions related to our services. You can always unsubscribe by changing your communication preferences.",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Gap(30),
              PrimaryButton(text: "Register as a driver", onPressed: _onSubmit),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onSubmit() async {
    FocusScope.of(context).unfocus();
    final isFormValid = formKey.currentState!.saveAndValidate();
    if (!isFormValid) return;
    final formFields = formKey.currentState!.value;
    final password = formFields["password"] as String;
    final email = formFields["email"] as String;
    final phone = formFields["phone"] as String;
    final country = formFields["country"] as String;

    loading(true);

    await Future.delayed(const Duration(seconds: 2));
    loading(false);

    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignupOtpScreen()),
      );
    }
  }
}
