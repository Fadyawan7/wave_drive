// packages
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/widgets/utils.dart';

class OTPInputFieldWidget extends StatelessWidget {
  const OTPInputFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      textStyle: GoogleFonts.poppins(fontSize: 14, color: AppColors.graycolor),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 68,
        fieldWidth: 77,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedFillColor: Colors.white,
        activeColor: AppColors.inputboxcolor,
        inactiveColor: AppColors.inputboxcolor,
        selectedColor: AppColors.inputboxcolor,
      ),
      enableActiveFill: true,
      onChanged: (value) {
        print("OTP entered: $value");
      },
      onCompleted: (otp) {
        print("OTP completed: $otp");
        Utils.snackBar('Otp entered: $otp', 'OTP');

        // Navigate when enter value
        // Get.toNamed('/dashboard_view');
      },
    );
  }
}
