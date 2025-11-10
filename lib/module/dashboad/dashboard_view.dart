import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/module/home/earn_more_view.dart';
import 'package:wave_drive/module/home/help_view.dart';
import 'package:wave_drive/module/home/home_view.dart';
import 'package:wave_drive/module/home/travels_view.dart';

// packages
import 'widgets/custom_animation_bottombar.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final _inactiveColor = AppColors.graycolor;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: const [
            HomeView(),
            EarnMoreView(),
            TravelsView(),
            HelpView(),
          ],
        ),
      ),
      bottomNavigationBar: CustomAnimatedBottomBar(
        containerHeight: 70,
        backgroundColor: AppColors.whitecolor,
        selectedIndex: _selectedIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: _onItemTapped,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: AppColors.primarycolor,
            inactiveColor: _inactiveColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.payments),
            title: Text('Earn more'),
            activeColor: AppColors.primarycolor,
            inactiveColor: _inactiveColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.watch_later),
            title: Text('Travels'),
            activeColor: AppColors.primarycolor,
            inactiveColor: _inactiveColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.help),
            title: Text('Help'),
            activeColor: AppColors.primarycolor,
            inactiveColor: _inactiveColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
