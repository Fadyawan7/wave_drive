import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/module/home/auto_accept_screen.dart';
import 'package:wave_drive/module/home/quick_access_screen.dart';
import 'package:wave_drive/module/home/sound_setting_screen.dart';

class AppSettingScreen extends StatefulWidget {
  const AppSettingScreen({super.key});

  @override
  State<AppSettingScreen> createState() => _AppSettingScreenState();
}

class _AppSettingScreenState extends State<AppSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whitecolor,
        appBar: AppBar(
          backgroundColor: AppColors.whitecolor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title:  Text(
            'App setting',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          children: [
            // Quick access
            _buildSettingTile(
              title: 'Quick access',
              subtitle: 'Icon off / widget off',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuickAccessScreen()),
                );
              },
            ),

            // Auto-Accept
            _buildSettingTile(
              title: 'Auto-Accept',
              subtitle: 'Off',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AutoAcceptScreen()),
                );
              },
            ),

            // Sound Setting
            _buildSettingTile(
              title: 'Sound Setting',
              subtitle: '',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SoundSettingScreen()),
                );
              },
            ),

            // Theme
            _buildSettingTile(
              title: 'Theme',
              subtitle: 'System default',
              onTap: () {},
            ),

            // Permission Guide
            _buildSettingTile(
              title: 'Permission Guide',
              subtitle: '',
              onTap: () {},
            ),

            // Language
            _buildSettingTile(
              title: 'Language',
              subtitle: 'English, US',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.strockcolor, width: 1),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    if (subtitle.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          subtitle,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 14,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppColors.graycolor,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
