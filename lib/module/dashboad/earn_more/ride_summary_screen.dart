import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_images.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

class RideSummaryScreen extends StatelessWidget {
  const RideSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Ride Summary",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Amount + status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "400.50Kr",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    "Ride Finished",
                    style: AppTextStyles.litetext.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Date and Time
              Row(
                children: [
                  Text(
                    "02 Feb. 21:21",
                    style: TextStyle(color: AppColors.graycolor, fontSize: 13),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "10:45 PM",
                    style: TextStyle(color: AppColors.graycolor, fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Divider(color: AppColors.strockcolor),
              const SizedBox(height: 8),
              // Info section: Time, Distance, Payment
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoColumn("Time", "5 min"),
                  _buildInfoColumn("Distance", "2 Km"),
                  _buildInfoColumn("Payment", "In App"),
                ],
              ),
              const SizedBox(height: 20),

              // Map placeholder
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage(AppImages.rideSummaryMap),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Pickup and Dropout points with connecting line
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      // Pickup icon
                      const Icon(
                        Icons.stop_circle_rounded,
                        size: 24,
                        color: Colors.grey,
                      ),
                      // Vertical divider
                      SizedBox(
                        height: 40,
                        child: Center(
                          child: Container(
                            width: 2,
                            color: AppColors.strockcolor,
                          ),
                        ),
                      ),
                      // Dropout icon
                      const Icon(
                        Icons.location_on,
                        size: 24,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Pickup point text
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pickup point",
                                style: TextStyle(
                                  color: AppColors.graycolor,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                "Jerikoveien 26, Oslo, 1067",
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(color: AppColors.strockcolor),
                        // Dropout point text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dropout point",
                              style: TextStyle(
                                color: AppColors.graycolor,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              "Jerikoveien 26, Oslo, 1067",
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Divider(color: AppColors.strockcolor),
              const SizedBox(height: 15),
              Text(
                "Having an Issue with Customer?",
                style: AppTextStyles.earnprimary.copyWith(
                  color: AppColors.blackcolor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              const Divider(color: AppColors.strockcolor),
              const SizedBox(height: 15),
              Text(
                "Other Help",
                style: AppTextStyles.earnprimary.copyWith(
                  color: AppColors.blackcolor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable info column widget
  Widget _buildInfoColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: AppColors.graycolor, fontSize: 13)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
