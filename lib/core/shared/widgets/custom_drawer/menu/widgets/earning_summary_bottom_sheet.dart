import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

class EarningsSummaryBottomSheet extends StatefulWidget {
  const EarningsSummaryBottomSheet({super.key});

  @override
  State<EarningsSummaryBottomSheet> createState() =>
      _EarningsSummaryBottomSheetState();
}

class _EarningsSummaryBottomSheetState
    extends State<EarningsSummaryBottomSheet> {
  String selectedPeriod = "Daily";

  // Dummy values (You can replace with API data)
  String summaryDate = "12 Nov 2025";
  double income = 200.0;
  double deductions = 40.0;
  double commission = 20.0;

  @override
  Widget build(BuildContext context) {
    double yourEarning = income - deductions - commission;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top handle bar
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFDDDDDD),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const Gap(16),

          // Title
          Text("Earnings Summary", style: AppTextStyles.bodytext),

          const Gap(16),

          // PERIOD SELECTOR
          Container(
            height: 53,
            decoration: const BoxDecoration(color: Color(0xFFF7F7F7)),
            child: Row(
              children: [
                _buildPeriodTab("Daily"),
                _buildPeriodTab("Weekly"),
                _buildPeriodTab("Monthly"),
              ],
            ),
          ),

          const Gap(16),

          // BACK BUTTON + DATE
          Row(
            spacing: 80,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios, color: AppColors.primarycolor),
                onPressed: () => Navigator.pop(context),
              ),
              Text(
                summaryDate,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF222222),
                ),
              ),
            ],
          ),

          const Gap(16),

          // INCOME DETAILS
          _buildSummaryRow("Income", "${income}kr"),
          const Gap(12),
          _buildSummaryRow("Deductions", "${deductions}kr"),
          const Gap(12),
          _buildSummaryRow("Wave Commission", "${commission}kr"),

          const Gap(16),

          const Divider(color: Color(0xFFEEEEEE), height: 1, thickness: 1),

          const Gap(16),

          // TOTAL
          _buildSummaryRow("Your Earning", "${yourEarning}kr", isTotal: true),

          const Gap(46),
        ],
      ),
    );
  }

  // PERIOD TAB WIDGET
  Widget _buildPeriodTab(String period) {
    final bool isSelected = selectedPeriod == period;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedPeriod = period;

            // Update dummy values based on selected tab
            if (period == "Daily") {
              income = 200;
              deductions = 40;
              commission = 20;
              summaryDate = "12 Nov 2025";
            } else if (period == "Weekly") {
              income = 1200;
              deductions = 180;
              commission = 100;
              summaryDate = "4–10 Nov 2025";
            } else {
              income = 5200;
              deductions = 600;
              commission = 400;
              summaryDate = "Nov 2025";
            }
          });
        },
        child: Container(
          height: 36,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            period,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  // REUSABLE ROW
  Widget _buildSummaryRow(String title, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
            color: isTotal ? const Color(0xFF222222) : const Color(0xFF666666),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w400,
            color: isTotal ? const Color(0xFF222222) : const Color(0xFF666666),
          ),
        ),
      ],
    );
  }
}
