import 'dart:async';
import 'dart:convert';

import 'package:extended_image/extended_image.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wave_drive/core/cubits/app_cubit.dart';
import 'package:wave_drive/core/data/models/ride_request/ride_request_model.dart';
import 'package:wave_drive/core/shared/extensions/media_query_extension.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_icons.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';
import 'package:wave_drive/injector_setup.dart';
import 'package:wave_drive/modules/home/widgets/bottom_trevel_details_sheet.dart';
import 'package:wave_drive/modules/home/widgets/user_request_bottom_sheet.dart';
import 'package:wave_drive/modules/ride/cubit/ride_cubit.dart';

class RideRequestScreen extends StatefulWidget {
  final RideRequestModel ride;
  const RideRequestScreen({super.key, required this.ride});

  @override
  State<RideRequestScreen> createState() => _RideRequestScreenState();
}

class _RideRequestScreenState extends State<RideRequestScreen> {
  @override
  void initState() {
   // context.read<RideCubit>().clearRide();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          bottom: context.height * .40,
          child: RideMapWidget(ride: widget.ride),
        ),

        UserRequestBottomsheet(ride: widget.ride),

        Positioned(
          right: 20,
          top: context.height * .06,
          child: GestureDetector(
            onTap: () {
              TravelDetailsBottonSheet.show(
                context,
                pickAddress: widget.ride.pickLocation.address ?? "",
                dropAddress: widget.ride.dropLocation.address ?? "",
              );
            },
            child: const _BuildDeclineRideBtn(),
          ),
        ),
      ],
    );
  }
}

class _BuildDeclineRideBtn extends StatelessWidget {
  const _BuildDeclineRideBtn();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: AppColors.blueFF.withValues(alpha: .5), borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppImage(size: 12, path: AppIcons.cross, color: AppColors.primary),

          const Gap(5),

          Text(
            "Decline",
            style: AppTextStyles.text14.copyWith(color: AppColors.primary, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}

class RideMapWidget extends StatefulWidget {
  final RideRequestModel ride;

  const RideMapWidget({super.key, required this.ride});

  @override
  State<RideMapWidget> createState() => _RideMapWidgetState();
}

class _RideMapWidgetState extends State<RideMapWidget> {
  final Completer<GoogleMapController> _controller = Completer();

  late CameraPosition _initialCamera;

  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  final appCubit = injector<AppCubit>();

  @override
  void initState() {
    super.initState();

    _initialCamera = CameraPosition(
      target: LatLng(
        appCubit.state.locationState.position?.latitude ?? 0,
        appCubit.state.locationState.position?.longitude ?? 0,
      ),
      zoom: 14,
    );

    _setupMarkers();
    _setupPolyline(); // call after first frame
  }

  void _setupMarkers() {
    _markers.clear();
    _markers.add(
      Marker(
        markerId: const MarkerId('pickup'),
        position: LatLng(widget.ride.pickLocation.latitude, widget.ride.pickLocation.longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: const InfoWindow(title: 'Pickup'),
      ),
    );
    _markers.add(
      Marker(
        markerId: const MarkerId('drop'),
        position: LatLng(widget.ride.dropLocation.latitude, widget.ride.dropLocation.longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(title: '${widget.ride.distance} km ${widget.ride.distance} Min'),
      ),
    );
    _markers.add(
      Marker(
        markerId: const MarkerId('driver'),
        position: LatLng(
          appCubit.state.locationState.position?.latitude ?? 0,
          appCubit.state.locationState.position?.longitude ?? 0,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: const InfoWindow(title: 'Driver'),
      ),
    );
  }

  void _setupPolyline() {
    _polylines.clear();
    _getDirections();
  }

  Future<void> _getDirections() async {
    try {
      final url =
          'https://maps.googleapis.com/maps/api/directions/json?'
          'origin=${appCubit.state.locationState.position?.latitude ?? 0},${appCubit.state.locationState.position?.longitude ?? 0}'
          '&destination=${widget.ride.dropLocation.latitude},${widget.ride.dropLocation.longitude}'
          '&waypoints=${widget.ride.pickLocation.latitude},${widget.ride.pickLocation.longitude}'
          '&key=AIzaSyAn4sls-gcVlFtzx0V1BXJ9eyAATIJFz74';

      final response = await http.get(Uri.parse(url));
      final values = jsonDecode(response.body);

      if (values['status'] == 'OK') {
        List<LatLng> points = _decodePolyline(values['routes'][0]['overview_polyline']['points'] as String);

        final List<LatLng> latLngList = points.map((p) => LatLng(p.latitude, p.longitude)).toList();

        _polylines.add(
          Polyline(polylineId: const PolylineId('route'), points: latLngList, color: AppColors.primarycolor, width: 5),
        );

        setState(() {});

        _adjustCameraToFitPoints();
      }
    } catch (e) {
      AppLogger.d("Error getting directions: $e");
    } finally {
      AppLogger.d("polyline are ${_polylines.length}");
    }
  }

  Future<void> _adjustCameraToFitPoints() async {
    if (!_controller.isCompleted) return;

    try {
      final GoogleMapController controller = await _controller.future;

      // Collect all points to include in bounds
      final List<LatLng> allPoints = [
        LatLng(widget.ride.pickLocation.latitude, widget.ride.pickLocation.longitude),
        LatLng(widget.ride.dropLocation.latitude, widget.ride.dropLocation.longitude),
        LatLng(
          appCubit.state.locationState.position?.latitude ?? 0,
          appCubit.state.locationState.position?.longitude ?? 0,
        ),
      ];

      // Calculate southwest and northeast bounds
      double south = allPoints.map((p) => p.latitude).reduce((a, b) => a < b ? a : b);
      double north = allPoints.map((p) => p.latitude).reduce((a, b) => a > b ? a : b);
      double west = allPoints.map((p) => p.longitude).reduce((a, b) => a < b ? a : b);
      double east = allPoints.map((p) => p.longitude).reduce((a, b) => a > b ? a : b);

      LatLngBounds bounds = LatLngBounds(southwest: LatLng(south, west), northeast: LatLng(north, east));

      // Animate camera with padding
      await controller.animateCamera(
        duration: const Duration(seconds: 2),
        CameraUpdate.newLatLngBounds(bounds, 70), // 70 is padding
      );
    } catch (e) {
      AppLogger.d("Error adjusting camera: $e");
    }
  }

  // Decode polyline points
  List<LatLng> _decodePolyline(String encoded) {
    final List<LatLng> points = [];
    int index = 0;
    final int len = encoded.length;
    int lat = 0;
    int lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return points;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _initialCamera,
      markers: _markers,
      polylines: _polylines,
      onMapCreated: (controller) {
        _controller.complete(controller);
        controller.showMarkerInfoWindow(const MarkerId("drop"));
      },
    );
  }
}
