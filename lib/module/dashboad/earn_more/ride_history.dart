import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/module/dashboad/earn_more/model/history_model.dart';
import 'package:wave_drive/module/dashboad/earn_more/ride_summary_screen.dart';

class RideHistoryScreen extends StatefulWidget {
  const RideHistoryScreen({super.key});

  @override
  State<RideHistoryScreen> createState() => _RideHistoryScreenState();
}

class _RideHistoryScreenState extends State<RideHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text(
          "Ride History",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RideSummaryScreen(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(14),
              height: 110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.dateTime ?? '',
                    style: TextStyle(color: AppColors.graycolor, fontSize: 13),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          item.location ?? '',
                          style: AppTextStyles.earnprimary.copyWith(
                            color: AppColors.blackcolor,
                            fontWeight: FontWeight.w600,
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
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: AppColors.black,
                              ),
                            )
                          : SizedBox(),
                      SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 13,
                        color: AppColors.graycolor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.destination ?? '',
                    style: AppTextStyles.litetext.copyWith(
                      color: destinationColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
