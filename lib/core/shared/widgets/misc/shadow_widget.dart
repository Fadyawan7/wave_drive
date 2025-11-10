import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';

class ShadowWidget extends StatelessWidget {
  const ShadowWidget({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform.translate(
          offset: Offset.zero,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent, width: 0),
              ),
              child: Opacity(
                opacity: 0.05,
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    AppColors.black,
                    BlendMode.srcATop,
                  ),
                  child: widget,
                ),
              ),
            ),
          ),
        ),
        widget,
      ],
    );
  }
}
