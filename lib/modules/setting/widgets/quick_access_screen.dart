import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/modules/setting/widgets/quick_access_toggle_item.dart';

class QuickAccessScreen extends StatefulWidget {
  const QuickAccessScreen({super.key});

  @override
  State<QuickAccessScreen> createState() => _QuickAccessScreenState();
}

class _QuickAccessScreenState extends State<QuickAccessScreen> {
  bool _quickAccessButtonEnabled = true;
  bool _widgetEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Quick access widget",
        leadingColor: AppColors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(24),
              QuickAccessToggleItem(
                title: 'Quick access button',
                description:
                    'The button is displayed over applications to be able to receive orders',
                value: _quickAccessButtonEnabled,
                onChanged: (value) {
                  setState(() {
                    _quickAccessButtonEnabled = value;
                  });
                },
              ),
              QuickAccessToggleItem(
                title: 'Widget',
                description:
                    'The widget help to manage the trip when you are in an active trip',
                value: _widgetEnabled,
                onChanged: (value) {
                  setState(() {
                    _widgetEnabled = value;
                  });
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
