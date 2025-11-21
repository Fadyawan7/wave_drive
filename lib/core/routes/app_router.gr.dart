// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/foundation.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:wave_drive/core/shared/widgets/webview/webview_screen.dart'
    as _i2;
import 'package:wave_drive/modules/splash_screen/splash_screen.dart' as _i1;
import 'package:webview_flutter/webview_flutter.dart' as _i6;

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i3.PageRouteInfo<void> {
  const SplashRoute({List<_i3.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i1.SplashScreen();
    },
  );
}

/// generated route for
/// [_i2.WebviewScreen]
class WebviewRoute extends _i3.PageRouteInfo<WebviewRouteArgs> {
  WebviewRoute({
    _i4.Key? key,
    String? appbarTitle,
    required String url,
    bool isWhiteAppbar = false,
    bool isInBottomSheet = false,
    _i5.Widget? leadingWhiteAppbar,
    dynamic Function(String, _i6.WebViewController)? onReceiveMessage,
    bool safeTopArea = false,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         WebviewRoute.name,
         args: WebviewRouteArgs(
           key: key,
           appbarTitle: appbarTitle,
           url: url,
           isWhiteAppbar: isWhiteAppbar,
           isInBottomSheet: isInBottomSheet,
           leadingWhiteAppbar: leadingWhiteAppbar,
           onReceiveMessage: onReceiveMessage,
           safeTopArea: safeTopArea,
         ),
         initialChildren: children,
       );

  static const String name = 'WebviewRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WebviewRouteArgs>();
      return _i2.WebviewScreen(
        key: args.key,
        appbarTitle: args.appbarTitle,
        url: args.url,
        isWhiteAppbar: args.isWhiteAppbar,
        isInBottomSheet: args.isInBottomSheet,
        leadingWhiteAppbar: args.leadingWhiteAppbar,
        onReceiveMessage: args.onReceiveMessage,
        safeTopArea: args.safeTopArea,
      );
    },
  );
}

class WebviewRouteArgs {
  const WebviewRouteArgs({
    this.key,
    this.appbarTitle,
    required this.url,
    this.isWhiteAppbar = false,
    this.isInBottomSheet = false,
    this.leadingWhiteAppbar,
    this.onReceiveMessage,
    this.safeTopArea = false,
  });

  final _i4.Key? key;

  final String? appbarTitle;

  final String url;

  final bool isWhiteAppbar;

  final bool isInBottomSheet;

  final _i5.Widget? leadingWhiteAppbar;

  final dynamic Function(String, _i6.WebViewController)? onReceiveMessage;

  final bool safeTopArea;

  @override
  String toString() {
    return 'WebviewRouteArgs{key: $key, appbarTitle: $appbarTitle, url: $url, isWhiteAppbar: $isWhiteAppbar, isInBottomSheet: $isInBottomSheet, leadingWhiteAppbar: $leadingWhiteAppbar, onReceiveMessage: $onReceiveMessage, safeTopArea: $safeTopArea}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WebviewRouteArgs) return false;
    return key == other.key &&
        appbarTitle == other.appbarTitle &&
        url == other.url &&
        isWhiteAppbar == other.isWhiteAppbar &&
        isInBottomSheet == other.isInBottomSheet &&
        leadingWhiteAppbar == other.leadingWhiteAppbar &&
        safeTopArea == other.safeTopArea;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      appbarTitle.hashCode ^
      url.hashCode ^
      isWhiteAppbar.hashCode ^
      isInBottomSheet.hashCode ^
      leadingWhiteAppbar.hashCode ^
      safeTopArea.hashCode;
}
