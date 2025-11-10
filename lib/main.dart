import 'package:wave_drive/bootstrap.dart';
import 'package:wave_drive/core/configs/app_config.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';

void main() {
  AppLogger.d('[ENV VARIABLES]\n ${AppConfig()}');
  bootstrap();
}
