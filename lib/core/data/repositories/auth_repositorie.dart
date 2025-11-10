import 'package:wave_drive/core/data/models/auth/login/sigin_dto.dart';
import 'package:wave_drive/core/data/models/auth/siginin_dto.dart';
import 'package:wave_drive/core/data/models/auth/signup/signup_email_dto.dart';
import 'package:wave_drive/core/data/models/auth/user_model.dart';
import 'package:wave_drive/core/data/models/auth/varify_otp_dto.dart';
import 'package:wave_drive/core/data/network/api_service.dart';
import 'package:wave_drive/core/data/network/dio/helpers/api_helper.dart';
import 'package:wave_drive/core/data/network/dio/helpers/safe_api_call.dart';
import 'package:wave_drive/injector_setup.dart';

class AuthRepository {
  final _apiClient = injector.get<ApiService>();

  // Future<({SignupResponse? response, String? errorText})> registerWithEmail(
  //   SignupEmailDto dto,
  // ) async {
  //   final response = await safeApiCall(_apiClient.auth.signupWithEmail(dto));
  //   return (response: response.data, errorText: response.error);
  // }

  // Future<({SignupResponse? response, String? errorText})> sigininWIthEmail(
  //   SigninDto dto,
  // ) async {
  //   final response = await safeApiCall(_apiClient.auth.sigininWIthEmail(dto));
  //   return (response: response.data, errorText: response.error);
  // }

  // Future<({SignupResponse? response, String? errorText})> varifySignupOtp(
  //   VarifyOtpDto dto,
  // ) async {
  //   final response = await safeApiCall(_apiClient.auth.varifySignupOtp(dto));

  //   return (response: response.data, errorText: response.error);
  // }

  // Future<({SignupResponse? response, String? errorText})> resetPassword(
  //   SignupEmailDto dto,
  // ) async {
  //   final response = await safeApiCall(_apiClient.auth.resetPassword(dto));

  //   return (response: response.data, errorText: response.error);
  // }

  // Future<({SignupResponse? response, String? errorText})> varifyForgotOtp(
  //   VarifyOtpDto dto,
  // ) async {
  //   final response = await safeApiCall(_apiClient.auth.varifyForgotOtp(dto));

  //   return (response: response.data, errorText: response.error);
  // }

  // Future<({String? errorText})> sendOtp(String email) async {
  //   final response = await safeApiCall(_apiClient.auth.sendOtp(email));
  //   return (errorText: response.error);
  // }

  // Future<({String? errorText})> sendForgotPsdOtp(String email) async {
  //   final response = await safeApiCall(_apiClient.auth.sendForgotPsdOtp(email));
  //   return (errorText: response.error);
  // }

  // Future<ApiResult<SignupResponse>> signIn(SignInDTO signInDTO) async {
  //   return safeApiCall(_apiClient.auth.signIn(signInDTO));
  // }
}
