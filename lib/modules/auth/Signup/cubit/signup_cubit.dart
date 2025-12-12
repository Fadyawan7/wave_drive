import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wave_drive/core/cubits/auth/auth_cubit.dart';
import 'package:wave_drive/core/data/models/auth/siginin_dto.dart';
import 'package:wave_drive/core/data/network/dio/sign_up_phone_dto.dart';
import 'package:wave_drive/core/services/firebase/authenticate/phone_auth_service.dart';
import 'package:wave_drive/core/services/firebase/consts.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/core/shared/widgets/base/base_cubit.dart';
import 'package:wave_drive/injector_setup.dart';

part 'signup_state.dart';
part 'signup_cubit.freezed.dart';

class SignupCubit extends BaseCubit<SignupState> {
  final _phoneAuthService = injector<PhoneAuthService>();
  final _authCubit = injector<AuthCubit>();

  SignupCubit() : super(SignupState());

  Future<(bool success, String? errorMessage)> sendOtpNumber(
    String phoneNumber,
  ) async {
    try {
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
        },
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (FirebaseAuthException e) {
          AppLogger.e("OTP verification failed: $e");
        },
        codeAutoRetrievalTimeout: (String) {},
      );
      return (true, null);
    } on FirebaseAuthException catch (e) {
      return (false, e.message ?? "Firebase auth error");
    } catch (e) {
      return (false, "Unexpected error: $e");
    }
  }

  Future<SocialLoginResponse> varifiyNumberOtp({required String otp}) async {
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
      final dto = SignInDTO(
        uid: uid!,
        type: "Driver",
        method: 'phone',
        email: state.email!,
        city: state.city!,
        country: state.country!,
      );
      await _authCubit.signIn(dto);
      final isError = _authCubit.state.signInSocialState.isError;
      if (isError) {
        return SocialLoginResponse(
          status: SocialLoginStatus.failed,
          errorCode: _authCubit.state.errorMessage,
        );
      }
    }

    return response;
  }

  void setCityCountry(String country, String city, String email) {
    emit(state.copyWith(city: city, country: country, email: email));
  }
}
