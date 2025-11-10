import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';

class LogOutDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    double? width,
    Function()? onLogout,
  }) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.black33,
        title: Text(
          'Logout',
          style: AppTextStyles.textBold18.copyWith(color: AppColors.white),
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: AppTextStyles.text16.copyWith(color: AppColors.gray87),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: AppTextStyles.textMed16.copyWith(color: AppColors.gray87),
            ),
          ),
          ElevatedButton(
            onPressed: onLogout,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryD0,
              foregroundColor: AppColors.white,
            ),
            child: Text(
              'Logout',
              style: AppTextStyles.textMed16.copyWith(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
