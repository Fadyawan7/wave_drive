import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/custom_drawer/menu/widgets/earning_summary_bottom_sheet.dart';

class EarningsView extends StatefulWidget {
  const EarningsView({super.key});

  @override
  State<EarningsView> createState() => _EarningsViewState();
}

class _EarningsViewState extends State<EarningsView> {
  // Previously in GetX controller
  double totalEarnings = 0;
  double commissionFee = 0;
  double goalPercentage = 0.25; // example
  int completedTrips = 0;
  int totalRequests = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xFF222222),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text('Earnings', style: AppTextStyles.bodytext1),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header message
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text('Earnings', style: AppTextStyles.bodytext1),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: AppColors.whitecolor,
              child: const Text(
                'Complete trips to see your earnings here',
                style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Earnings row
                  Row(
                    children: [
                      _earningBox(
                        title: "Total Earnings",
                        value: "$totalEarnings kr",
                      ),
                      const Gap(16),
                      _earningBox(
                        title: "Commission Fee",
                        value: "$commissionFee kr",
                      ),
                    ],
                  ),
                  const Gap(12),

                  // View Summary text button
                  Center(
                    child: TextButton(
                      onPressed: () => openSummaryBottomSheet(context),
                      child: const Text(
                        "View Summary",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primarycolor,
                        ),
                      ),
                    ),
                  ),
                  const Gap(24),

                  // Earning target card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Earning Target',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF222222),
                          ),
                        ),
                        const Gap(4),
                        const Text(
                          'Set income goal per day or week',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF666666),
                          ),
                        ),
                        const Gap(16),
                        LinearProgressIndicator(
                          value: goalPercentage,
                          backgroundColor: const Color(0xFFEFEFEF),
                          color: AppColors.primarycolor,
                          minHeight: 6,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        const Gap(8),
                        Text(
                          '${(goalPercentage * 100).toInt()}% of goal achieved',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF666666),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(24),

                  // Activity section
                  const Text(
                    'Activity',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF222222),
                    ),
                  ),
                  const Gap(16),

                  Row(
                    children: [
                      // Hours card
                      _activityBox(
                        title: "Hours",
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(7, (index) {
                                return Container(
                                  width: 6,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE0E0E0),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                );
                              }),
                            ),
                            const Gap(8),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "M",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF666666),
                                  ),
                                ),
                                Text(
                                  "T",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF666666),
                                  ),
                                ),
                                Text(
                                  "W",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF666666),
                                  ),
                                ),
                                Text(
                                  "T",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF666666),
                                  ),
                                ),
                                Text(
                                  "F",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF666666),
                                  ),
                                ),
                                Text(
                                  "S",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF666666),
                                  ),
                                ),
                                Text(
                                  "S",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF666666),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Gap(16),
                      // Trips card
                      _activityBox(
                        onTap: () {
                          Navigator.pushNamed(context, 'activity_view');
                        },
                        title: "Trips",
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$completedTrips/$totalRequests",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF222222),
                              ),
                            ),
                            const Gap(8),
                            const Text(
                              "Complete trips / All Requests",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF666666),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Earning box widget
  Widget _earningBox({required String title, required String value}) {
    return Expanded(
      child: Container(
        height: 90,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14, color: AppColors.blackcolor),
            ),
            const Gap(8),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.primarycolor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Activity box widget
  Widget _activityBox({
    required String title,
    required Widget child,
    required Function() onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 160,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.strockcolor,
                    size: 16,
                  ),
                ],
              ),
              const Gap(8),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}

void openSummaryBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: (context) {
      return EarningsSummaryBottomSheet();
    },
  );
}
