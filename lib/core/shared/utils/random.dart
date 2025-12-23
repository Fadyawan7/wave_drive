import 'dart:math';

import 'package:flutter/services.dart';

int randomBetween(int min, int max) => min + Random().nextInt((max + 1) - min);

Color parseHexColor(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  return Color(int.parse(hexColor, radix: 16));
}
