import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/core/shared/utils/app_version.dart';


part 'app_state.dart';
part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  // final _authCubit = injector<AuthCubit>();
  // final _dioProvider = injector<DioProvider>();


  /// This function will call when entering the splash screen
  Future<void> initializeApp() async {
    try {
      await Future.wait([
        //  _requestAndLoadPermission(),
        // _authCubit.checkAuthenticate(),

        /// PUSH NOTIFICATION
        //  injector<FirebaseNotificationService>().init()
      ]);
    } catch (error) {
      AppLogger.e('initializeApp error: $error');
      return;
    }
  }

  Future<void> initDioProvider() async {
    final version = await getAppVersion();
    //final wifiip = await getWifiIP();
    // final position = await getCurrentLocation();
    // final deviceId = await SecureStorageHelper.getUniqueId();

    AppLogger.d("Current app version: $version");
    //  AppLogger.d("Current ip: $wifiip");
    // AppLogger.d("Current latlng: ${position.latitude} ${position.longitude}");
    // AppLogger.d("Device id: $deviceId");
    // _dioProvider.setHeaderVersion(version);
    //_dioProvider.setDeviceIpHeader(wifiip);
    // _dioProvider.setLatLngHeaders(position.latitude, position.longitude);
    // _dioProvider.setDeviceId(deviceId);
  }
}
