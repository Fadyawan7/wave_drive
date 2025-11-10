import 'package:bot_toast/bot_toast.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:flutter/services.dart';
import 'package:wave_drive/core/routes/app_router.dart';
import 'package:wave_drive/core/routes/router_observer.dart';
import 'package:wave_drive/core/shared/themes/theme_data.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/injector_setup.dart';
import 'package:wave_drive/module/main_wrapper.dart';

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
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wave Drive'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Example action
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Welcome to Wave Drive!')),
            );
          },
          child: const Text('Get Started'),
        ),
      ),
    );


    // MultiBlocProvider(
    //   providers: [
        
    //  //   BlocProvider(create: (context) => injector<AuthCubit>()),
       

    //   ],
    //   child: ScreenUtilInit(
    //     designSize: const Size(393, 852),
    //     minTextAdapt: true,
    //     splitScreenMode: true,
    //     builder: (_, child) {
    //       return MaterialApp.router(
    //        debugShowCheckedModeBanner: false,
    //         theme: Themes.lightTheme,
    //         themeMode: ThemeMode.light,
    //         routerConfig: injector<AppRouter>().config(
    //           navigatorObservers: () => [RouterObserver()],
    //         ),
    //         // localizationsDelegates: context.localizationDelegates,
    //         // supportedLocales: context.supportedLocales,
    //         builder: FlutterSmartDialog.init(
    //           builder: (context, child) {
    //             final mediaQueryData = MediaQuery.of(context);
    //             final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.1);
    //             child = EasyLoading.init()(context, child);
    //             child = botToastBuilder(context, child);

    //             return TalkerWrapper(
    //               talker: AppLogger.talker,
    //               options: const TalkerWrapperOptions(
    //                 enableErrorAlerts: false,
    //                 enableExceptionAlerts: false,
    //               ),
    //               child: Portal(
    //                 child: MediaQuery(
    //                   data: MediaQuery.of(
    //                     context,
    //                   ).copyWith(textScaler: TextScaler.linear(scale)),
    //                   child: MainWrapper(child: child),
    //                 ),
    //               ),
    //             );
    //           },
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
