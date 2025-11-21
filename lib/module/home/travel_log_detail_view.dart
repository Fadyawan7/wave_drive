import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';

class TravelLogDetailView extends StatelessWidget {
  const TravelLogDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel log', style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackcolor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Booking Details Section
            _buildSectionRow(title: 'Booking Details:', value: '02.02.2025'),
            const Gap(24),

            // Estimated Price
            _buildLabelValueRow(
              label: 'Estimated price:',
              value: '134.00 kr',
              valueStyle: AppTextStyles.homeprimarytext.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Gap(24),

            // Passenger
            _buildSectionRow(title: 'Passenger:', value: 'Sven'),
            const Gap(24),

            // Ordered Through
            _buildSectionRow(title: 'Ordered through:', value: 'Wave'),
            const Gap(24),

            // Pickup Location
            _buildSectionRow(
              title: 'Pickup:',
              value: 'Byggmästaregatan\n13, Malmö 2ll 30',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionRow({required String title, required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: Text(title, style: AppTextStyles.bodytext)),
        Expanded(flex: 2, child: Text(value, style: AppTextStyles.bodytext)),
      ],
    );
  }

  Widget _buildLabelValueRow({
    required String label,
    required String value,
    TextStyle? valueStyle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 24,
      children: [
        Text(label, style: AppTextStyles.bodytext),
        Text(value, style: valueStyle ?? AppTextStyles.bodytext),
      ],
    );
  }
}
