import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onpress,
        child: Container(
          height: 58,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: AppColors.primarycolor,
          ),
          child: loading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.pan_tool, color: Colors.white, size: 20),
                      Text(
                        title,
                        style: TextStyle(
                          color: AppColors.whitecolor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(""),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
