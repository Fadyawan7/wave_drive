import 'dart:math';
import 'dart:ui';

int randomBetween(int min, int max) => min + Random().nextInt((max + 1) - min);

Color parseHexColor(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  return Color(int.parse(hexColor, radix: 16));
}
