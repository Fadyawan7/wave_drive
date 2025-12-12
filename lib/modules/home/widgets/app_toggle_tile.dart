import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';

class AppToggleTile extends StatefulWidget {
  final bool isOnline;
  final String title;
  final VoidCallback onTap;

  const AppToggleTile({
    super.key,
    required this.isOnline,
    required this.title,
    required this.onTap,
  });

  @override
  State<AppToggleTile> createState() => _AppToggleTileState();
}

class _AppToggleTileState extends State<AppToggleTile> {
  late bool _isOnline;

  @override
  void initState() {
    super.initState();
    _isOnline = widget.isOnline;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Status text
          Text(
            widget.title,
            style: AppTextStyles.text16.copyWith(color: AppColors.primary),
          ),

          const Gap(12),

          // Switch
          GestureDetector(
            onTap: () {
              widget.onTap();
              setState(() {
                _isOnline = !_isOnline;
              });
            },
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
