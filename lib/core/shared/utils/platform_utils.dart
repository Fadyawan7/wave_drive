import 'package:flutter/foundation.dart';

/// Platform detection utility that works on all platforms including web
class PlatformUtils {
  /// Returns true if running on web
  static bool get isWeb => kIsWeb;
  
  /// Returns true if running on mobile (Android or iOS)
  static bool get isMobile => !kIsWeb;
  
  /// Returns true if running on Android (only on mobile)
  static bool get isAndroid => !kIsWeb && defaultTargetPlatform == TargetPlatform.android;
  
  /// Returns true if running on iOS (only on mobile)
  static bool get isIOS => !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;
  
  /// Returns true if running on desktop (Windows, macOS, Linux)
  static bool get isDesktop => !kIsWeb && (
    defaultTargetPlatform == TargetPlatform.windows ||
    defaultTargetPlatform == TargetPlatform.macOS ||
    defaultTargetPlatform == TargetPlatform.linux
  );
  
  /// Get platform name as string
  static String get platformName {
    if (isWeb) return 'web';
    if (isAndroid) return 'android';
    if (isIOS) return 'ios';
    if (isDesktop) return 'desktop';
    return 'unknown';
  }
}
