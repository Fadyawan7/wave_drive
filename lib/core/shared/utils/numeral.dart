import 'dart:math';

const int defaultDigit = 3;

extension ExtensionNumeral on num {
  String numeral(
      {int fractionDigits = defaultDigit, bool isRoundDown = false}) {
    return Numeral(this)
        .format(fractionDigits: fractionDigits, isRoundDown: isRoundDown);
  }
}

class Numeral {
  const Numeral(this.numeral);

  final num numeral;

  String format({int fractionDigits = defaultDigit, bool isRoundDown = false}) {
    final NumeralParsedValue parsed = numeralParser(numeral);
    final value = isRoundDown
        ? toStringAsFixedRoundDown(parsed.value, fractionDigits)
        : parsed.value.toStringAsFixed(fractionDigits);
    return _removeEndsZero(value) + parsed.suffix;
  }

  String toStringAsFixedRoundDown(num number, int digits) {
    final int fac = pow(10, digits).toInt();
    final double truncated = (number * fac).floor() / fac;
    return truncated.toStringAsFixed(digits);
  }

  String _removeEndsZero(String value) {
    if (!value.contains('.')) {
      return value;
    }

    if (value.endsWith('.')) {
      return value.substring(0, value.length - 1);
    } else if (value.endsWith('0')) {
      return _removeEndsZero(value.substring(0, value.length - 1));
    }

    return value;
  }

  @override
  String toString() => format();
}

class NumeralParsedValue {
  final String suffix;

  final num value;

  factory NumeralParsedValue({
    required String suffix,
    required num value,
  }) {
    return NumeralParsedValue._(value, suffix);
  }

  NumeralParsedValue._(this.value, this.suffix);

  @override
  String toString() {
    return '(String suffix = "$suffix", num value = $value);';
  }
}

NumeralParsedValue numeralParser(num value) {
  final num abs = value.abs();

  if (abs >= 1000000000000) {
    return NumeralParsedValue(value: value / 1000000000000, suffix: 'T');
  } else if (abs >= 1000000000) {
    return NumeralParsedValue(value: value / 1000000000, suffix: 'B');
  } else if (abs >= 1000000) {
    return NumeralParsedValue(value: value / 1000000, suffix: 'M');
  } else if (abs >= 1000) {
    return NumeralParsedValue(value: value / 1000, suffix: 'K');
  }

  return NumeralParsedValue(value: value, suffix: '');
}
