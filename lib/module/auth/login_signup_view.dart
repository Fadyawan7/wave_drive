// packages
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_button.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_unfil_button.dart';
import 'package:wave_drive/module/auth/Login/login_view.dart';
import 'package:wave_drive/module/auth/Signup/signup_view.dart';

class LoginSignupView extends StatelessWidget {
  const LoginSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('WAVE Driver', style: AppTextStyles.logotext),
                Text(
                  'Driver extra Wave Earn extra\n money driving',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodytext,
                ),
                Gap(200),
                RoundedButton(
                  title: 'Login',
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()),
                    );
                  },
                ),
                Gap(20),
                RoundedUnfillButton(
                  title: 'Sign Up',
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupView()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
