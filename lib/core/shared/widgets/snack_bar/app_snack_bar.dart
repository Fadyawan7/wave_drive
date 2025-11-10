import 'dart:async';

import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

typedef ControllerCallback = void Function(AnimationController);

enum DismissType { onTap, onSwipe, none }

OverlayEntry? _previousEntry;

class AppSnackBar {
  // static void showSuccess(
  //   BuildContext context, {
  //   required String title,
  //   Widget? action,
  // }) {
  //   showTopSnackBar(
  //     Overlay.of(context),
  //     Container(
  //       clipBehavior: Clip.hardEdge,
  //       padding: const EdgeInsets.symmetric(vertical: 12),
  //       decoration: BoxDecoration(
  //         color: AppColors.bgSnackBarSuccess,
  //         borderRadius: BorderRadius.circular(8),
  //       ),
  //       width: double.infinity,
  //       child: Padding(
  //         padding: const EdgeInsets.only(left: 16, right: 12),
  //         child: Row(
  //           children: [
  //             Expanded(
  //               child: Row(
  //                 children: [
  //                   AppImage(
  //                     path: AppImages.circleCheckIcon,
  //                   ),
  //                   const Gap(8),
  //                   Flexible(
  //                     child: Padding(
  //                       padding: const EdgeInsets.only(right: 16),
  //                       child: Text(
  //                         title,
  //                         style: AppTextStyles.text14.copyWith(color: AppColors.textSnackBarSuccess, height: 1.3),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             if (action != null) action,
  //           ],
  //         ),
  //       ),
  //     ),
  //     animationDuration: const Duration(milliseconds: 600),
  //     reverseAnimationDuration: const Duration(milliseconds: 600),
  //     curve: Curves.easeInOut,
  //   );
  // }

  static void showError(BuildContext context, {required String title}) {
    showTopSnackBar(
      Overlay.of(context),
      Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.bgError,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 10),
              // child: AppImage(
              //   path: AppImages.smallExclamationTriangleIcon,
              //   size: 25,
              //   color: AppColors.white,
              // ),
              child: Icon(
                Icons.warning_amber_rounded,
                size: 25,
                color: AppColors.white,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  title,
                  style: AppTextStyles.text14.copyWith(
                    color: AppColors.white,
                    height: 1.3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      animationDuration: const Duration(milliseconds: 600),
      reverseAnimationDuration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  static void showDefault(
    BuildContext context, {
    required String title,
    bool persistent = false,
    Function(AnimationController)? onAnimationControllerInit,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.darkPrimary,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 10),
              // child: AppImage(
              //   path: AppImages.smallExclamationTriangleIcon,
              //   size: 25,
              //   color: AppColors.white,
              // ),
              child: Icon(Icons.wifi_rounded, size: 25, color: AppColors.white),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  title,
                  style: AppTextStyles.text14.copyWith(
                    color: AppColors.white,
                    height: 1.3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      animationDuration: const Duration(milliseconds: 600),
      reverseAnimationDuration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      persistent: persistent,
      onAnimationControllerInit: onAnimationControllerInit,
    );
  }
}

void showTopSnackBar(
  OverlayState overlayState,
  Widget child, {
  Duration animationDuration = const Duration(milliseconds: 1200),
  Duration reverseAnimationDuration = const Duration(milliseconds: 550),
  Duration displayDuration = const Duration(milliseconds: 3000),
  VoidCallback? onTap,
  bool persistent = false,
  ControllerCallback? onAnimationControllerInit,
  EdgeInsets padding = const EdgeInsets.all(16),
  Curve curve = Curves.elasticOut,
  Curve reverseCurve = Curves.linearToEaseOut,
  SafeAreaValues safeAreaValues = const SafeAreaValues(),
  DismissType dismissType = DismissType.onTap,
  List<DismissDirection> dismissDirection = const [DismissDirection.up],
}) {
  late OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (_) {
      return _TopSnackBar(
        onDismissed: () {
          overlayEntry.remove();
          _previousEntry = null;
        },
        animationDuration: animationDuration,
        reverseAnimationDuration: reverseAnimationDuration,
        displayDuration: displayDuration,
        onTap: onTap,
        persistent: persistent,
        onAnimationControllerInit: onAnimationControllerInit,
        padding: padding,
        curve: curve,
        reverseCurve: reverseCurve,
        safeAreaValues: safeAreaValues,
        dismissType: dismissType,
        dismissDirections: dismissDirection,
        child: child,
      );
    },
  );

  if (_previousEntry != null && _previousEntry!.mounted) {
    _previousEntry?.remove();
  }

  overlayState.insert(overlayEntry);
  _previousEntry = overlayEntry;
}

class _TopSnackBar extends StatefulWidget {
  const _TopSnackBar({
    required this.child,
    required this.onDismissed,
    required this.animationDuration,
    required this.reverseAnimationDuration,
    required this.displayDuration,
    required this.padding,
    required this.curve,
    required this.reverseCurve,
    required this.safeAreaValues,
    required this.dismissDirections,
    this.onTap,
    this.persistent = false,
    this.onAnimationControllerInit,
    this.dismissType = DismissType.onTap,
  });

  final Duration animationDuration;
  final Widget child;
  final Curve curve;
  final List<DismissDirection> dismissDirections;
  final DismissType dismissType;
  final Duration displayDuration;
  final ControllerCallback? onAnimationControllerInit;
  final VoidCallback onDismissed;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final bool persistent;
  final Duration reverseAnimationDuration;
  final Curve reverseCurve;
  final SafeAreaValues safeAreaValues;

  @override
  _TopSnackBarState createState() => _TopSnackBarState();
}

class _TopSnackBarState extends State<_TopSnackBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _offsetAnimation;
  final _offsetTween = Tween(begin: const Offset(0, -1), end: Offset.zero);

  Timer? _timer;

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
      reverseDuration: widget.reverseAnimationDuration,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed && !widget.persistent) {
        _timer = Timer(widget.displayDuration, () {
          if (mounted) {
            _animationController.reverse();
          }
        });
      }
      if (status == AnimationStatus.dismissed) {
        _timer?.cancel();
        widget.onDismissed.call();
      }
    });

    widget.onAnimationControllerInit?.call(_animationController);

    _offsetAnimation = _offsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: widget.curve,
        reverseCurve: widget.reverseCurve,
      ),
    );
    if (mounted) {
      _animationController.forward();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.padding.top,
      left: widget.padding.left,
      right: widget.padding.right,
      child: SlideTransition(
        position: _offsetAnimation,
        child: SafeArea(
          top: widget.safeAreaValues.top,
          bottom: widget.safeAreaValues.bottom,
          left: widget.safeAreaValues.left,
          right: widget.safeAreaValues.right,
          minimum: widget.safeAreaValues.minimum,
          maintainBottomViewPadding:
              widget.safeAreaValues.maintainBottomViewPadding,
          child: _buildDismissibleChild(),
        ),
      ),
    );
  }

  Widget _buildDismissibleChild() {
    switch (widget.dismissType) {
      case DismissType.onTap:
        return TapBounceContainer(
          onTap: () {
            widget.onTap?.call();
            if (!widget.persistent && mounted) {
              _animationController.reverse();
            }
          },
          child: widget.child,
        );
      case DismissType.onSwipe:
        var childWidget = widget.child;
        for (final direction in widget.dismissDirections) {
          childWidget = Dismissible(
            direction: direction,
            key: UniqueKey(),
            dismissThresholds: const {DismissDirection.up: 0.2},
            confirmDismiss: (direction) async {
              if (!widget.persistent && mounted) {
                if (direction == DismissDirection.down) {
                  await _animationController.reverse();
                } else {
                  _animationController.reset();
                }
              }
              return false;
            },
            child: childWidget,
          );
        }
        return childWidget;
      case DismissType.none:
        return widget.child;
    }
  }
}

