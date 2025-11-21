import 'dart:async';


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:wave_drive/app.dart';
import 'package:wave_drive/core/configs/app_config.dart';
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
   EasyLocalization.logger.enableBuildModes = [];

  await EasyLocalization.ensureInitialized();

  // Init dependencies
  await initializeDependencies();

  // Local storage
 // await HiveStorage.init();

 

   if (AppConfig.flavor == Environment.development) {
    runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en')],
        path: 'assets/translations',
        child: const App(),
      ),
    );
    return;
  }

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      child: const App(),
    ),
  );
}
