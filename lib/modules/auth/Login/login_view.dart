// packages
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/extensions/alignment_extension.dart';
import 'package:wave_drive/core/shared/mixins/form_mixin.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/app_bar/app_bar_field.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/base/base_screen.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_fill_text_field.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_outline_text_field.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_phone_textfield.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_button.dart';
import 'package:wave_drive/core/shared/widgets/textfield/text_field.dart';
import 'package:wave_drive/modules/auth/Login/otp_view.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseScreen<LoginView>
    with SingleTickerProviderStateMixin, FormMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primarycolor,
      appBar: MainAppBar(
        titleWidget: Text(
          "Login",
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
              child: FormBuilder(
                key: formKey,
                child: Column(
                  children: [
                    const Gap(30),
                    // Add the TabBar here
                    Column(
                      children: [
                        TabBar(
                          controller: tabController,
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                              width: 3,
                              color: AppColors.primarycolor,
                            ),
                          ),
                          labelColor: AppColors.primarycolor,
                          unselectedLabelColor: Colors.black,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          tabs: const [
                            Tab(text: 'Email'),
                            Tab(text: 'Phone Number'),
                          ],
                        ),
                        Container(height: 1, color: AppColors.inputboxcolor),
                      ],
                    ),

                    const Gap(36),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            // Email Tab
                            _buildEmailTab(),
                            // Phone Tab
                            _buildPhoneTab(context),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormBuilderFillTextField(
          name: 'email',
          hintText: "Enter your email",
          validator: emailValidators,

          prefixIcon: Icon(Icons.email, color: AppColors.blackcolor),
        ),

        const Gap(24),
        FormBuilderFillTextField(
          name: 'password',
          hintText: "Password",
          validator: requiredValidators,
          obscureText: true,

          prefixIcon: Icon(Icons.lock, color: AppColors.blackcolor),
        ),

        Gap(12),
        _buildForgetPass(),
        const Gap(40),
        PrimaryButton(
          text: "Login",
          onPressed: _onSubmitEmailLogin,

          //  () {
          //   // Navigator.push(
          //   //   context,
          //   //   MaterialPageRoute(builder: (context) => OtpView()),
          //   // );
          // },
        ),
      ],
    );
  }

  Widget _buildPhoneTab(BuildContext context) {
    return Column(
      children: [
        FormBuilderPhoneField(
          height: 58,
          label: "Phone number",
          name: 'phone',
          validator: requiredValidators,
        ),

        const Gap(24),
        FormBuilderFillTextField(
          name: 'passwordPhone',
          hintText: "Password",
          validator: requiredValidators,
          obscureText: true,

          prefixIcon: Icon(Icons.lock, color: AppColors.blackcolor),
        ),
        Gap(12),
        // forget pass
        _buildForgetPass(),
        const Gap(40),
        PrimaryButton(text: "Login", onPressed: _onSubmitPhomeLogin),
      ],
    );
  }

  Widget _buildForgetPass() {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Forget Password?',
        style: AppTextStyles.text16.copyWith(color: AppColors.black),
      ),
    ).centerRight;
  }

  Future<void> _onSubmitEmailLogin() async {
    FocusScope.of(context).unfocus();
    final isFormValid = formKey.currentState!.saveAndValidate();
    if (!isFormValid) return;
    final formFields = formKey.currentState!.value;
    final password = formFields["password"] as String;
    final email = formFields["email"] as String;

    loading(true);

    await Future.delayed(const Duration(seconds: 2));
    loading(false);

    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpView()),
      );
    }
  }






  Future<void> _onSubmitPhomeLogin() async {
    FocusScope.of(context).unfocus();
    final isFormValid = formKey.currentState!.saveAndValidate();
    if (!isFormValid) return;
    final formFields = formKey.currentState!.value;
    final phone = formFields["phone"] as String;
    final password = formFields["passwordPhone"] as String;

    loading(true);

    await Future.delayed(const Duration(seconds: 2));
    loading(false);

    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpView()),
      );
    }
  }
}
