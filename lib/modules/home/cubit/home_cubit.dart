import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wave_drive/core/cubits/app_cubit.dart';
import 'package:wave_drive/core/services/socketIo/socket_service.dart';
import 'package:wave_drive/core/shared/constants/enums.dart';
import 'package:wave_drive/core/shared/utils/map_utils.dart';
import 'package:wave_drive/injector_setup.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final appCubit = injector<AppCubit>();
  final socketService = injector<SocketService>();
  late BitmapDescriptor driverIcon;
  // late BitmapDescriptor userIcon;
  // late BitmapDescriptor destinationIcon;

  final Completer<GoogleMapController> mapController = Completer();

  HomeCubit() : super(const HomeState(locationState: LocationState())) {
    _init();
  }

  Future<void> _init() async {
    await loadCustomMarkers();
    //  _addCurrentLocationMarker();
  }

  Future<void> loadCustomMarkers() async {
    driverIcon = await bitmapFromAsset('assets/images/car.png', width: 20);
    // userIcon = await bitmapFromAsset('assets/images/user.png');
    // destinationIcon =
    //     await bitmapFromAsset('assets/images/destination.png');
  }

  Future<void> updateMap() async {
    final controller = await mapController.future;
    final LatLng pos = LatLng(
      appCubit.state.locationState.position!.latitude,
      appCubit.state.locationState.position!.longitude,
    );

    controller.animateCamera(CameraUpdate.newLatLng(pos));
  }

  Future<void> onMapCreated(GoogleMapController controller) async {
    if (!mapController.isCompleted) {
      mapController.complete(controller);
    }

    _addCurrentLocationMarkerAndMoveCamera();
  }

  Future<void> _addCurrentLocationMarkerAndMoveCamera() async {
    if (appCubit.state.locationState.position == null) return;

    final controller = await mapController.future;
    final LatLng pos = LatLng(
      appCubit.state.locationState.position!.latitude,
      appCubit.state.locationState.position!.longitude,
    );

    _addCurrentLocationMarker();

    await controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: pos, zoom: 12)));
  }

  void _addCurrentLocationMarker() {
    final position = appCubit.state.locationState.position;
    if (position == null) return;

    final marker = Marker(
      markerId: const MarkerId('current_location'),
      position: LatLng(position.latitude, position.longitude),
      infoWindow: const InfoWindow(title: 'You are here'),
      icon: driverIcon,
    );

    emit(state.copyWith(markers: {marker}));
  }

  void onStatusChange(){
    socketService.emitEvent("status", {});

  }
}
