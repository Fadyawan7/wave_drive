import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final BorderRadius? borderRadius;
  final bool hasBorder;

  const GlassCard({
    super.key,
    required this.child,
    this.color,
    this.borderRadius,
    this.hasBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Colors.white.withOpacity(0.2),
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        border: hasBorder ? Border.all(color: Colors.white.withOpacity(0.3)) : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
          ),
        ],
      ),
      child: child,
    );
  }
}
