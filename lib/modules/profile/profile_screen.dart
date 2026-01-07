import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/avatar/avatar_default.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/modules/profile/widgets/profile_menu_item.dart';
import 'package:wave_drive/modules/profile/widgets/vehicle_screen.dart';
import 'package:wave_drive/modules/profile/widgets/navigation_screen.dart';
import 'package:wave_drive/modules/profile/widgets/account_screen.dart';
import 'package:wave_drive/modules/profile/widgets/security_screen.dart';
import 'package:wave_drive/modules/profile/widgets/app_setting_screen.dart';
import 'package:wave_drive/modules/profile/widgets/about_screen.dart';




@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "My Profile",
        leadingColor: AppColors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(24),
            _BuildUserInfo(
              userName: 'Iftikhar Baig',
              userImage: "",
              phone: '+123456789878',
            ),
            const Gap(24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  ProfileMenuItem(
                    icon: const Icon(
                      Icons.directions_car,
                      size: 24,
                      color: AppColors.black,
                    ),
                    title: 'Vehicle',
                    subtitle: 'OJB451 Toyota Prius Plus 2016',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VehicleScreen(),
                        ),
                      );
                    },
                  ),
                  ProfileMenuItem(
                    icon: const Icon(
                      Icons.navigation,
                      size: 24,
                      color: AppColors.black,
                    ),
                    title: 'Navigation',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavigationScreen(),
                        ),
                      );
                    },
                  ),
                  ProfileMenuItem(
                    icon: const Icon(
                      Icons.security,
                      size: 24,
                      color: AppColors.black,
                    ),
                    title: 'Security',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SecurityScreen(),
                        ),
                      );
                    },
                  ),
                  ProfileMenuItem(
                    icon: const Icon(
                      Icons.person,
                      size: 24,
                      color: AppColors.black,
                    ),
                    title: 'Account',
                    showStatusIcon: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AccountScreen(),
                        ),
                      );
                    },
                  ),
                  ProfileMenuItem(
                    icon: const Icon(
                      Icons.settings,
                      size: 24,
                      color: AppColors.black,
                    ),
                    title: 'App Setting',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AppSettingScreen(),
                        ),
                      );
                    },
                  ),
                  ProfileMenuItem(
                    icon: const Icon(
                      Icons.info_outline,
                      size: 24,
                      color: AppColors.black,
                    ),
                    title: 'About',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }
}

class _BuildUserInfo extends StatelessWidget {
  final String userName;
  final String userImage;
  final String phone;

  const _BuildUserInfo({
    required this.userName,
    required this.userImage,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          AvatarDefault(
            radius: 30,
            username: userName,
            imageUrl: userImage,
          ),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  userName,
                  style: AppTextStyles.text18.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                const Gap(4),
                Text(
                  phone,
                  style: AppTextStyles.text14.copyWith(
                    color: AppColors.grayA9,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: AppColors.primarycolor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                'S',
                style: AppTextStyles.text14.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
