import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/modules/earn_more/model/history_model.dart';
import 'package:wave_drive/modules/earn_more/ride_summary_screen.dart';

class RideHistoryScreen extends StatefulWidget {
  const RideHistoryScreen({super.key});

  @override
  State<RideHistoryScreen> createState() => _RideHistoryScreenState();
}

class _RideHistoryScreenState extends State<RideHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        titleWidget: Text(
          "Ride History",
          style: AppTextStyles.text18.copyWith(fontWeight: FontWeight.w500),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: momentPostList.length,
        itemBuilder: (context, index) {
          final item = momentPostList[index];

          // Destination color logic
          Color destinationColor;
          if (item.destination == "Ride Finished") {
            destinationColor = Colors.green;
          } else if (item.destination!.contains("Cancelled")) {
            destinationColor = Colors.red;
          } else {
            destinationColor = Colors.orange;
          }

          return _RideHistoryCard(
            item: item,
            destinationColor: destinationColor,
          );
        },
      ),
    );
  }
}

class _RideHistoryCard extends StatelessWidget {
  const _RideHistoryCard({required this.item, required this.destinationColor});

  final HistoryModel item;
  final Color destinationColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RideSummaryScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),

        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.dateTime ?? '',
              style: AppTextStyles.text14.copyWith(
                fontWeight: FontWeight.w300,
                color: AppColors.grayA9,
              ),
            ),
            Gap(12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    item.location ?? '',
                    style: AppTextStyles.text14.copyWith(
                      color: AppColors.black33,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 24,
                  child: Center(
                    child: Icon(
                      item.voiletIccon,
                      color: AppColors.black33,
                      size: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                item.ruppes != null
                    ? Text(
                        "${item.ruppes ?? ""} Kr",
                        style: AppTextStyles.text12.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.black33,
                        ),
                      )
                    : SizedBox(),
                SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 13,
                  color: AppColors.grayCF,
                ),
              ],
            ),
            Gap(12),
            Text(
              item.destination ?? '',
              style: AppTextStyles.text14.copyWith(
                color: destinationColor,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
