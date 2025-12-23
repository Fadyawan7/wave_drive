import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/routes/app_router.gr.dart';
import 'package:wave_drive/core/routes/routes.dart';
import 'package:wave_drive/core/shared/extensions/alignment_extension.dart';
import 'package:wave_drive/core/shared/mixins/form_mixin.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/base/base_screen.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_country_picker.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_fill_text_field.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_phone_textfield.dart';
import 'package:wave_drive/injector_setup.dart';
import 'package:wave_drive/modules/auth/signup/cubit/signup_cubit.dart';

import 'package:wave_drive/modules/auth/signup/widgets/terms_checkbox_widget.dart';

@RoutePage()
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends BaseScreen<SignupScreen> with FormMixin {
  final _scrollController = ScrollController();
  final _cubit = injector<SignupCubit>();
  bool isAccepted = false;

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
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),

          child: Column(
            children: [
              const Gap(24),
              Text(
                "Become a driver",
                style: AppTextStyles.text18.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.black33,
                ),
              ).centerLeft,
              const Gap(18),

              FormBuilderFillTextField(
                name: 'email',
                hintText: "Email address",
                validator: emailValidators,

                prefixIcon: const Icon(Icons.lock, color: AppColors.blackcolor),
              ),

              const Gap(18),

              FormBuilderPhoneField(
                label: "Phone number",
                name: 'phone',
                validator: requiredValidators,
              ),

              const Gap(18),

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
              const Gap(18),

              FormBuilderFillTextField(
                name: 'city',
                hintText: "City",
                validator: requiredValidators,
              ),

              const Gap(18),

              // terms
              TermsCheckbox(
                value: isAccepted,
                onChanged: (newValue) {
                  setState(() {
                    isAccepted = newValue;
                  });
                },
              ),

              const Gap(18),

              const Text(
                "Once you've become a driver, we will occasionally send you offers and promotions related to our services. You can always unsubscribe by changing your communication preferences.",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Gap(30),
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

    if (!isAccepted) {
      toast(
        'Please accept the Terms of Service and Privacy Policy to continue',
      );
      return;
    }
    final formFields = formKey.currentState!.value;
    final email = formFields["email"] as String;
    final phone = formFields["phone"] as String;
    final country = formFields["country"] as String;
    final city = formFields["country"] as String;
    _cubit.setCityCountry(country, city, email);

    loading(true);

    final resulst = await _cubit.sendOtpNumber(phone);
    loading(false);

    if (!resulst.$1) {
      toastError(resulst.$2 ?? "Something went wrong. Please try again later!");
      return;
    }

    if (mounted) {
      AppNavigator.push(context, const SignupOtpRoute());
    }
  }
}





