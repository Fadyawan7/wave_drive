// packges
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/widgets/app_bar/app_bar_field.dart';
import 'package:wave_drive/module/auth/Login/widgets/otp_input_field_widget.dart';
import 'package:wave_drive/module/auth/Login/widgets/resendcodeBottomSheet.dart';

class OtpView extends StatelessWidget {
  OtpView({super.key});
  // controller for resent otp
  // final ResentOtpController controller = Get.put(ResentOtpController());
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
              text: 'OTP',
              onpress: () {
                Navigator.pop(context);
              },
            ),
            const Gap(46),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter the code',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontSize: 20.0,
                      color: AppColors.whitecolor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Gap(20),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.whitecolor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(24),
                      const Gap(8),
                      Text(
                        "We have sent you a verification code to +46 713 7185 8191",
                        style: GoogleFonts.getFont(
                          'Poppins',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                      Gap(24),

                      // otp fields
                      OTPInputFieldWidget(),
                      Gap(24),
                      // resend code
                      // Obx(() {
                      // Hide the button when max attempts reached
                      // if (controller.maxAttemptsReached.value) {
                      //   return SizedBox();
                      // }

                      //   return controller.showResendButton.value
                      //       ? TextButton(
                      //           onPressed: () => controller.resetTimer(context),
                      //           child: Text(
                      //             "Resend Code",
                      //             style: GoogleFonts.poppins(
                      //               fontSize: 14.0,
                      //               color: AppColors.primarycolor,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           ),
                      //         )
                      //       : Text(
                      //           'Resend code in 00:${controller.secondsRemaining.value.toString().padLeft(2, '0')}',
                      //           style: GoogleFonts.poppins(
                      //             fontSize: 14.0,
                      //             color: AppColors.blackcolor,
                      //           ),
                      //         );
                      // }),
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled:
                                true, // allows full-height if needed
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                            ),
                            builder: (context) {
                              return const Resendcodebottomsheet();
                            },
                          );
                        },
                        child: Text(
                          "Resend Code",
                          style: GoogleFonts.poppins(
                            fontSize: 14.0,
                            color: AppColors.primarycolor,
                            fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
