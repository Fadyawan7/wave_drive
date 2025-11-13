import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

// widgets (UI only placeholders)
import 'widgets/bottom_sheet_widget.dart';
import 'widgets/driver_prefrences_bottom_sheet.dart';
import 'widgets/online_status_toggle.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool showWavepopup = false;
    final buildMylocationButton = _buildMylocationButton(context);

    return Scaffold(
      body: Stack(
        children: [
          // Background placeholder instead of Google Map
          Positioned.fill(
            child: Container(
              color: Colors.grey[300],
              child: const Center(
                child: Icon(Icons.map, size: 100, color: Colors.grey),
              ),
            ),
          ),

          // Top bar
          Positioned(
            top: 20,
            left: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [_menuButton(), const Gap(40), OnlineStatusToggle()],
            ),
          ),

          // Floating icons
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildFloatingIconImage(
                  context,
                  'assets/images/Vector.png',
                  'Preferences',
                ),
                const Spacer(),
                Column(
                  spacing: 12,
                  children: [
                    buildMylocationButton,
                    _buildFloatingIconImage(
                      context,
                      'assets/images/flatter.png',
                      'Other Action',
                    ),
                  ],
                ),
              ],
            ),
          ),
          showWavepopup == true
              ? Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Automatic approval is disabled. You get runs from Wave',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodytext1,
                      ),
                    ),
                  ),
                )
              : BottomSheetWidget(),
        ],
      ),
    );
  }

  /// Menu button placeholder
  Widget _menuButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Icon(Icons.menu, color: Colors.black),
      ),
    );
  }

  /// Floating icon widget
  Widget _buildFloatingIconImage(
    BuildContext context,
    String imagePath,
    String label,
  ) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$label tapped')));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(88),
        child: Container(
          height: 44,
          width: 44,
          color: Colors.white,
          child: Center(
            child: Image.asset(
              imagePath,
              height: 20,
              width: 20,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMylocationButton(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('My location tapped')));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(88),
        child: Container(
          height: 44,
          width: 44,
          color: Colors.white,
          child: const Center(
            child: Icon(Icons.my_location, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
