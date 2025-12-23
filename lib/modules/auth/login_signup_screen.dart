import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/routes/app_router.gr.dart';
import 'package:wave_drive/core/routes/routes.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_outlined_button.dart';




@RoutePage()
class LoginSignupScreen extends StatelessWidget {
  const LoginSignupScreen({super.key});

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
                const Spacer(),

                PrimaryButton(
                  text: "Login",
                  onPressed: () {
                   AppNavigator.popAndPush(context,const LoginRoute() );
                  },
                ),
                const Gap(20),

                PrimaryOutlinedButton(
                  text: "Sign Up",

                  onPressed: () {
                     AppNavigator.popAndPush(context,const SignupRoute() );
                   
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
