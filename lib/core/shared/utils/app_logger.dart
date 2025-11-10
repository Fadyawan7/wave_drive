import 'package:wave_drive/core/configs/app_config.dart';
import 'package:flutter/foundation.dart';

import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AppLogger {
  static final talker = TalkerFlutter.init(
    settings: TalkerSettings(maxHistoryItems: 500, enabled: kDebugMode),
    observer: CrashlyticsTalkerObserver(),
  );

  static const dioSetting = TalkerDioLoggerSettings(
    printResponseData: true,
    printResponseHeaders: false,
    printResponseMessage: false,
    printRequestData: true,
    printRequestHeaders: false,
  );

  static void d(dynamic message, {StackTrace? stackTrace}) {
    if (kDebugMode || AppConfig.flavor != Environment.production) {
      // talker.good('[D] $message', null, stackTrace);
      talker.debug('[D] $message', null, stackTrace);
    }
  }

  static void i(dynamic message, {StackTrace? stackTrace}) {
    if (kDebugMode || AppConfig.flavor != Environment.production) {
      talker.info('[D] $message', null, stackTrace);
    }
  }

  static void w(dynamic message, {StackTrace? stackTrace}) {
    if (kDebugMode || AppConfig.flavor != Environment.production) {
      talker.warning('[D] $message', null, stackTrace);
    }
  }

  static void c(dynamic message, {StackTrace? stackTrace}) {
    if (kDebugMode || AppConfig.flavor != Environment.production) {
      talker.info('[D] $message', null, stackTrace);
    }
  }

  static void e(dynamic message, {Object? error, StackTrace? stackTrace}) {
    if (kDebugMode || AppConfig.flavor != Environment.production) {
      //  Sentry.captureException(message, stackTrace: stackTrace);
      talker.critical(message, error, stackTrace);
    }
  }
}

class CrashlyticsTalkerObserver extends TalkerObserver {
  CrashlyticsTalkerObserver();

  @override
  void onError(TalkerError err) {}

  @override
  void onException(TalkerException err) {}
}

class Benchmark {
  static final Map<String, int> _starts = <String, int>{};

  static void start(String id) {
    if (AppConfig.flavor != Environment.development) return;
    final String benchId = id;
    _starts[benchId] = DateTime.now().microsecondsSinceEpoch;
  }

  static void end(String id) {
    if (AppConfig.flavor != Environment.development) return;
    final String benchId = id;
    if (!_starts.containsKey(benchId)) {
      throw Exception('In Benchmark not placed comparing with id=$benchId');
    }
    final double diff =
        (DateTime.now().microsecondsSinceEpoch - _starts[benchId]!) / 1000;
    final String info = '$benchId need ${diff}ms';
    AppLogger.c('[Benchmark] $info');
    _starts.remove(benchId);
  }
}
