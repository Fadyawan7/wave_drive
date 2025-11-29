import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart' show AppColors;

class OnlineStatusToggle extends StatefulWidget {
  final bool isOnline;
  final VoidCallback onTap;

  const OnlineStatusToggle({
    super.key,
    required this.isOnline,
    required this.onTap,
  });

  @override
  State<OnlineStatusToggle> createState() => _OnlineStatusToggleState();
}

class _OnlineStatusToggleState extends State<OnlineStatusToggle> {
  late bool _isOnline;

  @override
  void initState() {
    super.initState();
    _isOnline = widget.isOnline;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        setState(() {
          _isOnline = !_isOnline;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(80),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Dot indicator
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: _isOnline ? AppColors.primary : AppColors.red12,
                shape: BoxShape.circle,
              ),
            ),

            const Gap(8),

            // Status text
            Text(
              _isOnline ? "Online" : "Offline",
              style: TextStyle(
                color: _isOnline ? AppColors.primary : AppColors.red12,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),

            const Gap(12),

            // Switch
            Container(
              width: 60,
              height: 30,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(
                  color: _isOnline ? AppColors.primary : AppColors.grayA9,
                ),
                color: _isOnline ? AppColors.primary : AppColors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 3,
                  ),
                ],
              ),
              alignment: _isOnline
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: _isOnline ? AppColors.white : AppColors.grayA9,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
