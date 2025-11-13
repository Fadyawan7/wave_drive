// packages
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_button.dart';

class UserRequestBottomsheet extends StatefulWidget {
  const UserRequestBottomsheet({super.key});

  @override
  State<UserRequestBottomsheet> createState() => _UserRequestBottomsheetState();
}

class _UserRequestBottomsheetState extends State<UserRequestBottomsheet> {
  @override
  void initState() {
    super.initState();
  }

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
            // Timer + Progress Bar
            _buildTimerSection(),

            // Main Content
            Expanded(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Trip Info
                      _buildTripInfo(),
                      const Divider(height: 30),

                      // Location Details
                      _buildLocationDetails(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTimerSection() {
    double progress = 0.5; // Static placeholder

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 63,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFDBE6F4),
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 63,
            width: MediaQuery.of(context).size.width * progress,
            decoration: BoxDecoration(
              color: const Color(0xFF002D72),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
          ),
        ),
        Text(
          "Accept in 00:30",
          style: AppTextStyles.homeprimarytext.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildTripInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildInfoText('13 min'),
        _buildInfoText('9.0 km'),
        _buildInfoText('83 kr'),
      ],
    );
  }

  Widget _buildLocationDetails() {
    return Column(
      children: [
        // Pickup/Dropoff
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Icon(
                  Icons.trip_origin,
                  color: AppColors.primarycolor,
                  size: 18,
                ),
                Container(width: 2, height: 80, color: Colors.grey.shade300),
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
                  Text("Pickup point", style: AppTextStyles.homesecoundarytext),
                  Text(
                    "Osterhau’s Gate 21E, Oslo, 0183",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  const Gap(12),
                  const Divider(),
                  const Gap(12),
                  Text(
                    "Dropout point",
                    style: AppTextStyles.homesecoundarytext,
                  ),
                  Text(
                    "Byggmästaregatan 13, Malmö 211 30",
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(16),

        // Rating
        _buildRatingInfo(),
        const Gap(20),

        // Accept Button
        RoundedButton(
          title: 'Accept',
          onpress: () {
            // Placeholder - no functionality
          },
        ),
      ],
    );
  }

  Widget _buildRatingInfo() {
    return Row(
      children: [
        Text(
          "Wave - 5.0",
          style: AppTextStyles.homeprimarytext.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(4),
        const Icon(Icons.star, size: 16, color: Colors.orange),
        const Gap(4),
        const Text("(3 Reviews)", style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildInfoText(String title) {
    return Text(title, style: AppTextStyles.bodytext);
  }
}
