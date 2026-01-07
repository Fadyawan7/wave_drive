// ignore_for_file: public_member_api_docs, sort_constructors_first
// packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/routes/routes.dart';

import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_icons.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/bottom_sheet/default_bottom_sheet.dart';
import 'package:wave_drive/core/shared/widgets/dialogs/confirm_dialog.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_icon_button.dart';
import 'package:wave_drive/modules/home/widgets/cancel_reason_bottom_sheet.dart';
import 'package:wave_drive/modules/ride/cubit/ride_cubit.dart';

class TravelDetailsBottonSheet {
  static Future<T?> show<T>(
    BuildContext context, {
    bool barrierDismissible = true,

    required String pickAddress,
    required String dropAddress,
  }) {
    return DefaultBottomSheet.show<T>(
      boarder: 12,
      context,
      barrierDismissible: barrierDismissible,
      showDivider: false,

      child: TravelDetails(pickAddress: pickAddress, dropAddress: dropAddress),
    );
  }
}

class TravelDetails extends StatelessWidget {
  final String pickAddress;
  final String dropAddress;

  const TravelDetails({super.key, required this.pickAddress, required this.dropAddress});

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
          const Divider(thickness: 1, color: AppColors.strockcolor),

          // Action options
          _buildActionOptions(),
          const Gap(55),

          // Stop New Requests Button
          RoundedIconButton(
            title: "Stop new requests",
            onpress: () {
              // Get.toNamed('start_ride_view');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Travel details", style: AppTextStyles.text20.copyWith(fontWeight: FontWeight.w600)),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const AppImage(path: AppIcons.cross, color: AppColors.black),
        ),
        //  IconButton(icon: const Icon(Icons.close), onPressed: () {}),
      ],
    );
  }

  Widget _buildLocationInfo() {
    return Material(
      color: AppColors.white,
      child: Row(
        children: [
          Column(
            children: [
              const Icon(Icons.trip_origin, color: AppColors.graycolor, size: 20),
              Container(height: 40, width: 1, color: AppColors.strockcolor),
              const Icon(Icons.location_on, color: AppColors.primarycolor, size: 22),
            ],
          ),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pickup point", style: AppTextStyles.text10),
                Text(pickAddress, style: GoogleFonts.poppins(fontSize: 14, color: AppColors.blackcolor)),
                const Gap(4),
                const Divider(thickness: 1, color: AppColors.strockcolor),
                const Gap(4),
                Text("Dropoff point", style: AppTextStyles.text10),
                Text(dropAddress, style: GoogleFonts.poppins(fontSize: 14, color: AppColors.blackcolor)),
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
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.red, fontWeight: FontWeight.w500),
        ),
        onTap: () {
          Navigator.pop(context);
          CancelReasonBottomSheet.show(
            context,
            onCancal: () {
              ConfirmDialog.show(
                onConfirm: (){
                 context.read<RideCubit>().onCancleRide();
                },
                title: 'Cancel the trip?',
                isVerticalActions: true,

                description:
                    "Cancellation of the trip may affect your driver points. Are you sure you want to cancel? ",
              );
            },
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
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0),
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
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0),
            ),

            onTap: () {},
          ),
          Divider(thickness: 1, color: AppColors.strockcolor),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.camera_alt),
            title: Text(
              "Way bill",
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0),
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
