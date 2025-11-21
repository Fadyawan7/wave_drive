// packages
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
// files

class Resendcodebottomsheet extends StatelessWidget {
  const Resendcodebottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        // Makes bottom sheet wrap content
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(16),
          Text(
            "Didn't receive the code?",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(8),
          Text(
            "Resend to +46 736962195",
            style: GoogleFonts.poppins(fontSize: 14),
          ),
          Gap(8),

          Divider(),
          ListTile(
            minTileHeight: 10.0,
            leading: Image.asset(
              AppImages.messageicon,
              height: 22,
              color: AppColors.blackcolor,
            ),
            title: Text("Resend code by SMS"),
            onTap: () {
              // Handle SMS resend
            },
          ),
          Divider(),
          ListTile(
            minTileHeight: 10.0,

            leading: Image.asset(
              AppImages.phoneIcon,
              height: 22,
              color: AppColors.blackcolor,
            ),
            title: Text("Request call back"),
            onTap: () {
              // Handle call request
            },
          ),
          Divider(),
          ListTile(
            minTileHeight: 10.0,

            leading: Image.asset(
              AppImages.editPhoneIcon,
              height: 22,
              color: AppColors.blackcolor,
            ),
            title: Text("Edit phone number"),
            onTap: () {
              // Handle phone number edit
            },
          ),
          Gap(15),
        ],
      ),
    );
  }
}
