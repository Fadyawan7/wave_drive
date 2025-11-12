import 'package:flutter/material.dart';
// packages
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/module/auth/Login/widgets/otp_input_field_widget1.dart';

class OtpView2 extends StatelessWidget {
  const OtpView2({super.key});

  @override
  Widget build(BuildContext context) {
    // final ResentOtpController controller = Get.find();

    //  Show bottom sheet if at least one attempt has been made
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (controller.resendAttempts.value >= 1) {
    //     controller.showBottomSheet();
    //   }
    // });
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      body: SafeArea(
        child: Column(
          children: [
            const Gap(46),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter the code',
                    style: GoogleFonts.getFont('Poppins',
                        fontSize: 20.0, color: AppColors.whitecolor),
                  ),
                  const Gap(8),
                  Text(
                    "We have sent you a verification code to +46 713 7185 8191",
                    style: GoogleFonts.getFont('Poppins',
                        fontSize: 16.0, color: AppColors.whitecolor),
                  ),
                ],
              ),
            ),
            Gap(54),
            // otp fields
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: OtpInputFieldWidget2(),
            ),
          ],
        ),
      ),
    );
  }
}
