import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {




  Stream<Position> getLocationStream() {
    const settings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 1, 
    );

    return Geolocator.getPositionStream(locationSettings: settings);
  }


  /// 📍 Convert latitude & longitude to human-readable address
/// Convert Position to Placemark
/// 📍 Convert latitude & longitude to human-readable address
  Future<String> convertPositionToAddress(Position position) async {
    try {
      final List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isEmpty) return "Unknown Location";

      final place = placemarks.first;

      return "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
    } catch (e) {
      return "Address unavailable";
    }
  }



}