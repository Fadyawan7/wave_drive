import 'dart:async';

import 'package:flutter/material.dart';

class CustomGifPlayer extends StatefulWidget {
  final double width;
  final double height;

  const CustomGifPlayer({super.key, required this.width, required this.height});

  @override
  State<CustomGifPlayer> createState() => _CustomGifPlayerState();
}

class _CustomGifPlayerState extends State<CustomGifPlayer> {
  int _currentFrame = 0;
  late Timer _timer;

  final int totalFrames = 30;
  final Duration frameDuration = const Duration(milliseconds: 40); // ~25 FPS

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    _timer = Timer.periodic(frameDuration, (timer) {
      setState(() {
        _currentFrame = (_currentFrame + 1) % totalFrames;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imagePath =
        'assets/animation/frame_${_currentFrame.toString().padLeft(3, '0')}.png';

    return Image.asset(
      imagePath,
      width: widget.width,
      height: widget.height,
      fit: BoxFit.cover,
    );
  }
}
