import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';


class PrivacyView extends StatelessWidget {
  const PrivacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy", style: AppTextStyles.bodytext1),
        centerTitle: true,
        backgroundColor: AppColors.whitecolor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackcolor),
          onPressed: (){Navigator.pop(context);},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Gap(20),
            ListTile(
              leading: const Icon(Icons.insert_drive_file, color: Colors.black),
              title: Text(
                "Your personal data",
                style: AppTextStyles.bodytext,
              ),
              subtitle: const Text(
                "Download a copy of your data",
                style: TextStyle(color: Colors.grey),
              ),
              trailing: const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Colors.grey),
              onTap: () {
                // Get.toNamed('personel_data_view');
                // Handle navigation here
              },
            ),
            const Divider(height: 1, thickness: 1),
          ],
        ),
      ),
      backgroundColor: AppColors.whitecolor,
    );
  }
}
