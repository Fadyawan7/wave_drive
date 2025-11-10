// ignore_for_file: deprecated_consistency, no_wildcard_variable_uses

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ColorizeAnimatedText extends AnimatedText {
  final Duration speed;

  final List<Color> colors;

  final TextDirection textDirection;

  ColorizeAnimatedText(
    String text, {
    super.textAlign,
    required TextStyle super.textStyle,
    this.speed = const Duration(milliseconds: 200),
    required this.colors,
    this.textDirection = TextDirection.ltr,
  })  : assert(null != textStyle.fontSize),
        assert(colors.length > 1),
        super(
          text: text,
          duration: speed * text.characters.length,
        );

  late Animation<double> _colorShifter;
  late Animation<double> _fadeIn;
  late Animation<double> _fadeOut;

  late List<Color> _colors;

  @override
  void initAnimation(AnimationController controller) {
    final tuning = (300.0 * colors.length) *
        (textStyle!.fontSize! / 24.0) *
        0.75 *
        (textCharacters.length / 15.0);

    _fadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.1, curve: Curves.easeOut),
      ),
    );

    _fadeOut = Tween<double>(begin: 1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.9, 1.0, curve: Curves.easeIn),
      ),
    );

    final colorShift = colors.length * tuning;
    final colorTween = textDirection == TextDirection.ltr
        ? Tween<double>(
            begin: 0.0,
            end: colorShift,
          )
        : Tween<double>(
            begin: colorShift,
            end: 0.0,
          );
    _colorShifter = colorTween.animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.easeIn),
      ),
    );

    _colors = textDirection == TextDirection.ltr
        ? colors
        : colors.reversed.toList(growable: false);
  }

  @override
  Widget completeText(BuildContext context) {
    final linearGradient = LinearGradient(colors: _colors).createShader(
      Rect.fromLTWH(0.0, 0.0, _colorShifter.value, 0.0),
    );

    return DefaultTextStyle.merge(
      style: textStyle,
      child: Text(
        text,
        style: TextStyle(foreground: Paint()..shader = linearGradient),
        textAlign: textAlign,
      ),
    );
  }

  @override
  Widget animatedBuilder(BuildContext context, Widget? child) {
    return Opacity(
      opacity: _fadeIn.value != 1.0 ? _fadeIn.value : _fadeOut.value,
      child: completeText(context),
    );
  }
}

@Deprecated('Use AnimatedTextKit with ColorizeAnimatedText instead.')
class ColorizeAnimatedTextKit extends AnimatedTextKit {
  ColorizeAnimatedTextKit({
    super.key,
    required List<String> text,
    TextAlign textAlign = TextAlign.start,
    TextDirection textDirection = TextDirection.ltr,
    required TextStyle textStyle,
    required List<Color> colors,
    Duration speed = const Duration(milliseconds: 200),
    super.pause,
    super.onTap,
    super.onNext,
    super.onNextBeforePause,
    super.onFinished,
    super.isRepeatingAnimation,
    super.totalRepeatCount,
    super.repeatForever,
    super.displayFullTextOnTap,
    super.stopPauseOnTap,
  }) : super(
          animatedTexts: _animatedTexts(
            text,
            textAlign,
            textStyle,
            speed,
            colors,
            textDirection,
          ),
        );

  static List<AnimatedText> _animatedTexts(
    List<String> text,
    TextAlign textAlign,
    TextStyle textStyle,
    Duration speed,
    List<Color> colors,
    TextDirection textDirection,
  ) =>
      text
          .map(
            (t) => ColorizeAnimatedText(
              t,
              textAlign: textAlign,
              textStyle: textStyle,
              speed: speed,
              colors: colors,
              textDirection: textDirection,
            ),
          )
          .toList();
}

abstract class AnimatedText {
  final String text;

  final TextAlign textAlign;

  final TextStyle? textStyle;

  final Duration duration;

  final Characters textCharacters;

  AnimatedText({
    required this.text,
    this.textAlign = TextAlign.start,
    this.textStyle,
    required this.duration,
  }) : textCharacters = text.characters;

  Duration? get remaining => null;

