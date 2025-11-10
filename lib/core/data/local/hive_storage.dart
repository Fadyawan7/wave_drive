import 'package:wave_drive/core/shared/constants/constants.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  static const String appBoxKey = 'app_box';

  static String lastPostedVideoTime = 'last_posted_video_time';
  static String rcoinVisibleBalance = 'rcoin_visibile_balance';

  static String countWatchLivestreamSeconds = 'count_watch_livestream_seconds';
  static String countWatchLivestreamDate = 'count_watch_livestream_date';
  static String isfirsttime = 'is_first_time';
  static String countVideoSeconds = 'count_watch_video_seconds';

  static const String searchHistoryKey = 'search_history';
  static late Box<dynamic> _appBox;

  static Future<void> init() async {
    await Hive.initFlutter();
    _appBox = await Hive.openBox(appBoxKey);
    AppLogger.d('[HIVE] - ${_appBox.toMap()}');
  }

  static Future<dynamic> getByKey(String key, {dynamic defaultValue}) async {
    return _appBox.get(key, defaultValue: defaultValue);
  }

  static Future<void> setByKey(String key, dynamic value) async {
    return _appBox.put(key, value);
  }

  static bool isRcoinVisible() =>
      _appBox.get(rcoinVisibleBalance) as bool? ?? true;
  static void setRcoinBalanceVisible(bool isVisible) =>
      setByKey(rcoinVisibleBalance, isVisible);

  static Future<void> setPostedVideoTime(String userId) async {
    final timeStamp = DateTime.timestamp();
    final Map<String, DateTime> map = Map<String, DateTime>.from(
      await getByKey(lastPostedVideoTime) as Map? ?? {},
    );
    map.addAll({userId: timeStamp});
    return setByKey(lastPostedVideoTime, map);
  }

  static Future<bool> canUploadVideo(String userId) async {
    final map = await getByKey(lastPostedVideoTime) as Map?;
    if (map == null) return true;
    final lastPostedVideoAt = Map<String, DateTime>.from(map)[userId];
    if (lastPostedVideoAt == null) return true;

    return DateTime.timestamp().difference(lastPostedVideoAt).inMinutes >=
        uploadCoolDownDurationMins;
  }

  /// Adds a keyword to the search history
  static Future<void> addSearchKeyword(String keyword) async {
    try {
      final List<String> history = List<String>.from(await getSearchHistory());
      if (!history.contains(keyword)) {
        history.add(keyword);
        await setByKey(searchHistoryKey, history);
        AppLogger.d('[SEARCH HISTORY] - Added keyword: $keyword');
      }
    } catch (e) {
      AppLogger.e('[SEARCH HISTORY ERROR] - Add keyword: $e');
    }
  }

  /// Retrieves the search history as a list of strings
  static Future<List<String>> getSearchHistory() async {
    try {
      final dynamic result = await getByKey(searchHistoryKey, defaultValue: []);
      if (result is List) {
        return List<String>.from(result);
      } else {
        AppLogger.e(
          '[SEARCH HISTORY ERROR] - Invalid data type for search history',
        );
        return [];
      }
    } catch (e) {
      AppLogger.e('[SEARCH HISTORY ERROR] - Get history: $e');
      return [];
    }
  }

  /// Clears the entire search history
  static Future<void> clearSearchHistory() async {
    try {
      await setByKey(searchHistoryKey, []);
      AppLogger.d('[SEARCH HISTORY] - Cleared all history');
    } catch (e) {
      AppLogger.e('[SEARCH HISTORY ERROR] - Clear history: $e');
    }
  }
}
