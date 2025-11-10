import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class FlipImageWidget extends StatefulWidget {
  final String imageUrl;
  final Duration duration;
  final Widget? frontChild;
  final Widget? backChild;

  const FlipImageWidget({
    super.key,
    required this.imageUrl,
    this.duration = const Duration(seconds: 2),
    this.frontChild = const Center(child: Text('?')),
    this.backChild,
  });

  @override
  _FlipImageWidgetState createState() => _FlipImageWidgetState();
}

class _FlipImageWidgetState extends State<FlipImageWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleFlip() {
    if (_controller.status == AnimationStatus.dismissed ||
        _controller.status == AnimationStatus.reverse) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleFlip,
      child: Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.0015)
          ..rotateY(pi * _animation.value),
        child: ClipOval(
          child: _animation.value <= 0.5
              ? widget.frontChild ??
                  const Center(
                    child: Text(
                      '?',
                      style: TextStyle(fontSize: 100, color: Colors.white),
                    ),
                  )
              : widget.backChild ??
                  Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
        ),
      ),
    );
  }
}

//................................ after 5 second it automatically flip for 1 time same repition......

class FlipCardWidget extends StatefulWidget {
  final String imageUrl;
  final Duration duration;
  final Widget? frontChild;
  final Widget? backChild;

  const FlipCardWidget({
    super.key,
    required this.imageUrl,
    this.duration = const Duration(seconds: 3),
    this.frontChild = const Center(child: Text('?')),
    this.backChild,
  });

  @override
  _FlipCardWidgetState createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Timer? _flipTimer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _startAutoFlip();
  }

  void _startAutoFlip() {
    _flipTimer?.cancel();
    _flipTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (_controller.status == AnimationStatus.dismissed ||
          _controller.status == AnimationStatus.reverse) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _flipTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.status == AnimationStatus.dismissed ||
            _controller.status == AnimationStatus.reverse) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      child: Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.0015)
          ..rotateY(pi * _animation.value),
        child: _animation.value <= 0.5
            ? widget.frontChild ??
                const Center(
                  child: Text(
                    '?',
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                )
            : Transform(
                alignment: Alignment.center,
                transform:
                    Matrix4.rotationY(pi), // Flipping backChild 180 degrees
                child: widget.backChild ??
                    Image.network(widget.imageUrl, fit: BoxFit.cover),
              ),
      ),
    );
  }
}
