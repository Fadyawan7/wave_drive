import 'package:flutter/material.dart';

class RippleTransitions extends StatefulWidget {
  const RippleTransitions({
    required this.child,
    this.color = Colors.black,
    this.delay = Duration.zero,
    this.repeat = false,
    this.minRadius = 40,
    this.ripplesCount = 3,
    this.controller,
    super.key,
  });

  final Widget child;

  final Duration delay;

  final double minRadius;

  final Color color;

  final int ripplesCount;

  final bool repeat;

  final AnimationController? controller;

  @override
  RippleTransitionsState createState() => RippleTransitionsState();
}

class RippleTransitionsState extends State<RippleTransitions>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: CirclePainter(
          widget.controller,
          color: widget.color,
          minRadius: widget.minRadius,
          wavesCount: widget.ripplesCount + 2,
        ),
        child: widget.child,
      );
}

class CirclePainter extends CustomPainter {
  CirclePainter(
    this.animation, {
    required this.wavesCount,
    required this.color,
    this.minRadius,
  }) : super(repaint: animation);

  final Color color;

  final double? minRadius;

  final int wavesCount;

  final Animation<double>? animation;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);

    for (int wave = 0; wave <= wavesCount; wave++) {
      circle(
        canvas,
        rect,
        minRadius,
        wave,
        animation!.value,
        wavesCount,
        color,
      );
    }
  }

  void circle(
    Canvas canvas,
    Rect rect,
    double? minRadius,
    int wave,
    double value,
    int? length,
    Color circleColor,
  ) {
    Color color = circleColor;
    double r;
    if (wave != 0) {
      final double opacity =
          (1 - ((wave - 1) / length!) - value).clamp(0.0, 1.0);
      color = color.withOpacity(opacity);

      r = minRadius! * (1 + (wave * value)) * value;
      final Paint paint = Paint()..color = color;
      canvas.drawCircle(rect.center, r, paint);
    }
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;
}
