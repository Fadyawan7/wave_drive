 import 'package:firebase_auth/firebase_auth.dart';
 import 'package:google_sign_in/google_sign_in.dart';
import 'package:wave_drive/core/configs/app_config.dart';
import 'package:wave_drive/core/services/firebase/consts.dart';
import 'package:wave_drive/core/services/firebase/firebase_auth_service.dart';
import 'package:wave_drive/injector_setup.dart';

import '../../../shared/utils/app_logger.dart';


class GoogleAuthService {
  final _firebaseAuthService = injector<FirebaseAuthService>();

  Future<SocialLoginResponse> signIn() async {
    try {
      await GoogleSignIn.instance.initialize(
        clientId: AppConfig.googleAuthClintId,
        serverClientId: AppConfig.googleAuthClintId
      );
      


      final googleUser = await GoogleSignIn.instance.authenticate();
      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.idToken,
        idToken: googleAuth.idToken,
      );

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
