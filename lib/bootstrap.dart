import 'dart:async';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:wave_drive/app.dart';
import 'package:wave_drive/core/data/local/hive_storage.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/injector_setup.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  FlutterError.onError = (details) {
    AppLogger.e(
      details.exceptionAsString(),
      error: details.exception,
      stackTrace: details.stack,
    );
  };

  // database = await LocalDatabase.create();

  // Init firebase
 //await Firebase.initializeApp();

  // Init localization
  // EasyLocalization.logger.enableBuildModes = [];

  // await EasyLocalization.ensureInitialized();

  // Init dependencies
 // await initializeDependencies();

  // Local storage
 // await HiveStorage.init();

  // runApp(
  //   EasyLocalization(
  //     supportedLocales: const [Locale('en')],
  //     path: 'assets/translations',
  //     child: const App(),
  //   ),
  // );

  runApp(App());
}
