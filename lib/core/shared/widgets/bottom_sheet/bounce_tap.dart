import 'dart:async';

import 'package:flutter/material.dart';

class BounceTap extends StatefulWidget {
  const BounceTap({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final VoidCallback onTap;

  @override
  BounceTapState createState() => BounceTapState();
}

class BounceTapState extends State<BounceTap>
    with SingleTickerProviderStateMixin {
  final animationDuration = const Duration(milliseconds: 200);

  late AnimationController _controller;
  late double _scale;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: animationDuration,
      upperBound: 0.1,
    )..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return InkWell(
      onTap: widget.onTap,
      onTapDown: (_) {
        unawaited(_controller.forward());
      },
      onTapUp: (_) {
        unawaited(_controller.reverse());
      },
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}
