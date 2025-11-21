// packages
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_icon_button.dart';
import 'package:wave_drive/modules/home/widgets/cancel_reason_bottom_sheet.dart';

class TravelDetailsBottomSheet extends StatelessWidget {
  TravelDetailsBottomSheet({super.key});

  // final UserRequestController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title row
          _buildHeader(context),
          const Gap(16),

          // Pickup and Drop points
          _buildLocationInfo(),
          const Gap(16),

          // Cancel Order
          _buildCancelOption(context),
          Divider(thickness: 1, color: AppColors.strockcolor),

          // Action options
          _buildActionOptions(),
          const Gap(55),

          // Stop New Requests Button
          RoundedIconButton(
            title: "Stop new requests",
            textColor: AppColors.whitecolor,
            onpress: () {
              // Get.toNamed('start_ride_view');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Travel details",
            style: AppTextStyles.text10.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLocationInfo() {
    return Material(
      color: AppColors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Icon(Icons.trip_origin, color: AppColors.graycolor, size: 20),
              Container(height: 40, width: 1, color: AppColors.strockcolor),
              const Icon(
                Icons.location_on,
                color: AppColors.primarycolor,
                size: 22,
              ),
            ],
          ),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pickup point", style: AppTextStyles.text10),
                Text(
                  "Osterhau's Gate 21E, Oslo, 0183",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppColors.blackcolor,
                  ),
                ),
                const Gap(4),
                Divider(thickness: 1, color: AppColors.strockcolor),
                const Gap(4),
                Text("Dropoff point", style: AppTextStyles.text10),
                Text(
                  "Byggmästaregatan 13, Malmö 211 30",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppColors.blackcolor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCancelOption(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const Icon(Icons.close, color: Colors.red),
        title: Text(
          "Cancel Order",
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.red,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CancelReasonBottomSheet()),
          );
        },
      ),
    );
  }

  Widget _buildActionOptions() {
    return Material(
      color: AppColors.bgdrawer,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.person),
            title: Text(
              "Contact Sven",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 0,
              ),
            ),
            onTap: () {
              // Get.toNamed('chat_view');
            },
          ),
          Divider(thickness: 1, color: AppColors.strockcolor),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.navigation),
            title: Text(
              "Google Maps",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 0,
              ),
            ),

            onTap: () {},
          ),
          Divider(thickness: 1, color: AppColors.strockcolor),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.camera_alt),
            title: Text(
              "Way bill",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 0,
              ),
            ),
            onTap: () {
              // Get.toNamed('travel_log_detail_view');
            },
          ),
          Divider(thickness: 1, color: AppColors.strockcolor),
        ],
      ),
    );
  }
}
