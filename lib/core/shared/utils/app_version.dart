// Removed dart:io import for web compatibility
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wave_drive/core/shared/utils/platform_utils.dart';

Future<String> getAppVersion() async {
  final platform = await PackageInfo.fromPlatform();
  return platform.version;
}

const _playMarketUrl = 'https://play.google.com/store/apps/details?id=';
const _appStoreUrlIOS = 'https://apps.apple.com/app/id';

Future<void> launchStore() async {
  if (PlatformUtils.isWeb) {
    throw Exception('Platform not supported');
  }
  final platform = await PackageInfo.fromPlatform();

  if (PlatformUtils.isIOS) {
    await _openIOS("6474921968");
    return;
  }

  if (PlatformUtils.isAndroid) {
    await _openAndroid(platform.packageName);
    return;
  }

  throw Exception('Platform not supported');
}

Future _openAndroid(String? androidAppBundleId) async {
  if (androidAppBundleId != null) {
    await _openUrl('$_playMarketUrl$androidAppBundleId');
    return;
  }
  throw Exception("androidAppBundleId is not passed");
}

Future _openIOS(String? appStoreId) async {
  if (appStoreId != null) {
    await _openUrl('$_appStoreUrlIOS$appStoreId');
    return;
  }
  throw Exception("appStoreId is not passed");
}

Future<void> _openUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
    return;
  }
  throw Exception('Could not launch $url');
}
