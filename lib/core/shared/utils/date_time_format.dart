import 'package:wave_drive/core/shared/constants/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jiffy/jiffy.dart';
import 'package:timeago/timeago.dart' as timeago;

extension DurationExtensions on Duration {
  /// Converts the duration into a readable string
  /// 05:15
  String toHoursMinutes() {
    final String twoDigitMinutes = _toTwoDigits(inMinutes.remainder(60));
    return "${_toTwoDigits(inHours)}:$twoDigitMinutes";
  }

  /// Converts the duration into a readable string
  /// 05:15:35
  String toHoursMinutesSeconds() {
    final String twoDigitMinutes = _toTwoDigits(inMinutes.remainder(60));
    final String twoDigitSeconds = _toTwoDigits(inSeconds.remainder(60));
    return "${_toTwoDigits(inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  /// 05:15s
  String toMinutesSeconds() {
    final String twoDigitMinutes = _toTwoDigits(inMinutes.remainder(60));
    final String twoDigitSeconds = _toTwoDigits(inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  String _toTwoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }
}

String timeAgo(DateTime datetime) {
  final difference = DateTime.now().difference(datetime);
  final fifteenAgo = DateTime.now().subtract(difference);
  return timeago.format(fifteenAgo);
}

String convertServerDateTime(String dateTime) {
  final time = Jiffy.parse(dateTime, pattern: serverDateTimeFormat);
  return time.format(pattern: appDateTimeFormat);
}

String calculateAge(String dateTime) {
  if (dateTime.isEmpty) {
    return "";
  }

  final time = Jiffy.parse(dateTime, pattern: serverDateTimeFormat);
  return time.toNow(withPrefixAndSuffix: false).split(" ").first;
}

String getTimeDifferenceLess(String? dateTime) {
  final time = Jiffy.parse(dateTime!, isUtc: true);
  return time.fromNow();
}

int getTimeLeftInSecondsFromNow({
  int? currentZegoTime,
  required int timestamp,
  required int maxTimeInSeconds,
}) {
  // Convert the timestamp to DateTime
  final DateTime currentTime = currentZegoTime != null
      ? DateTime.fromMillisecondsSinceEpoch(currentZegoTime)
      : DateTime.now();
  final DateTime targetTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

  // Calculate the difference in time
  final Duration difference = targetTime.difference(currentTime);

  // Calculate the time left by adding 3 minutes to the difference
  final Duration timeLeft = difference + Duration(seconds: maxTimeInSeconds);

  // Return the total time left in seconds
  return timeLeft.inSeconds < 0 ? 0 : timeLeft.inSeconds;
}

String formatDuration(int s) {
  final Duration duration = Duration(seconds: s);

  String twoDigits(int n) {
    if (n >= 10) {
      return "$n";
    } else {
      return "0$n";
    }
  }

  final String minutes = twoDigits(duration.inMinutes.remainder(60));
  final String seconds = twoDigits(duration.inSeconds.remainder(60));

  return "$minutes:$seconds";
}

String convertDateTimetoDate(DateTime dateTime) {
  return DateFormat(serverDateTimeFormat).format(dateTime);
}

String showMonthWise(DateTime dateTime) {
  return DateFormat('MMMM yyyy').format(dateTime);
}

DateTime previousMonth(DateTime date) {
  return DateTime(date.year, date.month - 1, 1);
}

DateTime nextMonth(DateTime date) {
  return DateTime(date.year, date.month + 1, 1);
}

DateTime get dateTimeNow => DateTime.now();

String get date => DateTime.now().toIso8601String().split('T').first;

String durationFormetinHHMMSS(int totalSeconds) {
  final int hours = totalSeconds ~/ 3600;
  final int minutes = (totalSeconds % 3600) ~/ 60;
  final int seconds = totalSeconds % 60;

  // Format as HH:mm:ss
  final String hoursStr = hours.toString().padLeft(2, '0');
  final String minutesStr = minutes.toString().padLeft(2, '0');
  final String secondsStr = seconds.toString().padLeft(2, '0');

  return "$hoursStr:$minutesStr:$secondsStr";
}

String formatTimehhmma(DateTime dateTime) {
  return DateFormat(appDateTimeFormathhmma).format(dateTime);
}

String formatTimeHHmmddMMyyyy(DateTime dateTime) {
  return DateFormat(appDateTimeFormatHHmmddMMyyyy).format(dateTime);
}

String formatTimehmma(DateTime dateTime) {
  final DateTime localDateTime = dateTime.toLocal();

  return DateFormat(appDateTimeFormathmma).format(localDateTime).toUpperCase();
}

String formatDateTimehmma(DateTime dateTime) {
  return DateFormat(appDateTimeFormatddMMMhhmma).format(dateTime).toUpperCase();
}

String getTimeDifference(DateTime dateTime) {
  final currentTime = DateTime.now();
  final difference = currentTime.difference(dateTime);
  final differenceMins = difference.inMinutes;
  if (differenceMins < 60) {
    if (differenceMins == 0) {
      return 'Just now';
    }
    return '$differenceMins min${differenceMins > 1 ? 's' : ''}';
  }
  final differenceHours = difference.inHours;
  if (differenceHours < 24) {
    return '$differenceHours hour${differenceHours > 1 ? 's' : ''}';
  }
  final differenceDays = difference.inDays;
  if (differenceDays < 7) {
    return '$differenceDays day${differenceDays > 1 ? 's' : ''}';
  }

  return DateFormat('dd/MM/yyyy').format(dateTime);
}

extension DurationIntExtension on int {
  /// Getter to convert milliseconds to mm:ss format
  String get inMinutesSecondsFormat =>
      Duration(milliseconds: this).toMinutesSeconds();

  /// Getter to convert milliseconds to hh:mm:ss format
  String get inHoursMinutesSecondsFormat =>
      Duration(seconds: this).toHoursMinutesSeconds();

  /// Getter to convert milliseconds to hh:mm format
  String get inHoursMinutesFormat => Duration(seconds: this).toHoursMinutes();

  String get inMinutesSecondsFromMilliseconds =>
      Duration(milliseconds: this).toMinutesSeconds();
}
