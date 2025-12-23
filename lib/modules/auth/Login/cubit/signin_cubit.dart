import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wave_drive/core/cubits/auth/auth_cubit.dart';
import 'package:wave_drive/core/data/network/dio/sign_up_phone_dto.dart';
import 'package:wave_drive/core/services/firebase/authenticate/phone_auth_service.dart';
import 'package:wave_drive/core/services/firebase/consts.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/injector_setup.dart';

part 'signin_state.dart';
part 'signin_cubit.freezed.dart';



enum SigninStep {
  login('Login'),
  verify('OTP Verification');

  const SigninStep(this.appbarTitle);

  final String appbarTitle;
}

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(const SigninState());

  final _authCubit = injector<AuthCubit>();
  final _phoneAuthService = injector<PhoneAuthService>();


  void changeStep(SigninStep step) => emit(state.copyWith(step: step));

  Future<({bool isSuccess, String? errorText})> sendEmailOtp(
    String email,
  ) async {
    final result = await _authCubit.checkEmailExist(email);
    if (!result.isExist) {
      return (isSuccess: false, errorText: "Emial not exist");
    }
    final response = await _authCubit.sendEmailOtp(email);

    if (!response.isSuccess) {
      return (isSuccess: false, errorText: result.errorText ?? "Server error");
    }

    return (isSuccess: true, errorText: null);
  }

  Future<({bool isSuccess, String? errorText})> varifyOtp(String otp) async {
    await _authCubit.varifyEmailOtp(otp);

    if (_authCubit.state.signInSocialState.isError) {
      return (isSuccess: false, errorText: _authCubit.state.errorMessage);
    }

    return (isSuccess: true, errorText: null);
  }

  Future<(bool success, String? errorMessage)> sendOtpNumber(
    String phoneNumber,
  ) async {
    final completer = Completer<(bool, String?)>();

    try {
      final result = await _authCubit.checkPhoneNumberExist(phoneNumber);
      if (!result.isExist) {
        completer.complete((
          false,
          result.errorText ?? "Phone number not exist",
        ));
      }

      await _phoneAuthService.verifyPhoneNumber(
        phoneNumber: phoneNumber,

        codeSent: (String? verificationId) {
          AppLogger.d("CODE SENT! verificationId: $verificationId");

          emit(
            state.copyWith(
              varificationId: verificationId,
              phoneNumber: phoneNumber,
            ),
          );

          if (!completer.isCompleted) {
            completer.complete((true, null));
          }
        },

        verificationFailed: (FirebaseAuthException e) {
          AppLogger.e("OTP verification failed: $e");

          if (!completer.isCompleted) {
            completer.complete((false, e.message ?? "OTP verification failed"));
          }
        },

        verificationCompleted: (_) {},

        codeAutoRetrievalTimeout: (_) {},
      );

      return completer.future;
    } catch (e) {
      return (false, "Unexpected error: $e");
    }
  }

  Future<({bool success, String? errorMessage})> varifiyNumberOtp({
    required String otp,
  }) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: state.varificationId!,
      smsCode: otp,
    );

    final response = await _phoneAuthService.signInWithCredential(
      credential,
      verificationId: state.varificationId!,
      otp: otp,
    );

    if (!(response.status == SocialLoginStatus.failed ||
        response.status == SocialLoginStatus.cancelled)) {
      final uid = response.userCredential?.user?.uid;

      await _authCubit.signIn(uid!);
      final isError = _authCubit.state.signInSocialState.isError;
      if (isError) {
        return (success: false, errorMessage: _authCubit.state.errorMessage);
      }
    }

    return (success: true, errorMessage: null);
  }
}
