// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_icons.dart';
import 'package:wave_drive/core/shared/themes/app_images.dart';
import 'package:wave_drive/core/shared/widgets/buttons/circle_icon_button.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';

class GroupSocialButtons extends StatelessWidget {
  const GroupSocialButtons({
    super.key,
    this.showAppleButton = false,
    this.showGoogleButton = true,
    required this.onLoginWithFacebook,
    required this.onLoginWithTwitter,
    required this.onLoginWithWhatsapp,
    this.onLoginWithApple,
    this.onLoginWithGoogle,
    this.useBigGoogleIcon = false,
    required this.showWhatappButton,
    required this.showXButton,
    required this.showPhoneButton,
    required this.showContactButton,
    this.onLoginWithContact,
    this.onLoginWithPhone,
  }) : assert(
         !showAppleButton || onLoginWithApple != null,
         !showGoogleButton || onLoginWithGoogle != null,
       );

  final bool showAppleButton;
  final bool showPhoneButton;
  final bool showContactButton;
  final bool showWhatappButton;
  final bool showGoogleButton;
  final bool showXButton;
  final Function() onLoginWithFacebook;
  final Function() onLoginWithTwitter;
  final Function()? onLoginWithApple;
  final Function()? onLoginWithGoogle;
  final Function()? onLoginWithWhatsapp;
  final Function()? onLoginWithContact;
  final Function()? onLoginWithPhone;
  final bool useBigGoogleIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (showPhoneButton) ...[
          CircleIconButton(
            icon: const AppImage(path: AppImages.logoPhone),
            onTap: onLoginWithPhone,
            size: 56,
          ),
          const Gap(20),
        ],

        if (showAppleButton) ...[
          CircleIconButton(
            icon: AppImage(path: AppImages.logoapple, size: 40),
            onTap: onLoginWithApple,
          ),
          const Gap(20),
        ],

        if (showContactButton) ...[
          CircleIconButton(
            icon: const AppImage(path: AppImages.logoContace),
            onTap: onLoginWithContact,
            size: 56,
          ),
        ],
      ],
    );
  }
}
