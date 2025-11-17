import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/utils/text_transforms.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';

class AvatarDefault extends StatelessWidget {
  const AvatarDefault({
    super.key,
    this.onTap,
    this.imageUrl,
    this.borderRadius = 99,
    this.username,
    this.backgroundColor,
    this.radius = 30,
  });

  final Function()? onTap;
  final String? imageUrl;
  final String? username;
  final Color? backgroundColor;
  final double radius;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        // backgroundColor: getRandomColor(username),
        backgroundColor: backgroundColor ?? AppColors.blue1E,

        // getRandomColor(),
        child: imageUrl != null
            ? SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius),
                  child: AppImage(
                    size: radius * 2,
                    path: imageUrl!,
                    fit: BoxFit.cover,
                    errorPlaceHolder: (context) => Center(
                      child: Text(
                        _convertNameToAvatar(),
                        style: AppTextStyles.textMed18.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Text(
                _convertNameToAvatar(),
                style: AppTextStyles.textMed18.copyWith(
                  color: AppColors.white,
                  fontSize: radius,
                ),
              ),
      ),
    );
  }

  String _convertNameToAvatar() {
    return convertNameToAvatar(username);
  }
}
