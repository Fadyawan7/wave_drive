import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

enum TrimType { lines, characters }

class ExpandableText extends StatefulWidget {
  /// Text to show
  final String text;

  /// Clickable text to display that expands text
  final String readMoreText;

  /// Clickable text to display that collapses text
  final String readLessText;

  /// [TextStyle] for both [readMoreText] and [readLessText]
  final TextStyle? linkTextStyle;

  /// [TextStyle] for [text]
  final TextStyle? style;

  final double? textScaleFactor;

  /// For [TrimType.lines] this represents the maximum amount of lines allowable
  /// before the text is collapsed
  ///
  /// For [TrimType.characters] this represents the number of characters
  /// allowable before the text is collapsed
  final int trim;

  /// Whether to trim [text] by lines or characters in [text]
  final TrimType trimType;

  final TextAlign textAlign;

  final TextDirection textDirection;

  /// Callback function when a link is pressed
  ///
  /// Returns a boolean [true] is expanded and [false] is collapsed
  final void Function(bool expanded)? onLinkPressed;

  const ExpandableText(
    this.text, {
    super.key,
    this.readLessText = 'Hide',
    this.readMoreText = 'more',
    this.linkTextStyle,
    this.textScaleFactor,
    this.style,
    this.trim = 2,
    this.trimType = TrimType.lines,
    this.textAlign = TextAlign.left,
    this.textDirection = TextDirection.ltr,
    this.onLinkPressed,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late TextSpan _text;
  late TextSpan _linkText;
  late TextSpan _ellipsisText;
  late TextPainter _textPainter;
  bool _isExpanded = false;

  @override
  void initState() {
    _textPainter = TextPainter(
      textDirection: widget.textDirection,
      textAlign: widget.textAlign,
      maxLines: widget.trim,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _linkText = TextSpan(
      text: _isExpanded ? widget.readLessText : widget.readMoreText,
      style:
          widget.linkTextStyle ??
          AppTextStyles.textBold14.copyWith(color: AppColors.white),
      recognizer: TapGestureRecognizer()..onTap = _onLinkTextPressed,
    );
    _text = TextSpan(
      text: widget.text,
      style:
          widget.style ??
          AppTextStyles.textMed12.copyWith(color: AppColors.white),
    );
    _ellipsisText = TextSpan(
      text: _isExpanded ? '  ' : '... ',
      style: _text.style,
    );

    final textScaleFactor =
        widget.textScaleFactor ?? MediaQuery.textScaleFactorOf(context);

    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 150),
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  assert(
                    constraints.hasBoundedWidth,
                    'Parent width unbounded. A bounded width is required. Try wrapping '
                    'this widget with a Flexible or Expanded or use a Container with '
                    'a defined width.',
                  );
                  _textPainter.maxLines = widget.trim;

                  // layout and get size for link text
                  _textPainter.text = _linkText;
                  _textPainter.layout(
                    minWidth: constraints.minWidth,
                    maxWidth: constraints.maxWidth,
                  );
                  final linkSize = _textPainter.size;

                  // layout and get size for ellipsis text
                  _textPainter.text = _ellipsisText;
                  _textPainter.layout(
                    minWidth: constraints.minWidth,
                    maxWidth: constraints.maxWidth,
                  );
                  final ellipsisSize = _textPainter.size;

                  // layout and get size for text data
                  _textPainter.text = _text;
                  _textPainter.layout(
                    minWidth: constraints.minWidth,
                    maxWidth: constraints.maxWidth,
                  );
                  final textSize = _textPainter.size;

                  late final TextSpan textSpan;
                  bool hasOverflow = false;
                  int endIndex = 0;

                  switch (widget.trimType) {
                    case TrimType.lines:
                      // get the position of the data text minus the size of the link text
                      // minus ellipsis text size
                      final pos = _textPainter.getPositionForOffset(
                        Offset(
                          textSize.width - linkSize.width - ellipsisSize.width,
                          textSize.height,
                        ),
                      );
                      if (_textPainter.didExceedMaxLines) {
                        // get the index of the last 'seeable' character of the data text
                        endIndex =
                            _textPainter.getOffsetBefore(pos.offset) ?? 0;
                        hasOverflow = true;
                      }
                    case TrimType.characters:
                      if (widget.text.length >= widget.trim.abs()) {
                        endIndex = widget.trim;
                        hasOverflow = true;
                      }
                  }

                  if (hasOverflow) {
                    textSpan = TextSpan(
                      children: [
                        TextSpan(
                          text: _isExpanded
                              ? widget.text
                              : widget.text.substring(0, endIndex),
                          style: _text.style,
                        ),
                        _ellipsisText,
                        if (!_isExpanded) _linkText,
                      ],
                    );
                  } else {
                    textSpan = _text;
                  }

                  return RichText(
                    text: textSpan,
                    textScaleFactor: textScaleFactor,
                  );
                },
              ),
            ),
          ),
          if (_isExpanded) ...[
            const Gap(8),
            Align(
              alignment: Alignment.bottomRight,
              child: RichText(
                text: _linkText,
                textScaleFactor: textScaleFactor,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _onLinkTextPressed() async {
    setState(() => _isExpanded = !_isExpanded);
    if (widget.onLinkPressed != null) {
      widget.onLinkPressed?.call(_isExpanded);
    }
  }
}
