import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;

  FadeIn({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.delay = Duration.zero,
    this.controller,
    this.manualTrigger = false,
    this.animate = true,
  }) {
    if (manualTrigger == true && controller == null) {
      throw FlutterError('If you want to use manualTrigger:true, \n\n'
          'Then you must provide the controller property, that is a callback like:\n\n'
          ' ( controller: AnimationController) => yourController = controller \n\n');
    }
  }

  @override
  FadeInState createState() => FadeInState();
}

/// FadeState class
/// The animation magic happens here
class FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  /// Animation controller that controls this animation
  late AnimationController controller;

  /// is the widget disposed?
  bool disposed = false;

  /// Animation movement value
  late Animation<double> animation;

  @override
  void dispose() {
    disposed = true;
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = CurvedAnimation(curve: Curves.easeOut, parent: controller);

    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () {
        if (!disposed) {
          controller.forward();
        }
      });
    }

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Launch the animation ASAP or wait if is needed
    if (widget.animate &&
        widget.delay.inMilliseconds == 0 &&
        widget.manualTrigger == false) {
      controller.forward();
    }

    /// If the animation already happen, we can animate it back
    if (!widget.animate) {
      controller.animateBack(0);
    }

    /// Builds the animation with the corresponding
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: animation.value,
          child: widget.child,
        );
      },
    );
  }
}

class FadeInRight extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;

  FadeInRight({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.delay = Duration.zero,
    this.controller,
    this.manualTrigger = false,
    this.animate = true,
    this.from = 100,
  }) {
    if (manualTrigger == true && controller == null) {
      throw FlutterError('If you want to use manualTrigger:true, \n\n'
          'Then you must provide the controller property, that is a callback like:\n\n'
          ' ( controller: AnimationController) => yourController = controller \n\n');
    }
  }

  @override
  FadeInRightState createState() => FadeInRightState();
}

/// FadeState class
/// The animation magic happens here
class FadeInRightState extends State<FadeInRight>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool disposed = false;
  late Animation<double> animation;
  late Animation<double> opacity;
  @override
  void dispose() {
    disposed = true;
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animation = Tween<double>(begin: widget.from, end: 0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    opacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: const Interval(0, 0.65)));

    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () {
        if (!disposed) {
          controller.forward();
        }
      });
    }

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animate &&
        widget.delay.inMilliseconds == 0 &&
        widget.manualTrigger == false) {
      controller.forward();
    }

    /// If FALSE, animate everything back to the original state
    if (!widget.animate) {
      controller.animateBack(0);
    }

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(animation.value, 0),
          child: Opacity(
            opacity: opacity.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}

class FadeOut extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;

  FadeOut({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.delay = Duration.zero,
    this.controller,
    this.manualTrigger = false,
    this.animate = false,
  }) {
    if (manualTrigger == true && controller == null) {
      throw FlutterError('If you want to use manualTrigger:true, \n\n'
          'Then you must provide the controller property, that is a callback like:\n\n'
          ' ( controller: AnimationController) => yourController = controller \n\n');
    }
  }

  @override
  FadeOutState createState() => FadeOutState();
}

/// State class, where the magic happens
class FadeOutState extends State<FadeOut> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool disposed = false;
  late Animation<double> animation;

  @override
  void dispose() {
    disposed = true;
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = Tween(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(curve: Curves.easeOut, parent: controller));

    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () {
        if (!disposed) {
          controller.forward();
        }
      });
    }

    if (widget.controller is Function) {
      widget.controller!(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animate &&
        widget.delay.inMilliseconds == 0 &&
        widget.manualTrigger == false) {
      controller.forward();
    }

    /// If FALSE, animate everything back to original
    if (!widget.animate) {
      controller.animateBack(0);
    }

    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: animation.value,
          child: widget.child,
        );
      },
    );
  }
}
