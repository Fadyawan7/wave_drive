import 'package:wave_drive/core/shared/extensions/extensions.dart';

String truncateUserName(String? name) {
  return name.isNullOrEmpty
      ? ''
      : name!.length > 35
      ? '${name.substring(0, 34)}...'
      : name;
}

String truncateUserNameLiveHeader(String? name) {
  return name.isNullOrEmpty
      ? ''
      : name!.length > 12
      ? '${name.substring(0, 11)}...'
      : name;
}

String truncateUserName15(String? name) {
  return name.isNullOrEmpty
      ? ''
      : name!.length > 15
      ? '${name.substring(0, 14)}...'
      : name;
}

String truncateUserName8(String? name) {
  return name.isNullOrEmpty
      ? ''
      : name!.length > 9
      ? '${name.substring(0, 9)}...'
      : name;
}

String truncateFamilyName(String? name) {
  return name.isNullOrEmpty
      ? ''
      : name!.length > 11
      ? '${name.substring(0, 11)}.'
      : name;
}

String truncateRoomTitle(String? name) {
  return name.isNullOrEmpty
      ? ''
      : name!.length > 20
      ? '${name.substring(0, 19)}...'
      : name;
}
