Map<String, dynamic> parseFirebaseObject(Map<Object?, Object?> oldMap) {
  final Map<String, dynamic> newMap = {};
  oldMap.forEach((key, value) {
    if (key is String) {
      if (value is List) {
        newMap[key] = value
            .map((item) => item is Map ? parseFirebaseObject(item) : item)
            .toList();
      } else if (value is Map) {
        newMap[key] = parseFirebaseObject(value);
      } else {
        newMap[key] = value;
      }
    }
  });
  return newMap;
}
