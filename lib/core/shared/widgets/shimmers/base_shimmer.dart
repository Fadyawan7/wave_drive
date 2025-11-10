import 'dart:async';

import 'package:flutter/material.dart';

enum FadeTheme { light, dark }

class BaseShimmer extends StatefulWidget {
  final Color? highlightColor;
  final Color? baseColor;
  final double radius;
  final double width;
  final double? height;

  final FadeTheme? fadeTheme;

  final int millisecondsDelay;

  const BaseShimmer({
    super.key,
    this.millisecondsDelay = 0,
    this.radius = 0,
    this.fadeTheme = FadeTheme.light,
    this.highlightColor,
    this.baseColor,
    required this.width,
    this.height,
  }) : assert(
            (highlightColor != null && baseColor != null) || fadeTheme != null);

  factory BaseShimmer.round(
          {required double size,
          Color? highlightColor,
          int millisecondsDelay = 0,
          Color? baseColor}) =>
      BaseShimmer(
        height: size,
        width: size,
        radius: size / 2,
        baseColor: baseColor,
        highlightColor: highlightColor,
        millisecondsDelay: millisecondsDelay,
      );

  @override
  _BaseShimmerState createState() => _BaseShimmerState();
}

class _BaseShimmerState extends State<BaseShimmer> {
  static final isHighLightStream =
      Stream<bool>.periodic(const Duration(seconds: 1), (x) => x.isEven)
          .asBroadcastStream();
  bool isHighLight = true;
  late StreamSubscription sub;

  Color get highLightColor {
    if (widget.fadeTheme != null) {
      switch (widget.fadeTheme) {
        case FadeTheme.light:
          return const Color(0xffF9F9FB);
        case FadeTheme.dark:
          return const Color(0xff3A3E3F);
        default:
          return const Color(0xff3A3E3F);
      }
    }
    return widget.highlightColor!;
  }

  Color get baseColor {
    if (widget.fadeTheme != null) {
      switch (widget.fadeTheme) {
        case FadeTheme.light:
          return const Color(0xffE6E8EB);
        case FadeTheme.dark:
          return const Color(0xff2A2C2E);
        default:
          return const Color(0xff2A2C2E);
      }
    }
    return widget.baseColor!;
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  void safeSetState() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    sub = isHighLightStream.listen((v) {
      if (widget.millisecondsDelay != 0) {
        Future.delayed(Duration(milliseconds: widget.millisecondsDelay), () {
          isHighLight = v;
          safeSetState();
        });
      } else {
        isHighLight = v;
        safeSetState();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 1200),
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: isHighLight ? highLightColor : baseColor,
          borderRadius: BorderRadius.circular(widget.radius)),
    );
  }
}




class ShimmerNotificationItem extends StatelessWidget {
  const ShimmerNotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // Avatar
           BaseShimmer.round(size: 48),

          const SizedBox(width: 12),

          // Title, body, time
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseShimmer(
                  width: width * 0.4,
                  height: 14,
                  radius: 4,
                ),
                const SizedBox(height: 8),
                BaseShimmer(
                  width: width * 0.6,
                  height: 12,
                  radius: 4,
                ),
                const SizedBox(height: 4),
                BaseShimmer(
                  width: width * 0.2,
                  height: 10,
                  radius: 4,
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Action (e.g., follow button or image)
          const BaseShimmer(
            width: 60,
            height: 24,
            radius: 4,
          ),
        ],
      ),
    );
  }
}
