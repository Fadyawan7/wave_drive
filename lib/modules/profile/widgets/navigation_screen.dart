import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/modules/profile/widgets/navigation_menu_item.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  bool _roastingFunctionEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Navigation",
        leadingColor: AppColors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(24),
              NavigationMenuItem(
                title: 'Select default navigation',
                onTap: () {
                  // TODO: Navigate to default navigation selection screen
                },
              ),
              NavigationMenuItem(
                title: 'Roasting function',
                showToggle: true,
                toggleValue: _roastingFunctionEnabled,
                onToggleChanged: (value) {
                  setState(() {
                    _roastingFunctionEnabled = value;
                  });
                },
                showChevron: false,
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
