import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart' show AppColors;

class OnlineStatusToggle extends StatefulWidget {
  const OnlineStatusToggle({super.key});

  @override
  State<OnlineStatusToggle> createState() => _OnlineStatusToggleState();
}

class _OnlineStatusToggleState extends State<OnlineStatusToggle> {
  bool isOnline = false; // Local toggle state

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Dot indicator
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: isOnline ? Colors.blue[900] : Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          const Gap(11),
          // Status text
          Text(
            isOnline ? "Online" : "Offline",
            style: TextStyle(
              color: isOnline ? Colors.blue[900] : Colors.red,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(48),
          // Switch
          GestureDetector(
            onTap: () {
              setState(() {
                isOnline = !isOnline;
              });
            },
            child: Container(
              width: 60,
              height: 30,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: isOnline ? AppColors.primarycolor : AppColors.graycolor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                  ),
                ],
              ),
              alignment: isOnline
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
