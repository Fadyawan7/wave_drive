import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_outlined_button.dart';
import 'package:wave_drive/modules/auth/Login/login_view.dart';
import 'package:wave_drive/modules/auth/Signup/signup_view.dart';

class LoginSignupView extends StatelessWidget {
  const LoginSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 200,
              bottom: 100,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'WAVE Driver',
                  style: AppTextStyles.textBold41.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  'Driver extra Wave Earn extra\n money driving',

                  style: AppTextStyles.text18.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),

                PrimaryButton(
                  text: "Login",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()),
                    );
                  },
                ),
                Gap(20),

                PrimaryOutlinedButton(
                  text: "Sign Up",

                  onPressed: () {
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
