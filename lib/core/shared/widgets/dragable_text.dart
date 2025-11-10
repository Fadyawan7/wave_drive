


import 'package:flutter/material.dart';
class DraggableWidget extends StatefulWidget {
  final Widget child;
  final Offset? initPosition;
  final double securityBottom;
  final double additionalRight;
  final double additionalLeft;
  final bool isAllowDrag;

  const DraggableWidget({
    super.key,
    required this.child,
    this.initPosition,
    this.securityBottom = 72,
    this.additionalRight = 0,
    this.additionalLeft = 42,
    this.isAllowDrag = true, // NEW: toggle draggable
  });

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  double? _left;
  double? _top;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initPosition());
  }

  void _initPosition() {
    final screenSize = MediaQuery.of(context).size;

    if (widget.initPosition != null) {
      _left = widget.initPosition!.dx;
      _top = widget.initPosition!.dy;
    } else {
      _left = (screenSize.width / 2) - 100; // assuming width = 200
      _top = (screenSize.height / 2) - 100; // assuming height = 200
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_left == null || _top == null) {
      return const SizedBox(); // wait until init
    }

    return Stack(
      children: [
        Positioned(
          left: _left,
          top: _top,
          child: widget.isAllowDrag
              ? Draggable(
                  feedback: widget.child,
                  onDragEnd: _handleDragEnded,
                  childWhenDragging: const SizedBox(),
                  child: widget.child,
                )
              : widget.child,
        ),
      ],
    );
  }

  void _handleDragEnded(DraggableDetails details) {
    final offset = details.offset;
    setState(() {
      _left = offset.dx;
      _top = offset.dy;
    });

    // TODO: You can send (_left, _top) to Firebase here if needed
  }
}