  void initAnimation(AnimationController controller);

  Widget textWidget(String data) => Text(
        data,
        textAlign: textAlign,
        style: textStyle,
      );

  Widget completeText(BuildContext context) => textWidget(text);

  Widget animatedBuilder(BuildContext context, Widget? child);
}

class AnimatedTextKit extends StatefulWidget {
  final List<AnimatedText> animatedTexts;

  final Duration pause;

  final bool displayFullTextOnTap;

  final bool stopPauseOnTap;

  final VoidCallback? onTap;

  final VoidCallback? onFinished;

  final void Function(int, bool)? onNext;

  final void Function(int, bool)? onNextBeforePause;

  final bool isRepeatingAnimation;

  final bool repeatForever;

  final int totalRepeatCount;

  const AnimatedTextKit({
    super.key,
    required this.animatedTexts,
    this.pause = const Duration(milliseconds: 1000),
    this.displayFullTextOnTap = false,
    this.stopPauseOnTap = false,
    this.onTap,
    this.onNext,
    this.onNextBeforePause,
    this.onFinished,
    this.isRepeatingAnimation = true,
    this.totalRepeatCount = 3,
    this.repeatForever = false,
  })  : assert(animatedTexts.length > 0),
        assert(!isRepeatingAnimation || totalRepeatCount > 0 || repeatForever),
        assert(null == onFinished || !repeatForever);

  @override
  _AnimatedTextKitState createState() => _AnimatedTextKitState();
}

class _AnimatedTextKitState extends State<AnimatedTextKit>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late AnimatedText _currentAnimatedText;

  int _currentRepeatCount = 0;

  int _index = 0;

  bool _isCurrentlyPausing = false;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final completeText = _currentAnimatedText.completeText(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: _isCurrentlyPausing || !_controller.isAnimating
          ? completeText
          : AnimatedBuilder(
              animation: _controller,
              builder: _currentAnimatedText.animatedBuilder,
              child: completeText,
            ),
    );
  }

  bool get _isLast => _index == widget.animatedTexts.length - 1;

  void _nextAnimation() {
    final isLast = _isLast;

    _isCurrentlyPausing = false;

    widget.onNext?.call(_index, isLast);

    if (isLast) {
      if (widget.isRepeatingAnimation &&
          (widget.repeatForever ||
              _currentRepeatCount != (widget.totalRepeatCount - 1))) {
        _index = 0;
        if (!widget.repeatForever) {
          _currentRepeatCount++;
        }
      } else {
        widget.onFinished?.call();
        return;
      }
    } else {
      _index++;
    }

    if (mounted) setState(() {});

    _controller.dispose();

    _initAnimation();
  }

  void _initAnimation() {
    _currentAnimatedText = widget.animatedTexts[_index];

    _controller = AnimationController(
      duration: _currentAnimatedText.duration,
      vsync: this,
    );

    _currentAnimatedText.initAnimation(_controller);

    _controller
      ..addStatusListener(_animationEndCallback)
      ..forward();
  }

  void _setPause() {
    final isLast = _isLast;

    _isCurrentlyPausing = true;
    if (mounted) setState(() {});

    widget.onNextBeforePause?.call(_index, isLast);
  }

  void _animationEndCallback(AnimationStatus state) {
    if (state == AnimationStatus.completed) {
      _setPause();
      assert(null == _timer || !_timer!.isActive);
      _timer = Timer(widget.pause, _nextAnimation);
    }
  }

  void _onTap() {
    if (widget.displayFullTextOnTap) {
      if (_isCurrentlyPausing) {
        if (widget.stopPauseOnTap) {
          _timer?.cancel();
          _nextAnimation();
        }
      } else {
        final left =
            (_currentAnimatedText.remaining ?? _currentAnimatedText.duration)
                .inMilliseconds;

        _controller.stop();

        _setPause();

        assert(null == _timer || !_timer!.isActive);
        _timer = Timer(
          Duration(
            milliseconds: max(
              widget.pause.inMilliseconds,
              left,
            ),
          ),
          _nextAnimation,
        );
      }
    }

    widget.onTap?.call();
  }
}
