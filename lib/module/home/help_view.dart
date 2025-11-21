import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/module/home/about_me_screen.dart';
import 'package:wave_drive/module/home/account_screen.dart';
import 'package:wave_drive/module/home/app_setting_screen.dart';
import 'package:wave_drive/module/home/navigation_tab_screen.dart';
import 'package:wave_drive/module/home/vehicle_selection_screen.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'My Profile',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // Profile Header
                _buildProfileHeader(),
      
                // Menu Items
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VehicleSelectScreen(),
                      ),
                    );
                  },
                  child: _buildMenuItem(
                    Icons.directions_car,
                    'Vehicle',
                    'Gjl8451 Toyota Prius Plus 2010',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavigationTabScreen(),
                      ),
                    );
                  },
                  child: _buildMenuItem(Icons.navigation, 'Navigation', ''),
                ),
                _buildMenuItem(Icons.security, 'Security', ''),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AccountScreen()),
                    );
                  },
                  child: _buildMenuItem(Icons.person, 'Account', ''),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AppSettingScreen()),
                    );
                  },
                  child: _buildMenuItem(Icons.settings, 'App Setting', ''),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutMeScreen()),
                    );
                  },
                  child: _buildMenuItem(Icons.info_outline, 'About', ''),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              // Profile Avatar
              CircleAvatar(
                radius: 35,
                backgroundColor: AppColors.boxbgcolor,
                child: const Icon(
                  Icons.person,
                  size: 40,
                  color: AppColors.primarycolor,
                ),
              ),
              const SizedBox(width: 16),
              // Profile Info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Iftikhar Baig',
                    style: AppTextStyles.bodytext1.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '+12346073087B',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(color: AppColors.strockcolor, thickness: 1),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String subtitle) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.strockcolor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(icon, color: AppColors.blackcolor, size: 24),
                ),
                const SizedBox(width: 16),
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
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey[400],
                  size: 16,
                ),
              ],
            ),
          ),
          Divider(color: AppColors.strockcolor, thickness: 1),
        ],
      ),
    );
  }
}
