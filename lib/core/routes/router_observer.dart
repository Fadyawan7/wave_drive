import 'package:auto_route/auto_route.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:flutter/material.dart';

class RouterObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    if (route.settings.name == null) return;

    AppLogger.d(
      '[ROUTER] - pushed: ${previousRoute?.settings.name ?? "Initial"} -> ${route.settings.name} ${route.settings.arguments ?? ""}',
    );
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    AppLogger.d('[ROUTER] - Tab: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    AppLogger.d('[ROUTER] - Tab re-visited: ${route.name}');
  }
}
