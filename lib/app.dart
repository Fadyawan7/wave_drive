import 'package:bot_toast/bot_toast.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:wave_drive/module/splash_screen/splash_screen.dart';

final botToastBuilder = BotToastInit();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Apply status bar style after the first frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light, // Android (white icons)
          statusBarBrightness: Brightness.dark, // iOS (white icons)
        ),
      );
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wave Drive',
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
