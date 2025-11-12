import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';


class RoundedUnfillButton extends StatelessWidget {
  RoundedUnfillButton({
    super.key,
    this.loading = false,
    this.height = 46,
    this.width = 144,
    this.buttonColor = AppColors.blackcolor,
    this.textColor = AppColors.whitecolor,
    required this.title,
    required this.onpress,
  });
  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onpress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 58,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // subtle black shadow
              blurRadius: 6,
              offset: Offset(0, 3), // shadow position
            ),
          ],
        ),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppColors.blackcolor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
      ),
    );
  }
}
