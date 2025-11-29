import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';
import 'package:wave_drive/modules/home/acceptance_rate_view.dart';
import 'package:wave_drive/modules/home/driver_score_view.dart';
import 'package:wave_drive/modules/home/widgets/user_request_bottom_sheet.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.3,
      maxChildSize: 0.45,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.whiteFB,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,

                  decoration: BoxDecoration(
                    color: AppColors.grayD9,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Gap(16),

              // OFFER CARD
              _BuildOfferRideCard(),
              const Gap(16),

              // Today's Earnings & Driver Score Row
              _buildStatesCard(context),

              const Gap(12),

              // ACCEPTANCE RATE
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

  Row _buildStatesCard(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: _infoCard(
            title: "Today's earnings",
            value: "0.00 Kr",
            onTap: () {},
          ),
        ),

        Expanded(
          child: _infoCard(
            title: "Driver Score",
            value: "98%",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DriverScoreView()),
              );
            },
          ),
        ),
      ],
    );
  }

  // Helper Card
  Widget _infoCard({
    required String title,
    required String value,

    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
            color: AppColors.white4A.withValues(alpha: .3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.gray9E.withOpacity(0.25),
              blurRadius: 12,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.text12.copyWith(
                      fontWeight: FontWeight.w300,
                      color: AppColors.black33,
                    ),
                  ),
                ),
                const Gap(8),
                const Icon(Icons.chevron_right, color: AppColors.black33),
              ],
            ),
            Gap(8),
            Text(
              value,
              style: AppTextStyles.text16.copyWith(color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildOfferRideCard extends StatelessWidget {
  const _BuildOfferRideCard();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          color: AppColors.white,
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
            color: AppColors.white4A.withValues(alpha: .3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.gray9E.withOpacity(0.25),
              blurRadius: 12,
              spreadRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            AppImage(
              path: AppIcons.percentageIc,
              size: 28,
              fit: BoxFit.contain,
            ),

            const Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Get 50kr for 5 rides",
                    style: AppTextStyles.text16.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  Gap(4),
                  Text(
                    "Start riding today!",
                    style: AppTextStyles.text14.copyWith(
                      fontWeight: FontWeight.w300,
                      color: AppColors.black33,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "1/5",
              style: AppTextStyles.text16.copyWith(color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
