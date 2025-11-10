// import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../shared/utils/app_logger.dart';

class FirebaseAuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  // final _installations = FirebaseInstallations.instance;

  // Future<String> getFID() async {
  //   return _installations.getId();
  // }

  User? getCurrentUser() {
    final user = _firebaseAuth.currentUser;
    return user;
  }

  bool isSignedIn() {
    return _firebaseAuth.currentUser != null;
  }

  Future<UserCredential?> signInWithCustomToken(String token) async {
    try {
      return await _firebaseAuth.signInWithCustomToken(token);
    } on FirebaseAuthException catch (error) {
      AppLogger.e('Firebase Auth sign in error', error: error);
      return null;
    }
  }

  Future<UserCredential?> signInAnonymously() async {
    try {
      return await _firebaseAuth.signInAnonymously();
    } on FirebaseAuthException catch (error) {
      AppLogger.e('Firebase Auth sign in error', error: error);
      return null;
    }
  }

  Future<void> updateInfo({required String email, required String name}) async {
    try {
      await _firebaseAuth.currentUser?.updateDisplayName(name);
      _firebaseAuth.currentUser?.reload();
    } catch (error) {
      AppLogger.e('Firebase Auth update error', error: error);
    }
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<UserCredential?> signInWithCredential(
    AuthCredential authCredential,
  ) async {
    try {
      return await _firebaseAuth.signInWithCredential(authCredential);
    } on FirebaseAuthException catch (error) {
      AppLogger.e(
        'Firebase Auth sign in error - ${authCredential.signInMethod}',
        error: error,
      );
      if (error.code == 'account-exists-with-different-credential') {
        return _linkAccount(authCredential);
      }
      return null;
    }
  }

  Future<UserCredential?> _linkAccount(AuthCredential authCredential) async {
    try {
      return await FirebaseAuth.instance.currentUser?.linkWithCredential(
        authCredential,
      );
    } on FirebaseAuthException catch (error) {
      AppLogger.e('Firebase Auth link account error', error: error);
      return null;
    }
  }
}
