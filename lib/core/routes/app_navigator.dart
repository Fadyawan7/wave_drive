import 'package:auto_route/auto_route.dart';
import 'package:wave_drive/core/routes/app_router.dart';
import 'package:wave_drive/injector_setup.dart';

import 'package:flutter/material.dart';

class AppNavigator {
  static final router = injector<AppRouter>();

  static Future<T?> push<T extends Object?>(
    BuildContext context,
    PageRouteInfo screen,
  ) async {
    return AutoRouter.of(context).push<T>(screen);
  }

  static Future<T?> popAndPush<T extends Object?>(
    BuildContext context,
    PageRouteInfo screen,
  ) async {
    return AutoRouter.of(context).popAndPush(screen);
  }

  static Future<T?> replace<T extends Object?>(
    BuildContext context,
    PageRouteInfo screen,
  ) async {
    return AutoRouter.of(context).replace<T>(screen);
  }

  static Future<void> replaceAll<T extends Object?>(
    BuildContext context,
    PageRouteInfo screen,
  ) async {
    return AutoRouter.of(context).replaceAll([screen]);
  }

  static Future<void> replaceAllAndPush<T extends Object?>(
    BuildContext context,
    List<PageRouteInfo> screens,
  ) async {
    return AutoRouter.of(context).replaceAll(screens);
  }

  static Future<void> pop<T extends Object?>(
    BuildContext context, {
    T? result,
  }) async {
    AutoRouter.of(context).pop<T>(result);
  }

  static void popUntilMain(BuildContext context) {
    AutoRouter.of(context).popUntil((route) => route.isFirst);
  }

  static bool canPop(BuildContext context) {
    return AutoRouter.of(context).canPop();
  }

  static Future<void> navigate<T extends Object?>(
    BuildContext context,
    PageRouteInfo screen,
  ) async {
    await AutoRouter.of(context).navigate(screen);
  }
}
