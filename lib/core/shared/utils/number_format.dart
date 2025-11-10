import 'package:wave_drive/generated/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';

String decimalFormat(num value) => NumberFormat('#,###').format(value);

String formatNumber(num value) {
  if (value < 1000) {
    return value.toString();
  } else if (value < 1000000) {
    final result = value / 1000;
    return '${result.toStringAsFixed(result % 1 == 0 ? 0 : 1)}${LocaleKeys.common_thousand.tr()}';
  } else if (value < 1000000000) {
    final double result = value / 1000000;
    return '${result.toStringAsFixed(result % 1 == 0 ? 0 : 1)}${LocaleKeys.common_million.tr()}';
  } else {
    final double result = value / 1000000000;
    return '${result.toStringAsFixed(result % 1 == 0 ? 0 : 1)}${LocaleKeys.common_billion.tr()}';
  }
}

String formatIntNumber(int value) {
  if (value < 1000) {
    return value.toString();
  } else if (value < 1000000) {
    final result = value / 1000;
    return '${result.toStringAsFixed(result % 1 == 0 ? 0 : 1)}${LocaleKeys.common_thousand.tr()}';
  } else if (value < 1000000000) {
    final result = value / 1000000;
    return '${result.toStringAsFixed(result % 1 == 0 ? 0 : 1)}${LocaleKeys.common_million.tr()}';
  } else if (value < 1000000000000) {
    final result = value / 1000000000;
    return '${result.toStringAsFixed(result % 1 == 0 ? 0 : 1)}${LocaleKeys.common_billion.tr()}';
  } else {
    final result = value / 1000000000000;
    return '${result.toStringAsFixed(result % 1 == 0 ? 0 : 1)}${LocaleKeys.common_trillion.tr()}';
  }
}

String format100Number(int value) {
  if (value < 100000) {
    // Less than 100K: show full number
    return value.toString();
  } else if (value < 1000000000) {
    // 100K to <1B: show in Millions
    final result = value / 1000000;
    return '${result.toStringAsFixed(result % 1 == 0 ? 0 : 1)}${LocaleKeys.common_million.tr()}';
  } else {
    // 1B and above: show in Billions
    final result = value / 1000000000;
    return '${result.toStringAsFixed(result % 1 == 0 ? 0 : 1)}${LocaleKeys.common_billion.tr()}';
  }
}

String formatStringNumber(String value) {
  try {
    final intValue = int.parse(value);
    if (intValue < 1000) {
      return intValue.toString();
    } else if (intValue < 1000000) {
      final double result = intValue / 1000;
      return '${result.toStringAsFixed(result % 1 == 0 ? 0 : 1)}${LocaleKeys.common_thousand.tr()}';
    } else if (intValue < 1000000000) {
      final double result = intValue / 1000000;
      return '${result.toStringAsFixed(result % 1 == 0 ? 0 : 1)}${LocaleKeys.common_million.tr()}';
    } else {
      final double result = intValue / 1000000000;
      return '${result.toStringAsFixed(result % 1 == 0 ? 0 : 1)}${LocaleKeys.common_billion.tr()}';
    }
  } catch (e) {
    return '0';
  }
}
