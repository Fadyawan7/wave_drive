import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:wave_drive/core/cubits/app_cubit.dart';
import 'package:wave_drive/core/routes/app_router.dart';
import 'package:wave_drive/core/routes/router_observer.dart';
import 'package:wave_drive/core/shared/themes/theme_data.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/injector_setup.dart';

final botToastBuilder = BotToastInit();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      );
    });


      return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => injector<AppCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 858),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp.router(
            theme: Themes.lightTheme,
            themeMode: ThemeMode.light,
            routerConfig: injector<AppRouter>().config(
              navigatorObservers: () => [
                RouterObserver(),
                BotToastNavigatorObserver(),
              ],
            ),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            builder: FlutterSmartDialog.init(
              builder: (context, child) {
                final mediaQueryData = MediaQuery.of(context);
                final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.1);
                child = EasyLoading.init()(context, child);
                child = botToastBuilder(context, child);

                return TalkerWrapper(
                  talker: AppLogger.talker,
                  options: const TalkerWrapperOptions(
                    enableErrorAlerts: false,
                    enableExceptionAlerts: false,
                  ),
                  child: MediaQuery(
                    data: MediaQuery.of(
                      context,
                    ).copyWith(textScaler: TextScaler.linear(scale)),
                    child: child,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  
  

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Wave Drive',
    //   supportedLocales: const [Locale('en', '')],
    //   theme:

    //   Themes.lightTheme,
      
      
    //   home: const SplashScreen(),
    // );
  }
}
