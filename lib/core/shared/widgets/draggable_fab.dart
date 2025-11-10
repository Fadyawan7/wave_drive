// ignore_for_file: constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';

class DraggableFab extends StatefulWidget {
  final Widget child;
  final Offset? initPosition;
  final double securityBottom;
  final double additionalRight;
  final double additionalLeft;

  const DraggableFab({
    super.key,
    required this.child,
    this.initPosition,
    this.securityBottom = 72,
    this.additionalRight = 0,
    this.additionalLeft = 42,
  });

  @override
  _DraggableFabState createState() => _DraggableFabState();
}

class _DraggableFabState extends State<DraggableFab> {
  late Size _widgetSize;
  double? _left;
  double? _top;
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  double? _screenWidthMid;
  double? _screenHeightMid;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _getWidgetSize(context));
  }

  void _getWidgetSize(BuildContext context) {
    _widgetSize = context.size!;

    if (widget.initPosition != null) {
      _calculatePosition(widget.initPosition!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: _left,
          top: _top,
          child: Draggable(
            feedback: widget.child,
            onDragEnd: _handleDragEnded,
            childWhenDragging: const SizedBox(),
            child: widget.child,
          ),
        ),
      ],
    );
  }

  void _handleDragEnded(DraggableDetails draggableDetails) {
    _calculatePosition(draggableDetails.offset);
  }

  void _calculatePosition(Offset targetOffset) {
    if (_screenWidthMid == null || _screenHeightMid == null) {
      final Size screenSize = MediaQuery.of(context).size;
      _screenWidth = screenSize.width;
      _screenHeight = screenSize.height;
      _screenWidthMid = _screenWidth / 2;
      _screenHeightMid = _screenHeight / 2;
    }

    switch (_getAnchor(targetOffset)) {
      case Anchor.LEFT_FIRST:
        _left = _widgetSize.width / 2 - widget.additionalLeft;
        _top = max(_widgetSize.height / 2, targetOffset.dy);
      case Anchor.TOP_FIRST:
        _left =
            max(_widgetSize.width / 2, targetOffset.dx) - widget.additionalLeft;
        _top = _widgetSize.height / 2;
      case Anchor.RIGHT_SECOND:
        _left = _screenWidth - _widgetSize.width + widget.additionalRight;
        _top = max(_widgetSize.height, targetOffset.dy);
      case Anchor.TOP_SECOND:
        _left = min(_screenWidth - _widgetSize.width, targetOffset.dx) +
            widget.additionalRight;
        _top = _widgetSize.height / 2;
      case Anchor.LEFT_THIRD:
        _left = _widgetSize.width / 2 - widget.additionalLeft;
        _top = min(_screenHeight - _widgetSize.height - widget.securityBottom,
            targetOffset.dy);
      case Anchor.BOTTOM_THIRD:
        _left = _widgetSize.width / 2 - widget.additionalLeft;
        _top = _screenHeight - _widgetSize.height - widget.securityBottom;
      case Anchor.RIGHT_FOURTH:
        _left = _screenWidth - _widgetSize.width + widget.additionalRight;
        _top = min(_screenHeight - _widgetSize.height - widget.securityBottom,
            targetOffset.dy);
      case Anchor.BOTTOM_FOURTH:
        _left = _screenWidth - _widgetSize.width + widget.additionalRight;
        _top = _screenHeight - _widgetSize.height - widget.securityBottom;
    }
    setState(() {});
  }

  /// Computes the appropriate anchor screen edge for the widget
  Anchor _getAnchor(Offset position) {
    if (position.dx < _screenWidthMid! && position.dy < _screenHeightMid!) {
      return position.dx < position.dy ? Anchor.LEFT_FIRST : Anchor.TOP_FIRST;
    } else if (position.dx >= _screenWidthMid! &&
        position.dy < _screenHeightMid!) {
      return _screenWidth - position.dx < position.dy
          ? Anchor.RIGHT_SECOND
          : Anchor.TOP_SECOND;
    } else if (position.dx < _screenWidthMid! &&
        position.dy >= _screenHeightMid!) {
      return position.dx < _screenHeight - position.dy
          ? Anchor.LEFT_THIRD
          : Anchor.BOTTOM_THIRD;
    } else {
      return _screenWidth - position.dx < _screenHeight - position.dy
          ? Anchor.RIGHT_FOURTH
          : Anchor.BOTTOM_FOURTH;
    }
  }
}

/// #######################################
/// #       |          #        |         #
/// #    TOP_FIRST     #  TOP_SECOND      #
/// # - LEFT_FIRST     #  RIGHT_SECOND -  #
/// #######################################
/// # - LEFT_THIRD     #   RIGHT_FOURTH - #
/// #  BOTTOM_THIRD    #   BOTTOM_FOURTH  #
/// #     |            #       |          #
/// #######################################
enum Anchor {
  LEFT_FIRST,
  TOP_FIRST,
  RIGHT_SECOND,
  TOP_SECOND,
  LEFT_THIRD,
  BOTTOM_THIRD,
  RIGHT_FOURTH,
  BOTTOM_FOURTH,
}
