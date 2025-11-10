// Removed dart:io import for web compatibility
import 'package:wave_drive/core/configs/app_config.dart';
import 'package:wave_drive/core/shared/utils/platform_utils.dart';

Map<String, String> imageHeader() {
  return PlatformUtils.isIOS
      ? {"Referer": AppConfig.imageHeaderIOS}
      : {"Referer": AppConfig.imageHeaderAndroid};
}
