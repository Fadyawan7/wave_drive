import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_images.dart';
import 'package:wave_drive/module/dashboad/earn_more/earn_more_view.dart';
import 'package:wave_drive/module/home/help_view.dart';
import 'package:wave_drive/module/home/home_view.dart';
import 'package:wave_drive/module/home/travels_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _selectedIndex = 0;

 

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: const [HomeView(), EarnMoreView(), TravelsView(), HelpView()],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.graycolor.withOpacity(0.4),
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          selectedItemColor: AppColors.primarycolor,
          unselectedItemColor: AppColors.graycolor,
          backgroundColor: AppColors.whitecolor,
          onTap: _onItemTapped,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home, color: AppColors.botoomIcon),
              activeIcon: Icon(Icons.home, color: AppColors.primarycolor),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.earnMore, height: 24, width: 24),
              activeIcon: Image.asset(
                AppImages.earnMore,
                color: AppColors.primarycolor,
                height: 24,
                width: 24,
              ),
              label: 'Earn More',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.watch_later, color: AppColors.botoomIcon),
              activeIcon: Icon(
                Icons.watch_later,
                color: AppColors.primarycolor,
              ),
              label: 'Travels',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.help, color: AppColors.botoomIcon),
              activeIcon: Icon(Icons.help, color: AppColors.primarycolor),
              label: 'Help',
            ),
          ],
        ),
      ),
    );
  }
}
