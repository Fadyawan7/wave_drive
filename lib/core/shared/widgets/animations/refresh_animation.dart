import 'dart:math';
import 'package:flutter/material.dart';

class RotatingImageWidget extends StatefulWidget {
  final String imagePath;
  final double? height;
  final Duration duration;
  final VoidCallback onRotate;

  const RotatingImageWidget({
    super.key,
    required this.imagePath,
    this.height,
    this.duration = const Duration(seconds: 1),
    required this.onRotate,
  });

  @override
  _RotatingImageWidgetState createState() => _RotatingImageWidgetState();
}

class _RotatingImageWidgetState extends State<RotatingImageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isClockwise = true; // Track rotation direction

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startRotation() {
    if (_controller.isAnimating) {
      _controller.stop();
    } else {
      _controller.forward(from: 0).then((_) {
        _controller.reset();
        widget.onRotate(); // Trigger text change
        setState(() {
          _isClockwise = !_isClockwise; // Toggle direction
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startRotation,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Transform.rotate(
            angle: -_controller.value * 2 * pi,
            child: child,
          );
        },
        child: Image.asset(
          widget.imagePath,
          height: widget.height,
        ),
      ),
    );
  }
}
