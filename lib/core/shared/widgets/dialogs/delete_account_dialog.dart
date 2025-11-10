import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';

class DeleteAccDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    double? width,
    Function()? onDelete,
  }) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.black33,
        title: Text(
          'Delete Account',
          style: AppTextStyles.textBold18.copyWith(color: AppColors.red),
        ),
        content: Text(
          'Are you sure you want to delete your account? This action cannot be undone.',
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
            onPressed: () => onDelete,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.red,
              foregroundColor: AppColors.white,
            ),
            child: Text('Delete', style: AppTextStyles.textMed16),
          ),
        ],
      ),
    );
  }
}
