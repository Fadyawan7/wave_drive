import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';

class QuickAccessScreen extends StatefulWidget {
  const QuickAccessScreen({super.key});

  @override
  State<QuickAccessScreen> createState() => _QuickAccessScreenState();
}

class _QuickAccessScreenState extends State<QuickAccessScreen> {
  bool quickAccessButtonEnabled = true;
  bool widgetEnabled = true;

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
            'Quick access widget',
           style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              // Quick access button
              _buildToggleOption(
                title: 'Quick access button',
                description:
                    'The button is displayed over applications to be able to receive orders',
                isEnabled: quickAccessButtonEnabled,
                onToggle: (value) {
                  setState(() {
                    quickAccessButtonEnabled = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              Divider(color: AppColors.strockcolor, thickness: 1),
              // Widget
              _buildToggleOption(
                title: 'Widget',
                description:
                    'The widget help to manage the trip when you are in an active trip',
                isEnabled: widgetEnabled,
                onToggle: (value) {
                  setState(() {
                    widgetEnabled = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleOption({
    required String title,
    required String description,
    required bool isEnabled,
    required Function(bool) onToggle,
  }) {
    return Material(
      color: AppColors.whitecolor,
      child: InkWell(
        onTap: () {
          onToggle(!isEnabled);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                // Custom Toggle Switch
                Transform.scale(
                  scaleX: 0.7,
                  scaleY: 0.6,
                  child: Switch(
                    value: isEnabled,
                    onChanged: onToggle,
                    activeThumbColor: AppColors.white,
                    activeTrackColor: AppColors.primarycolor,
                    inactiveThumbColor: Colors.grey[400],
                    inactiveTrackColor: Colors.grey[300],
                  ),
                ),
              ],
            ),
            Text(
              description,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 13,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
