import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

class DriverTimeLimitScreen extends StatefulWidget {
  const DriverTimeLimitScreen({super.key});

  @override
  State<DriverTimeLimitScreen> createState() => _DriverTimeLimitScreenState();
}

class _DriverTimeLimitScreenState extends State<DriverTimeLimitScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Driving time limit',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Time Info Section
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTimeInfo('13h', 'Driving time limit'),
                    Container(
                      width: 1,
                      height: 40,
                      color: AppColors.strockcolor,
                    ),
                    _buildTimeInfo('6h', 'Until time resets'),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Limited online hours title
              Text(
                'Limited online hours',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: AppColors.blackcolor,
                ),
              ),
              const SizedBox(height: 12),

              // Description
              Text(
                'For road safety and to ensure high-quality service, Wave places a 13 hour(s) maximum driving limit from when you',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.graycolor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeInfo(String time, String label) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          time,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        const SizedBox(width: 9),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
