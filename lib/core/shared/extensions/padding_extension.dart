import 'package:flutter/widgets.dart';

/// Adds padding and margin extensions on any Widget
extension WidgetSpacingExtension on Widget {
  // ===== PADDING EXTENSIONS =====

  Widget paddingAll(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  Widget paddingHorizontal(double value) => Padding(
        padding: EdgeInsets.symmetric(horizontal: value),
        child: this,
      );

  Widget paddingVertical(double value) => Padding(
        padding: EdgeInsets.symmetric(vertical: value),
        child: this,
      );

  Widget paddingLeft(double value) => Padding(
        padding: EdgeInsets.only(left: value),
        child: this,
      );

  Widget paddingRight(double value) => Padding(
        padding: EdgeInsets.only(right: value),
        child: this,
      );

  Widget paddingTop(double value) => Padding(
        padding: EdgeInsets.only(top: value),
        child: this,
      );

  Widget paddingBottom(double value) => Padding(
        padding: EdgeInsets.only(bottom: value),
        child: this,
      );

}