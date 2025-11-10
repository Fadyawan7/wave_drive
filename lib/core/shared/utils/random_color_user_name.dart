import 'package:flutter/material.dart';

/// List of colors to pick from
const List<Color> _avatarColors = [
  Color(0xFFf44336), // Red
  Color(0xFFe91e63), // Pink
  Color(0xFF9c27b0), // Purple
  Color(0xFF673ab7), // Deep Purple
  Color(0xFF3f51b5), // Indigo
  Color(0xFF2196f3), // Blue
  Color(0xFF03a9f4), // Light Blue
  Color(0xFF00bcd4), // Cyan
  Color(0xFF009688), // Teal
  Color(0xFF4caf50), // Green
  Color(0xFF8bc34a), // Light Green
  Color(0xFFcddc39), // Lime
  Color(0xFFffc107), // Amber
  Color(0xFFff9800), // Orange
  Color(0xFFff5722), // Deep Orange
];

/// Returns a deterministic "random" color based on [username].
/// Same username will always get the same color.
Color getRandomColor(String? username) {
  if (username == null || username.isEmpty) {
    return _avatarColors.first;
  }

  // Compute a simple hash from the username
  final hash = username.codeUnits.fold<int>(0, (prev, elem) => prev + elem);

  // Pick color based on hash
  return _avatarColors[hash % _avatarColors.length];
}