class TapBounceContainer extends StatefulWidget {
  const TapBounceContainer({super.key, required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  TapBounceContainerState createState() => TapBounceContainerState();
}

class TapBounceContainerState extends State<TapBounceContainer>
    with SingleTickerProviderStateMixin {
  final animationDuration = const Duration(milliseconds: 200);

  late AnimationController _controller;
  late double _scale;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller =
        AnimationController(
          vsync: this,
          duration: animationDuration,
          upperBound: 0.04,
        )..addListener(() {
          if (mounted) {
            setState(() {});
          }
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onPanEnd: _onPanEnd,
      child: Transform.scale(scale: _scale, child: widget.child),
    );
  }

  void _onTapDown(TapDownDetails details) {
    if (mounted) {
      _controller.forward();
    }
  }

  Future<void> _onTapUp(TapUpDetails details) async {
    await _closeSnackBar();
  }

  Future<void> _onPanEnd(DragEndDetails details) async {
    await _closeSnackBar();
  }

  Future<void> _closeSnackBar() async {
    if (mounted) {
      unawaited(_controller.reverse());
      await Future.delayed(animationDuration);
      widget.onTap?.call();
    }
  }
}

class SafeAreaValues {
  const SafeAreaValues({
    this.left = true,
    this.right = true,
    this.top = true,
    this.bottom = true,
    this.minimum = EdgeInsets.zero,
    this.maintainBottomViewPadding = false,
  });

  final bool bottom;
  final bool left;
  final bool maintainBottomViewPadding;
  final EdgeInsets minimum;
  final bool right;
  final bool top;
}

const kDefaultBoxShadow = [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 8),
    spreadRadius: 1,
    blurRadius: 30,
  ),
];

const kDefaultBorderRadius = BorderRadius.all(Radius.circular(12));
