import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wave_drive/core/configs/app_config.dart';
import 'package:wave_drive/core/services/firebase/firebase_auth/constants.dart';
import 'package:wave_drive/core/services/firebase/firebase_auth/firebase_auth_service.dart';
import 'package:wave_drive/injector_setup.dart';

import '../../../../shared/utils/app_logger.dart';

class GoogleAuthService {
  final _firebaseAuthService = injector<FirebaseAuthService>();

  Future<SocialLoginResponse> signIn() async {
    try {
      // Step 1: Initialize Google Sign-In
      await GoogleSignIn.instance.initialize(
        clientId: AppConfig.googleAuthClintId,
        serverClientId: AppConfig.googleAuthClintId
      );

      // Step 2: Try silent login
    //  await GoogleSignIn.instance.attemptLightweightAuthentication();

      // Step 3: If not signed in, do full authenticate flow
      final googleUser = await GoogleSignIn.instance.authenticate();
      // Step 4: Get auth tokens
      final googleAuth = await googleUser.authentication;

      // Step 5: Build Firebase credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.idToken,
        idToken: googleAuth.idToken,
      );

      // Step 6: Sign in with Firebase
      final userCredential = await _firebaseAuthService.signInWithCredential(
        credential,
      );
      return SocialLoginResponse(
        status: SocialLoginStatus.success,
        userCredential: userCredential,
      );
    } catch (error) {
      AppLogger.e('Sign in with Google error: ', error: error);
      return SocialLoginResponse(status: SocialLoginStatus.failed);
    }
  }
}
