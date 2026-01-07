import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wave_drive/core/cubits/auth/auth_cubit.dart';
import 'package:wave_drive/core/data/network/dio/dio_providers.dart';
import 'package:wave_drive/core/services/firebase/firebase_notification/firebase_notification_service.dart';
import 'package:wave_drive/core/services/location_service.dart';
import 'package:wave_drive/core/services/socketIo/socket_service.dart';
import 'package:wave_drive/core/shared/constants/enums.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/core/shared/utils/app_version.dart';
import 'package:wave_drive/injector_setup.dart';
import 'package:wave_drive/modules/main_wrapper.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {


  AppCubit() : super(const AppState(locationState: LocationState()));
  final _locationService = injector<LocationService>();

  StreamSubscription<Position>? _stream;

  final _authCubit = injector<AuthCubit>();
  final _dioProvider = injector<DioProvider>();
  final _socketService = injector<SocketService>();

  /// This function will call when entering the splash screen
  Future<void> initializeApp() async {
    try {
      await Future.wait([
        //  _requestAndLoadPermission(),
         _authCubit.checkAuthenticate(),

        /// PUSH NOTIFICATION
        injector<FirebaseNotificationService>().init()
      ]);
    } catch (error) {
      AppLogger.e('initializeApp error: $error');
      return;
    }
  }

  Future<void> initDioProvider() async {
    final version = await getAppVersion();

    AppLogger.d("Current app version: $version");
    _dioProvider.setHeaderVersion(version);
  }

  Future<void> startTracking() async {
    _stream = _locationService.getLocationStream().listen((position) async {
      
      _dioProvider.setLatLngHeaders(position.latitude, position.longitude);

      _socketService.emitEvent("location:update", {
        "lat":position.latitude,
        "lng":position.longitude
      });

      AppLogger.d(
        "user location is ${position.latitude} ${position.longitude}",
      );
      final address = await _locationService.convertPositionToAddress(position);

      emit(state.copyWith.locationState(position: position, address: address));
    });
  }


  

  @override
  Future<void> close() {
    _stream?.cancel();
    return super.close();
  }
}
