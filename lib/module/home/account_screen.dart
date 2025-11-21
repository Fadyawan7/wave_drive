import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/module/home/driver_time_limit_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
            'Account',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            children: [
              // Driver Time Left
              _buildMenuItem(
                title: 'Driver Time Left',
                subtitle: '13h',
                showArrow: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DriverTimeLimitScreen(),
                    ),
                  );
                },
              ),
              // const SizedBox(height: 16),

              // Document
              _buildMenuItem(
                title: 'Document',
                subtitle: '',
                showArrow: true,
                onTap: () {},
              ),
              // const SizedBox(height: 16),

              // Invite friends to drive
              _buildMenuItem(
                icon: Icons.card_giftcard,
                title: 'Invite friends to drive',
                subtitle: '',
                showArrow: true,
                titleColor: AppColors.primarycolor,
                onTap: () {},
              ),
              // const SizedBox(height: 24),

              // Logout
              _buildMenuItemRed(icon: Icons.logout, title: 'Logout'),
              // const SizedBox(height: 12),

              // Permanently Delete
              _buildMenuItemRed(
                icon: Icons.delete,
                title: 'Permanently Delete',
                showBorder: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    IconData? icon,
    required String title,
    required String subtitle,
    required bool showArrow,
    required VoidCallback onTap,
    Color titleColor = Colors.black,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.strockcolor, width: 1),
            ),
          ),
          child: Row(
            children: [
              if (icon != null) ...[
                Icon(icon, color: AppColors.primarycolor, size: 24),
                const SizedBox(width: 16),
              ],
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: titleColor,
                      ),
                    ),
                    Spacer(),
                    if (subtitle.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 2, right: 12),
                        child: Text(
                          subtitle,
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (showArrow)
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.black,
                  size: 16,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItemRed({
    required IconData icon,
    required String title,
    bool showBorder = true,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          decoration: BoxDecoration(
            border: showBorder
                ? Border(
                    bottom: BorderSide(color: AppColors.strockcolor, width: 1),
                  )
                : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.red, size: 24),
              const SizedBox(width: 16),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
