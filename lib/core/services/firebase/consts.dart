 import 'package:firebase_auth/firebase_auth.dart';

enum SocialLoginStatus { success, cancelled, failed }

enum SocialType {
  google,
  facebook,
  twitter,
  apple,
  whatsapp,
  mobile
}

class SocialLoginResponse {
  SocialLoginResponse({
   this.userCredential,
    required this.status,
    this.errorCode,
  });

  UserCredential? userCredential;
  SocialLoginStatus status;
  String? errorCode;
}
