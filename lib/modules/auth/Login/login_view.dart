// packages
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
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_fill_text_field.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_phone_textfield.dart';
import 'package:wave_drive/core/shared/widgets/tab_bar/custom_selection_tab_bar.dart';
import 'package:wave_drive/modules/auth/Login/otp_view.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseScreen<LoginView>
    with SingleTickerProviderStateMixin, FormMixin {
  late TabController tabController;
  bool _isHide = true;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        setState(() {
          _selectedTabIndex = tabController.index;
        });
      }
    });
  }

  toogleVisiblity() => setState(() {
    _isHide = !_isHide;
  });

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        titleWidget: Text(
          "Login",
          style: AppTextStyles.text18.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: FormBuilder(
        key: formKey,
        child: Column(
          children: [
            Gap(24),

            // Custom Selection TabBar
            CustomSelectionTabBar(
              tabs: const ['Phone number', 'Email or username'],
              selectedIndex: _selectedTabIndex,
              onTabChanged: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
                tabController.animateTo(index);
              },
            ),

            const Gap(36),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  // Phone Tab
                  _buildPhoneTab(context),

                  // Email Tab
                  _buildEmailTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTab() {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "We’ll use it to verify your account and send updates about nearby ride requests.",
            style: AppTextStyles.text14.copyWith(
              fontWeight: FontWeight.w300,
              color: AppColors.grayA9,
            ),
          ),
          Gap(18),
          FormBuilderFillTextField(
            name: 'email',
            hintText: "Email address or username",
            validator: emailValidators,
          ),

          // const Gap(24),
          // FormBuilderFillTextField(
          //   name: 'password',
          //   hintText: "Password",
          //   validator: requiredValidators,
          //   obscureText: _isHide,

          //   prefixIcon: Icon(Icons.lock, color: AppColors.blackcolor),
          //   suffixIcon: IconButton(
          //     onPressed: toogleVisiblity,
          //     icon: Icon(_isHide ? Icons.visibility : Icons.visibility_off),
          //   ),
          // ),

          // Gap(12),
          // _buildForgetPass(),
          const Gap(54),
          PrimaryButton(text: "Login", onPressed: _onSubmitEmailLogin),
        ],
      ),
    );
  }

  Widget _buildPhoneTab(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 30),
      child: Column(
        children: [
          Text(
            "We’ll use it to verify your account and send updates about nearby ride requests.",
            style: AppTextStyles.text14.copyWith(
              fontWeight: FontWeight.w300,
              color: AppColors.grayA9,
            ),
          ),
          Gap(18),
          FormBuilderPhoneField(
            height: 58,
            label: "Phone number",
            name: 'phone',
            validator: requiredValidators,
          ),

          // FormBuilderFillTextField(
          //   name: 'passwordPhone',
          //   hintText: "Password",
          //   validator: requiredValidators,
          //   obscureText: _isHide,
          //   suffixIcon: IconButton(
          //     onPressed: toogleVisiblity,
          //     icon: Icon(_isHide ? Icons.visibility : Icons.visibility_off),
          //   ),

          //   prefixIcon: Icon(Icons.lock, color: AppColors.blackcolor),
          // ),
          // Gap(12),
          // // forget pass
          // _buildForgetPass(),
          const Gap(54),
          PrimaryButton(text: "Continue", onPressed: _onSubmitPhomeLogin),
        ],
      ),
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
    // final password = formFields["password"] as String;
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
    // final password = formFields["passwordPhone"] as String;

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
