import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';
import 'package:wave_drive/core/shared/themes/app_icons.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "About",
        leadingColor: AppColors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(48),
            // App Logo
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: AppColors.primarycolor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: AppImage(
                  path: AppIcons.waveLogo,
                  size: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Gap(16),
            // App Version
            Text(
              'App version DA.115.0',
              style: AppTextStyles.text14.copyWith(
                color: AppColors.grayA9,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(48),
            // Acknowledgements Menu Item
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  // TODO: Navigate to Acknowledgements screen
                },
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.description_outlined,
                        size: 24,
                        color: AppColors.black,
                      ),
                      const Gap(12),
                      Expanded(
                        child: Text(
                          'Acknowledgements',
                          style: AppTextStyles.text16.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      const Gap(12),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: AppColors.black1F,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }
}

