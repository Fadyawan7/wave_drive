// packages
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/module/home/acceptance_rate_view.dart';
import 'package:wave_drive/module/home/driver_score_view.dart';
import 'package:wave_drive/module/home/widgets/user_request_bottom_sheet.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.3,
      maxChildSize: 0.55,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(16),
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),

              // Offer Card
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserRequestBottomsheet(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.whitecolor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.strockcolor, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 12,
                        spreadRadius: 1,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/percentage_icon.png',
                        width: 24,
                        height: 24,
                        color: AppColors.primarycolor,
                      ),
                      const Gap(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Get 50kr for 5 rides",
                              style: AppTextStyles.homeprimarytext.copyWith(
                                color: AppColors.primarycolor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Start riding today!",
                              style: AppTextStyles.homesecoundarytext,
                            ),
                          ],
                        ),
                      ),
                      Text("1/5", style: AppTextStyles.homeprimarytext),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              // Today's Earnings & Driver Score Row
              Row(
                children: [
                  Expanded(
                    child: _infoCard(
                      title: "Today's earnings",
                      value: "0.00 Kr",
                      onTap: () {},
                    ),
                  ),
                  const Gap(12),
                  Expanded(
                    child: _infoCard(
                      title: "Driver Score",
                      valueWidget: Row(
                        children: [
                          const Icon(
                            Icons.military_tech,
                            color: AppColors.primarycolor,
                          ),
                          Gap(4),
                          Text(
                            "Copter",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primarycolor,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DriverScoreView(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const Gap(12),

              // Acceptance Rate Card
              _infoCard(
                title: "Acceptance Rate",
                value: "99%",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AcceptanceRateView(),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper method
  Widget _infoCard({
    required String title,
    String? value,
    Widget? valueWidget,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 5),
        decoration: BoxDecoration(
          color: AppColors.whitecolor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.strockcolor, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05), // light grey/black shadow
              blurRadius: 12,
              spreadRadius: 1,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.homesecoundarytext),
                Gap(11),
                valueWidget ??
                    Text(value ?? "", style: AppTextStyles.homeprimarytext),
              ],
            ),
            Spacer(),
            const Icon(Icons.chevron_right, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}
