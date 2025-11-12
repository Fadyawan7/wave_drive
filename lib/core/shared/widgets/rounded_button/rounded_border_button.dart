import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';

class RoundedBorderButton extends StatelessWidget {
  const RoundedBorderButton({
    super.key,
    this.loading = false,
    this.height = 46,
    this.width = 144,
    this.buttonColor = AppColors.blackcolor,
    this.textColor = AppColors.whitecolor,
    this.icon,
    required this.title,
    required this.onpress,
  });

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onpress;
  final Color textColor, buttonColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 58,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: AppColors.whitecolor,
          border: Border.all(color: AppColors.primarycolor, width: 1),
        ),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      Icon(
                        icon,
                        color: AppColors.primarycolor,
                      ),
                      const Gap(8),
                    ],
                    Text(
                      title,
                      style: TextStyle(
                        color: AppColors.primarycolor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
