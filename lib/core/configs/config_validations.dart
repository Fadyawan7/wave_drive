// ignore_for_file: avoid_print

import 'dart:convert';
// Conditional import for dart:io - only available on non-web platforms
import 'dart:io' if (dart.library.html) 'dart:html';

void main(List<String> args) {
  if (args.length != 2) {
    print('Usage: dart check_config_keys.dart <file1> <file2>');
    exit(1);
  }

  final file1Path = args[0];
  final file2Path = args[1];

  try {
    final file1 = File(file1Path);
    final file2 = File(file2Path);

    final content1 = file1.readAsStringSync();
    final content2 = file2.readAsStringSync();

    final json1 = jsonDecode(content1) as Map<String, dynamic>;
    final json2 = jsonDecode(content2) as Map<String, dynamic>;

    final keys1 = json1.keys.toSet();
    final keys2 = json2.keys.toSet();

    if (!keys1.containsAll(keys2) || !keys2.containsAll(keys1)) {
      final keysOnlyInFile1 = keys1.difference(keys2);
      final keysOnlyInFile2 = keys2.difference(keys1);
      if (keysOnlyInFile1.isNotEmpty) {
        print('Keys present in $file1Path but not in $file2Path:');
        keysOnlyInFile1.forEach(print);
      }

      if (keysOnlyInFile2.isNotEmpty) {
        print('Keys present in $file2Path but not in $file1Path:');
        keysOnlyInFile2.forEach(print);
      }

      exit(1);
    }

    print('Configuration validated');
  } catch (e) {
    print('Error: $e');
    exit(1);
  }
}
