// packages
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/module/home/widgets/info_expansion_tile.dart';

class AcceptanceRateView extends StatelessWidget {
  const AcceptanceRateView({super.key});

  TextStyle get poppinsBold =>
      GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700);

  TextStyle get poppinsMedium =>
      GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500);

  TextStyle get poppinsRegular =>
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.blackcolor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Acceptance rate',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.blackcolor,
          ),
        ),
        centerTitle: true,
      ),

      backgroundColor: AppColors.whitecolor,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ---------------- HEADER ----------------
          Container(
            color: AppColors.liteprimarycolor,
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                Text(
                  '92%',
                  style: GoogleFonts.poppins(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackcolor,
                  ),
                ),
                const Gap(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.arrow_drop_up,
                      size: 48,
                      color: AppColors.primarycolor,
                    ),

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '9',
                            style: GoogleFonts.poppins(
                              color: AppColors.primarycolor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: '/10',
                            style: GoogleFonts.poppins(
                              color: AppColors.primarycolor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                    const Gap(4),
                    Text(
                      'Last 10 requests',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: AppColors.gray6F,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // ---------------- DETAILS SECTION ----------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              spacing: 24,
              children: [
                _buildRow("Trips requested", "100"),
                const Divider(),

                // Accepted
                _buildIconRow(Icons.check, Colors.green, "Accepted", "92"),

                // Declined
                _buildIconRow(Icons.close, Colors.red, "Declined", "8"),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Based on your last 100 requests',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: AppColors.gray6F,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),
          const Gap(10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Text(
              'More information',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blackcolor,
              ),
            ),
          ),

          const Gap(10),

          // ---------------- BOTTOM EXPANSION LIST ----------------
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                InfoExpansionTile(
                  icon: Icons.calculate_outlined,
                  title: 'How acceptance rate is calculated',
                  content:
                      'This percentage shows how often a driver accepts incoming ride requests. For example, if a driver receives 50 requests and accepts 45, their acceptance rate is 90%.',
                ),

                const Gap(12),
                const Divider(),

                InfoExpansionTile(
                  icon: Icons.access_alarm,
                  title: 'Why acceptance rate matters',
                  content:
                      'A high acceptance rate reflects your reliability and increases your chances of getting more ride requests and rewards.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------- REUSABLE ROW ----------
  Widget _buildRow(String left, String right) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          left,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.blackcolor,
          ),
        ),
        Text(
          right,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.blackcolor,
          ),
        ),
      ],
    );
  }

  // ---------- REUSABLE ICON ROW ----------
  Widget _buildIconRow(IconData icon, Color color, String text, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 20),
            const Gap(8),
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Text(
          value,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
