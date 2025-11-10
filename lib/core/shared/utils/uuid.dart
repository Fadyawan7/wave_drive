import 'dart:math';

String generateTimestamp() {
  return DateTime.now().millisecondsSinceEpoch.toString();
}

String generateSixDigitUniqueId() {
  final Random random = Random();
  final int randomNumber = 100000 + random.nextInt(900000);
  return randomNumber.toString();
}

String generateUniqueId() {
  const String pushChars =
      '-0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz';
  int lastPushTime = 0;
  final List<int> lastRandChars = <int>[];
  int now = DateTime.now().millisecondsSinceEpoch;
  final bool duplicateTime = (now == lastPushTime);
  lastPushTime = now;
  final List timeStampChars = List<String>.filled(8, '0');
  for (int i = 7; i >= 0; i--) {
    timeStampChars[i] = pushChars[now % 64];
    now = (now / 64).floor();
  }
  if (now != 0) {}
  String uniqueId = timeStampChars.join();
  if (!duplicateTime) {
    for (int i = 0; i < 12; i++) {
      lastRandChars.add((Random().nextDouble() * 64).floor());
    }
  } else {
    const int i = 0;
    for (int i = 11; i >= 0 && lastRandChars[i] == 63; i--) {
      lastRandChars[i] = 0;
    }
    lastRandChars[i]++;
  }
  for (int i = 0; i < 12; i++) {
    // ignore: use_string_buffers
    uniqueId += pushChars[lastRandChars[i]];
  }
  return uniqueId;
}
