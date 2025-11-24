import 'package:flutter/widgets.dart';

extension AlignmentExtension on Widget {
  /// Center align the widget
  Widget get center => Align(alignment: Alignment.center, child: this);

  /// Top center
  Widget get topCenter => Align(alignment: Alignment.topCenter, child: this);

  /// Bottom center
  Widget get bottomCenter =>
      Align(alignment: Alignment.bottomCenter, child: this);

  /// Top left
  Widget get topLeft => Align(alignment: Alignment.topLeft, child: this);

  /// Top right
  Widget get topRight => Align(alignment: Alignment.topRight, child: this);

  /// Bottom left
  Widget get bottomLeft => Align(alignment: Alignment.bottomLeft, child: this);

  /// Bottom right
  Widget get bottomRight =>
      Align(alignment: Alignment.bottomRight, child: this);

  Widget get centerLeft => Align(alignment: Alignment.centerLeft, child: this);
  Widget get centerRight =>
      Align(alignment: Alignment.centerRight, child: this);
}
