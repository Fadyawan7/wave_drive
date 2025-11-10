import 'package:wave_drive/core/shared/constants/enums.dart';

extension NullableStringIsNullOrEmptyExtension on String? {
  AllowType toAllowType() {
    switch (this) {
      case "All":
        return AllowType.all;
      case "All members are muted":
        return AllowType.allMuted;
      case "Follow only the hosts":
        return AllowType.allFollowers;
      case "Fan club members":
        return AllowType.allFanClubMember;
      case "Only administrators":
        return AllowType.allAdmins;
      default:
        return AllowType.all;
    }
  }

  String filterBlockedWords(List<String> blockWords) {
    String filteredMessage = this!;
    for (final word in blockWords) {
      final regex = RegExp(
        r'\b' + RegExp.escape(word) + r'\b',
        caseSensitive: false,
      );
      filteredMessage = filteredMessage.replaceAll(regex, '...');
    }
    return filteredMessage;
  }

  bool get isInt => this != null && int.tryParse(this!) != null;

  /// Checks if the `String` is Blank (null, empty or only white spaces).
  bool get isBlank => this?.trim().isEmpty ?? true;

  /// Checks if the `String` is not blank (null, empty or only white spaces).
  bool get isNotBlank => isBlank == false;

  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isUrl => Uri.parse(this!).isAbsolute;

  String capitalize() {
    return "${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}";
  }

  String? after(String pattern) {
    if (isBlank) {
      return this;
    }

    if (!this!.contains(pattern)) {
      return '';
    }

    final List<String> patternWords = pattern.split(' ');

    if (patternWords.isEmpty) {
      return '';
    }
    final int indexOfLastPatternWord = this!.indexOf(patternWords.last);

    if (patternWords.last.isEmpty) {
      return '';
    }

    return this!.substring(
      indexOfLastPatternWord + patternWords.last.length,
      this!.length,
    );
  }

  /// Checks if string is an audio file.
  bool isAudio(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith(".mp3") ||
        ext.endsWith(".wav") ||
        ext.endsWith(".wma") ||
        ext.endsWith(".amr") ||
        ext.endsWith(".ogg");
  }

  /// Checks if string is an image file.
}

bool isImage(String filePath) {
  final ext = filePath.toLowerCase();

  return ext.contains(".jpg") ||
      ext.contains(".jpeg") ||
      ext.contains(".png") ||
      ext.contains(".gif") ||
      ext.contains(".bmp") ||
      ext.contains(".webp");
}

bool isVideo(String filePath) {
  final ext = filePath.toLowerCase();

  return ext.contains(".mp4") ||
      ext.contains(".avi") ||
      ext.contains(".wmv") ||
      ext.contains(".rmvb") ||
      ext.contains(".mpg") ||
      ext.contains(".mpeg") ||
      ext.contains(".3gp");
}

extension AllowTypeExtension on AllowType {
  String toTagLabel() {
    switch (this) {
      case AllowType.all:
        return "All";
      case AllowType.allMuted:
        return "All members are muted";
      case AllowType.allFollowers:
        return "Follow only the hosts";
      case AllowType.allFanClubMember:
        return "Fan club members";
      case AllowType.allAdmins:
        return "Only administrators";
    }
  }
}
