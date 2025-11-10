import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';
// ignore: depend_on_referenced_packages
import 'package:uuid/uuid.dart';

class CryptoHash {
  static const uuid = Uuid();
  static final code = uuid.v1();

  static const signatureNonce = "rocco12345";
  static const appId = "2173135480";
  static const appKey = "pWKPudE0Phyktj877zoHaGeIejjcgNWs";

  static String makeSign() {
    // Create data string with runtime DateTime value instead of const
    final data = '$signatureNonce$appKey${DateTime.now().millisecond}';
    // Create an MD5 hash
    return md5.convert(utf8.encode(data)).toString();
  }
}
