import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/modules/profile/widgets/app_setting_menu_item.dart';
import 'package:wave_drive/modules/setting/widgets/quick_access_screen.dart';
import 'package:wave_drive/modules/setting/widgets/auto_accept_screen.dart';
import 'package:wave_drive/modules/setting/widgets/sound_setting_screen.dart';

class AppSettingScreen extends StatefulWidget {
  const AppSettingScreen({super.key});

  @override
  State<AppSettingScreen> createState() => _AppSettingScreenState();
}

class _AppSettingScreenState extends State<AppSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "App setting",
        leadingColor: AppColors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(24),
              AppSettingMenuItem(
                title: 'Quick access',
                subtitle: 'Icon off / widget off',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuickAccessScreen(),
                    ),
                  );
                },
              ),
              AppSettingMenuItem(
                title: 'Auto-Accept',
                subtitle: 'Off',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AutoAcceptScreen(),
                    ),
                  );
                },
              ),
              AppSettingMenuItem(
                title: 'Sound Setting',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SoundSettingScreen(),
                    ),
                  );
                },
              ),
              AppSettingMenuItem(
                title: 'Theme',
                subtitle: 'System default',
                onTap: () {
                  // TODO: Navigate to Theme settings
                },
              ),
              AppSettingMenuItem(
                title: 'Permission Guide',
                onTap: () {
                  // TODO: Navigate to Permission Guide
                },
              ),
              AppSettingMenuItem(
                title: 'Language',
                subtitle: 'English, US',
                onTap: () {
                  // TODO: Navigate to Language settings
                },
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}

