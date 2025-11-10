// Removed dart:io import for web compatibility
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/core/shared/utils/uuid.dart';
import 'package:wave_drive/core/shared/utils/platform_utils.dart';
import 'package:client_information/client_information.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  static const storage = FlutterSecureStorage();
  static IOSOptions _getIOSOptions() => IOSOptions.defaultOptions;
  static AndroidOptions _getAndroidOptions() => AndroidOptions();

 /// Save the user's UID
  static Future<void> setUserUid({required String uid}) async {
    await setByKey(key: SecureStorageKey.userUid, value: uid);
    AppLogger.d("User UID saved: $uid");
  }

  /// Get the saved UID
  static Future<String?> getUserUid() async {
    final uid = await getByKey(key: SecureStorageKey.userUid);
    AppLogger.d("Retrieved User UID: $uid");
    return uid;
  }

  /// Delete the saved UID
  static Future<bool> deleteUserUid() async {
    final success = await deleteByKey(key: SecureStorageKey.userUid);
    if (success) AppLogger.d("User UID deleted");
    return success;
  }

  static Future<void> setByKey({
    required String key,
    required String value,
  }) async {
    try {
      await storage.write(
        key: key,
        value: value,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
    } catch (error) {
      AppLogger.w(error);
    }
  }

  //Read value
  static Future<String?> getByKey({required String key}) async {
    try {
      return await storage.read(
        key: key,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
    } catch (error) {
      AppLogger.e(error);

      return null;
    }
  }

  //Read all values
  static Future<Map<String, String>?> getAll({required String key}) async {
    try {
      return await storage.readAll(
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
    } catch (error) {
      AppLogger.e(error);

      return null;
    }
  }

  //Delete value
  static Future<bool> deleteByKey({required String key}) async {
    try {
      await storage.delete(
        key: key,
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
      return true;
    } catch (error) {
      return false;
    }
  }

  //Delete All value
  static Future<bool> deleteAll({required String key}) async {
    try {
      await storage.deleteAll(
        iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
      return true;
    } catch (error) {
      return false;
    }
  }

  static Future<String> getUniqueId() async {
    String? storedId = await getByKey(key: SecureStorageKey.uniqueId);
    if (storedId == null) {
      if (PlatformUtils.isIOS) {
        storedId = generateUniqueId();
      } else {
        final info = await ClientInformation.fetch();
        storedId = info.deviceId;
      }
      await setByKey(key: SecureStorageKey.uniqueId, value: storedId);
    }
    AppLogger.d("Unique ID $storedId");
    return storedId;
  }

  static Future<dynamic> setOAuthToken({required String accessToken}) async {
    return setByKey(key: SecureStorageKey.accessToken, value: accessToken);
  }

  static Future<dynamic> clearOAuthToken() {
    return deleteByKey(key: SecureStorageKey.accessToken);
  }

  static Future<String?> getSavedAccessToken() async =>
      await getByKey(key: SecureStorageKey.accessToken);
}

class SecureStorageKey {
  static String accessToken = 'accessToken';
  static String uniqueId = 'uniqueId';
   static String userUid = 'userUid';
}
