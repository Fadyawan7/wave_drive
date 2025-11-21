import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';

import 'widgets/info_expansion_tile.dart';

class AcceptanceRateView extends StatelessWidget {
  const AcceptanceRateView({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data (Static)
    const double acceptanceRate = 92.0;
    const int last10Accepted = 9;
    const int totalRequests = 120;
    const int acceptedRequests = 110;
    const int declinedRequests = 10;

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
          // -----------------------------------
          // Acceptance Rate Summary
          // -----------------------------------
          Container(
            color: AppColors.liteprimarycolor,
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                Text(
                  '$acceptanceRate%',
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
                      size: 28,
                      color: AppColors.primarycolor,
                    ),

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '$last10Accepted',
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
                        color: AppColors.blackcolor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // -----------------------------------
          // Statistics
          // -----------------------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              spacing: 24,
              children: [
                _row("Trips requested", "$totalRequests"),
                const Divider(),

                _iconRow(Icons.check, Colors.green, "Accepted", "$acceptedRequests"),
                _iconRow(Icons.close, Colors.red, "Declined", "$declinedRequests"),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Based on your last $totalRequests requests',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray6F,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),
          const Gap(10),

          // -----------------------------------
          // Info section title
          // -----------------------------------
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

          // -----------------------------------
          // Expansion Info Tiles
          // -----------------------------------
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
                  icon: Icons.info_outline,
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

  // ---------------------------------------
  // Reusable Rows
  // ---------------------------------------

  Widget _row(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.blackcolor,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.blackcolor,
          ),
        ),
      ],
    );
  }

  Widget _iconRow(IconData icon, Color color, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 20),
            const Gap(8),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.blackcolor,
              ),
            ),
          ],
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.blackcolor,
          ),
        ),
      ],
    );
  }
}
