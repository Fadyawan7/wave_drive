import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:rocco_mobile_plugins/rocco_mobile_plugins.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:wave_drive/core/services/firebase/firebase_auth/constants.dart';
import 'package:wave_drive/core/services/firebase/firebase_auth/firebase_auth_service.dart';
import 'package:wave_drive/injector_setup.dart';

import '../../../../shared/utils/app_logger.dart' show AppLogger;

class AppleAuthService {
  final _firebaseAuthService = injector<FirebaseAuthService>();

  Future<SocialLoginResponse> signIn() async {
    try {
      final rawNonce = _generateNonce();
      final nonce = _sha256ofString(rawNonce);

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oauthCredential = OAuthProvider(
        'apple.com',
      ).credential(idToken: credential.identityToken, rawNonce: rawNonce);

      final userCredential = await _firebaseAuthService.signInWithCredential(
        oauthCredential,
      );

      return SocialLoginResponse(
        status: SocialLoginStatus.success,
        userCredential: userCredential,
      );
    } catch (error) {
      AppLogger.e('Sign in with Apple error: ', error: error);

      if (error is SignInWithAppleAuthorizationException &&
          (error.code == AuthorizationErrorCode.canceled ||
              error.code == AuthorizationErrorCode.unknown)) {
        return SocialLoginResponse(status: SocialLoginStatus.cancelled);
      }

      return SocialLoginResponse(status: SocialLoginStatus.failed);
    }
  }

  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
