import 'package:flutter/material.dart';

class GlowingDivider extends StatelessWidget {
  final double height;
  final double width;

  const GlowingDivider({super.key, this.height = 150, this.width = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Color(0xFFB3A6FF), Colors.transparent],
          stops: [0.1, 0.5, 0.9],
        ),
      ),
    );
  }
}
