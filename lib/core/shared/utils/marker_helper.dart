import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerHelper {
  /// Generates a BitmapDescriptor from an asset image
  static Future<BitmapDescriptor> fromAsset(
      String assetPath, {
        Size size = const Size(48, 48),
      }) async {
    return await BitmapDescriptor.asset(
      ImageConfiguration(size: size),
      assetPath,
    );
  }

  /// Generates a default colored marker
  static BitmapDescriptor defaultMarker({double hue = BitmapDescriptor.hueRed}) {
    return BitmapDescriptor.defaultMarkerWithHue(hue);
  }
}
