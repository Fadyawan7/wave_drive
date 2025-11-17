import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_button.dart';
import 'package:wave_drive/module/home/widgets/bottom_trevel_details_sheet.dart';

class UserRequestBottomsheet extends StatefulWidget {
  const UserRequestBottomsheet({super.key});

  @override
  State<UserRequestBottomsheet> createState() => _UserRequestBottomsheetState();
}

class _UserRequestBottomsheetState extends State<UserRequestBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.55,
      builder: (context, scrollController) {
        return ListView(
          controller: scrollController,
          children: [
            _buildTimerSection(context),

            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [_buildTripInfo(), _buildLocationDetails()],
              ),
            ),
          ],
        );
      },
    );
  }

  // ---------------------------------------------------------
  Widget _buildTimerSection(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 63,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFDBE6F4),
              // borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
          ),

          // STATIC PROGRESS BAR (50%)
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 63,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: const BoxDecoration(
                color: Color(0xFF002D72),
                // borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
            ),
          ),

          // TEXT
          Text(
            "Accept in 00:10",
            style: AppTextStyles.homeprimarytext.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------
  Widget _buildTripInfo() {
    return Material(
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildInfoText('13 min'),
          SizedBox(
            height: 25,
            child: Center(
              child: Container(width: 1, color: AppColors.strockcolor),
            ),
          ),
          _buildInfoText('9.0 km'),
          SizedBox(
            height: 25,
            child: Center(
              child: Container(width: 1, color: AppColors.strockcolor),
            ),
          ),
          _buildInfoText('83 kr'),
        ],
      ),
    );
  }

  Widget _buildInfoText(String title) {
    return Material(
      color: AppColors.white,
      child: Text(
        title,
        style: AppTextStyles.bodytext.copyWith(
          color: AppColors.primarycolor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ---------------------------------------------------------
  Widget _buildLocationDetails() {
    return Material(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.trip_origin,
                      color: AppColors.primarycolor,
                      size: 18,
                    ),
                    Container(
                      width: 1,
                      height: 50,
                      color: AppColors.strockcolor,
                    ),
                    Icon(
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
                      Text(
                        "Pickup point",
                        style: AppTextStyles.homesecoundarytext,
                      ),
                      Text(
                        "Osterhau's Gate 21E, Oslo, 0183",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: AppColors.blackcolor,
                        ),
                      ),
                      const Gap(4),
                      const Divider(color: AppColors.strockcolor, thickness: 1),
                      const Gap(4),
                      Text(
                        "Dropout point",
                        style: AppTextStyles.homesecoundarytext,
                      ),
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

            const Gap(16),

            // Rating Section
            _buildRatingInfo(),
            const Gap(20),

            // Accept Button (STATIC)
            RoundedButton(
              title: 'Accept',
              onpress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TravelDetailsBottomSheet(),
                  ),
                );
              },
              buttonColor: AppColors.primarycolor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingInfo() {
    return Material(
      color: AppColors.white,
      child: Row(
        children: [
          Text(
            "Wave - 5.0",
            style: AppTextStyles.homeprimarytext.copyWith(
              color: AppColors.primarycolor,
              fontWeight: FontWeight.w300,
            ),
          ),
          const Gap(4),
          const Icon(Icons.star, size: 16, color: Colors.orange),
          const Gap(4),
          const Text(
            "(3 Reviews)",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
