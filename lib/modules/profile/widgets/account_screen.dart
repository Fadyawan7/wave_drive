import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/modules/profile/widgets/account_menu_item.dart';
import 'package:wave_drive/modules/profile/widgets/time_limit_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Account",
        leadingColor: AppColors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(24),
              AccountMenuItem(
                title: 'Driver Time Left',
                value: '13h',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TimeLimitScreen(),
                    ),
                  );
                },
              ),
              AccountMenuItem(
                title: 'Document',
                onTap: () {
                  // TODO: Navigate to Document screen
                },
              ),
              AccountMenuItem(
                title: 'Invite friends to drive',
                icon: const Icon(
                  Icons.card_giftcard,
                  size: 24,
                  color: AppColors.primarycolor,
                ),
                onTap: () {
                  // TODO: Handle invite friends
                },
              ),
              AccountMenuItem(
                title: 'Logout',
                icon: const Icon(
                  Icons.logout,
                  size: 24,
                  color: AppColors.redcolor,
                ),
                textColor: AppColors.redcolor,
                showChevron: false,
                onTap: () {
                  // TODO: Handle logout
                },
              ),
              AccountMenuItem(
                title: 'Permanently Delete',
                icon: const Icon(
                  Icons.delete_outline,
                  size: 24,
                  color: AppColors.redcolor,
                ),
                textColor: AppColors.redcolor,
                showChevron: false,
                onTap: () {
                  // TODO: Handle delete account
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
