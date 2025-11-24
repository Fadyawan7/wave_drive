import 'package:flutter/widgets.dart';

/// Adds padding and margin extensions on any Widget
extension WidgetSpacingExtension on Widget {
  // ===== PADDING EXTENSIONS =====

  // ===== MARGIN EXTENSIONS =====
  // Use a Container to apply margin around a widget

  Widget marginAll(double value) => Container(
        margin: EdgeInsets.all(value),
        child: this,
      );

  Widget marginHorizontal(double value) => Container(
        margin: EdgeInsets.symmetric(horizontal: value),
        child: this,
      );

  Widget marginVertical(double value) => Container(
        margin: EdgeInsets.symmetric(vertical: value),
        child: this,
      );

  Widget marginLeft(double value) => Container(
        margin: EdgeInsets.only(left: value),
        child: this,
      );

  Widget marginRight(double value) => Container(
        margin: EdgeInsets.only(right: value),
        child: this,
      );

  Widget marginTop(double value) => Container(
        margin: EdgeInsets.only(top: value),
        child: this,
      );

  Widget marginBottom(double value) => Container(
        margin: EdgeInsets.only(bottom: value),
        child: this,
      );
}
