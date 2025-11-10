import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';

class CustomTabIndicator extends Decoration {
  final Color? color;
  final double widthIndicator;

  const CustomTabIndicator({this.color, this.widthIndicator = 8});
  @override
  _CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(this, widthIndicator, onChanged);
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;
  final double widthIndicator;

  _CustomPainter(this.decoration, this.widthIndicator, VoidCallback? onChanged)
    : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    const double indicatorHeight = 2.0;
    const double borderRadius = 3.0;

    final Paint paint = Paint()..strokeWidth = 2;
    final double xAxisPos = offset.dx + configuration.size!.width / 2;
    final double yAxisPos =
        offset.dy + configuration.size!.height - indicatorHeight / 2;
    paint.color = decoration.color ?? AppColors.white;

    final RRect fullRect = RRect.fromRectAndCorners(
      Rect.fromCenter(
        center: Offset(xAxisPos, yAxisPos),
        width: widthIndicator,
        height: indicatorHeight,
      ),
      topLeft: const Radius.circular(borderRadius),
      topRight: const Radius.circular(borderRadius),
      bottomLeft: const Radius.circular(borderRadius),
      bottomRight: const Radius.circular(borderRadius),
    );

    canvas.drawRRect(fullRect, paint);
  }
}
