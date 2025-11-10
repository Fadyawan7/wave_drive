import 'package:wave_drive/core/data/local/hive_storage.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';

class CredentialsService {
  static const String _rememberMeKey = 'remember_me';
  static const String _savedEmailKey = 'saved_email';
  static const String _savedPasswordKey = 'saved_password';

  /// Save login credentials if remember me is enabled
  static Future<void> saveCredentials({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    try {
      print('DEBUG: Saving credentials - Email: $email, RememberMe: $rememberMe');
      await HiveStorage.setByKey(_rememberMeKey, rememberMe);
      
      if (rememberMe) {
        await HiveStorage.setByKey(_savedEmailKey, email);
        await HiveStorage.setByKey(_savedPasswordKey, password);
        print('DEBUG: Credentials saved successfully');
        AppLogger.d('[CREDENTIALS] - Saved credentials for email: $email');
      } else {
        // Clear saved credentials if remember me is disabled
        print('DEBUG: Remember me is false, clearing credentials');
        await clearCredentials();
      }
    } catch (e) {
      print('DEBUG: Error saving credentials: $e');
      AppLogger.e('[CREDENTIALS ERROR] - Save credentials: $e');
    }
  }

  /// Retrieve saved credentials
  static Future<Map<String, dynamic>> getSavedCredentials() async {
    try {
      final rememberMe = await HiveStorage.getByKey(_rememberMeKey, defaultValue: false) as bool;
      print('DEBUG: Remember me status: $rememberMe');
      
      if (rememberMe) {
        final email = await HiveStorage.getByKey(_savedEmailKey, defaultValue: '') as String;
        final password = await HiveStorage.getByKey(_savedPasswordKey, defaultValue: '') as String;
        
        print('DEBUG: Retrieved credentials - Email: $email, Password: ${password.isNotEmpty ? "***" : "empty"}');
        AppLogger.d('[CREDENTIALS] - Retrieved credentials for email: $email');
        
        return {
          'rememberMe': rememberMe,
          'email': email,
          'password': password,
        };
      }
      
      print('DEBUG: Remember me is false, returning empty credentials');
      return {
        'rememberMe': false,
        'email': '',
        'password': '',
      };
    } catch (e) {
      print('DEBUG: Error retrieving credentials: $e');
      AppLogger.e('[CREDENTIALS ERROR] - Get credentials: $e');
      return {
        'rememberMe': false,
        'email': '',
        'password': '',
      };
    }
  }

  /// Clear all saved credentials
  static Future<void> clearCredentials() async {
    try {
      await HiveStorage.setByKey(_rememberMeKey, false);
      await HiveStorage.setByKey(_savedEmailKey, '');
      await HiveStorage.setByKey(_savedPasswordKey, '');
      AppLogger.d('[CREDENTIALS] - Cleared all saved credentials');
    } catch (e) {
      AppLogger.e('[CREDENTIALS ERROR] - Clear credentials: $e');
    }
  }

  /// Check if remember me is enabled
  static Future<bool> isRememberMeEnabled() async {
    try {
      return await HiveStorage.getByKey(_rememberMeKey, defaultValue: false) as bool;
    } catch (e) {
      AppLogger.e('[CREDENTIALS ERROR] - Check remember me: $e');
      return false;
    }
  }
}
