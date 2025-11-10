import 'package:flutter/widgets.dart';

class GradientBoxBorder extends BoxBorder {
  const GradientBoxBorder({
    required this.gradient,
    this.width = 1.0,
    this.borderRadius,
  });

  final Gradient gradient;
  final double width;
  final BorderRadius? borderRadius;

  @override
  BorderSide get bottom => BorderSide.none;

  @override
  BorderSide get top => BorderSide.none;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(width);

  @override
  bool get isUniform => true;

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    final effectiveBorderRadius = this.borderRadius ?? BorderRadius.zero;

    switch (shape) {
      case BoxShape.circle:
        assert(
          borderRadius == null,
          'A borderRadius can only be given for rectangular boxes.',
        );
        _paintCircle(canvas, rect);
      case BoxShape.rectangle:
        if (effectiveBorderRadius != BorderRadius.zero) {
          _paintRRect(canvas, rect, effectiveBorderRadius);
          return;
        }
        _paintRect(canvas, rect);
    }
  }

  void _paintRect(Canvas canvas, Rect rect) {
    canvas.drawRect(rect.deflate(width / 2), _getPaint(rect));
  }

  void _paintRRect(Canvas canvas, Rect rect, BorderRadius borderRadius) {
    final rRect = borderRadius.toRRect(rect).deflate(width / 2);
    canvas.drawRRect(rRect, _getPaint(rect));
  }

  void _paintCircle(Canvas canvas, Rect rect) {
    final paint = _getPaint(rect);
    final radius = (rect.shortestSide - width) / 2.0;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return this;
  }

  Paint _getPaint(Rect rect) {
    return Paint()
      ..strokeWidth = width
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke;
  }
}
