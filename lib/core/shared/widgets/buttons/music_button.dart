import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';

class MusicButton extends StatefulWidget {
  final String? imageUrl;
  final Function() onPressed;

  const MusicButton({super.key, this.imageUrl, required this.onPressed});

  @override
  _MusicButtonState createState() => _MusicButtonState();
}

class _MusicButtonState extends State<MusicButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.white, width: 2),
          shape: BoxShape.circle,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              top: -10,
              bottom: -10,
              right: -10,
              left: -10,
              child: Lottie.asset(AppLotties.music),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
