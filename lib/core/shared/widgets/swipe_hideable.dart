import 'package:flutter/material.dart';

class SwipeToHide extends StatefulWidget {
  final List<Widget> swipeChildren;
  final List<Widget> belowSwipeChildren;
  final List<Widget> aboveSwipeChildren;
  final Widget child;
  final bool initiallyVisible;
  final ValueChanged<bool>? onVisibilityChanged;
  final bool canSwipe;

  const SwipeToHide({
    super.key,
    required this.swipeChildren,
    required this.child,
    this.belowSwipeChildren = const [],
    this.aboveSwipeChildren = const [],
    this.initiallyVisible = true,
    this.onVisibilityChanged,
    this.canSwipe = false,
  });

  @override
  State<SwipeToHide> createState() => _SwipeToHideState();
}

class _SwipeToHideState extends State<SwipeToHide>
    with SingleTickerProviderStateMixin {
  late bool _visible;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _visible = widget.initiallyVisible;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    )..value = _visible ? 0.0 : 1.0;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final width = MediaQuery.of(context).size.width;
    _controller.value += details.delta.dx / width;
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    const threshold = 0.5;
    if (_controller.value > threshold) {
      _controller.animateTo(1.0, curve: Curves.easeOut);
      _setVisible(false);
    } else {
      _controller.animateTo(0.0, curve: Curves.easeOut);
      _setVisible(true);
    }
  }

  void _setVisible(bool value) {
    if (_visible != value) {
      setState(() => _visible = value);
      widget.onVisibilityChanged?.call(_visible);
    }
  }

  bool get isVisible => _visible;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (val) {
        if (widget.canSwipe) {
          _onHorizontalDragUpdate(val);
          return;
        }
      },
      onHorizontalDragEnd: (val) {
        if (widget.canSwipe) {
          _onHorizontalDragEnd(val);
          return;
        }
      },
      child: Stack(
        children: [
          // Base child
          widget.child,

          // Below swipe layer
          ...widget.belowSwipeChildren,

          // Swipe layer
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Transform.translate(
                offset: Offset(
                  MediaQuery.of(context).size.width * _controller.value,
                  0,
                ),
                child: Stack(children: widget.swipeChildren),
              );
            },
          ),

          // Above swipe layer
          ...widget.aboveSwipeChildren,
        ],
      ),
    );
  }
}
