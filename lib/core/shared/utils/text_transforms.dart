String convertNameToAvatar(String? name) {
  if (name == null || name == "") {
    return '';
  }

  final nameParts = name.trim().toUpperCase().split(RegExp(r'[\s\/]+'));
  if (nameParts.length > 1) {
    return nameParts.first.substring(0, 1) + nameParts.last.substring(0, 1);
  }

  return nameParts.first.substring(0, 1);
}

String capitalizeEachWord(String sentence) {
  final List<String> words = sentence.split(' ');

  final List<String> capitalizedWords = words.map((word) {
    if (word.isEmpty) return word;
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).toList();

  return capitalizedWords.join(' ');
}
