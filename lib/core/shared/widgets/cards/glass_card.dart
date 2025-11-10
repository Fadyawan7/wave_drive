import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final double opacity;
  final Widget? child;

  final BorderRadius? borderRadius;
  final double? height;
  final double? width;
  final Color? color;
  final BoxBorder? border;
  final BoxShape shape;
  final Gradient? gradient;
  final bool hasBorder;

  const GlassCard({
    super.key,
    this.opacity = 0.3,
    this.child,
    this.border,
    this.height,
    this.width,
    this.borderRadius,
    this.color,
    this.gradient,
    this.shape = BoxShape.rectangle,
    this.hasBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    final colorCustom = color ?? Colors.black.withOpacity(opacity);
    final borderRadiusCustom = borderRadius ?? BorderRadius.circular(99);
    final borderCustom = hasBorder
        ? border ??
            Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 0.3,
            )
        : null;

    final Widget widget = DecoratedBox(
      decoration: BoxDecoration(
        shape: shape,
        color: colorCustom,
        borderRadius: shape == BoxShape.circle ? null : borderRadiusCustom,
        gradient: gradient,
      ),
      child: child,
    );

    return Container(
      width: width,
      height: height,
      foregroundDecoration: BoxDecoration(
        borderRadius: borderRadiusCustom,
        border: borderCustom,
      ),
      child: widget,
    );
  }
}
