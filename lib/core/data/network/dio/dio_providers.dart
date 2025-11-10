// Removed dart:io import for web compatibility
import 'package:wave_drive/core/configs/app_config.dart';
import 'package:wave_drive/core/data/network/dio/interceptors/auth_interceptors.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/core/shared/utils/platform_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class DioProvider {
  Dio? dio;

  void setHeaderToken(String token) {
    dio!.options.headers['Authorization'] = 'Bearer $token';
  }

  void setHeaderVersion(String version) {
    dio!.options.headers['app-version'] = version;
  }

  void removeHeaderToken() {
    dio!.options.headers['Authorization'] = '';
  }

  void setDeviceIpHeader(String wifiIP) {
    dio!.options.headers['ip'] = wifiIP;
  }

  void setDeviceId(String deviceId) {
    dio!.options.headers['deviceId'] = deviceId;
  }

  void setLatLngHeaders(double latitude, double longitude) {
    dio!.options.headers['latitude'] = latitude.toString();
    dio!.options.headers['longitude'] = longitude.toString();
  }

  Dio getInstance() {
    if (dio == null) {
      dio = Dio();
      dio!.options.baseUrl = PlatformUtils.isIOS
          ? AppConfig.baseUrlIOS
          : AppConfig.baseUrl;
      dio!.options.connectTimeout = const Duration(seconds: 60);
      dio!.options.contentType = 'application/json';
      dio!.options.headers['Referer'] = PlatformUtils.isIOS
          ? AppConfig.imageHeaderIOS
          : AppConfig.imageHeaderAndroid;
      dio!.options.headers['app-platform'] = PlatformUtils.platformName;

      if (kDebugMode) {
        dio!.interceptors.add(
          TalkerDioLogger(
            talker: AppLogger.talker,
            settings: AppLogger.dioSetting,
          ),
        );
      }

      dio!.interceptors.add(AuthInterceptor());
    }

    return dio!;
  }
}
