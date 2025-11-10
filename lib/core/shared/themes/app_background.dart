import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_icons.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Background Gradient
        Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topRight,
              radius: 0.75,
              colors: [Color(0xFF2A003D), Color(0xff010101)],
              stops: [0.0, 1.0],
            ),
          ),
        ),

        /// ✅ Bottom-Left Image
        Positioned(
          left: 0,
          bottom: 0,
          child: AppImage(
            path: AppIcons.bottomblur,   // your asset
            width: 140,
            height: 140,
          ),
        ),

        /// Page Body
        child,
      ],
    );
  }
}
