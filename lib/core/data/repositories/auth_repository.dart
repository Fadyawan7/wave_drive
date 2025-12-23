import 'package:wave_drive/core/data/models/auth/siginin_dto.dart';
import 'package:wave_drive/core/data/models/auth/sign_in_response.dart';
import 'package:wave_drive/core/data/models/user/check_phone_number_exist.dart';
import 'package:wave_drive/core/data/network/api_service.dart';
import 'package:wave_drive/core/data/network/dio/helpers/api_helper.dart';
import 'package:wave_drive/core/data/network/dio/helpers/safe_api_call.dart';
import 'package:wave_drive/injector_setup.dart';

class AuthRepository {
  final _apiClient = injector.get<ApiService>();

  Future<ApiResult<dynamic>> register(SignInDTO signInDTO) {
    return safeApiCall(_apiClient.auth.register(signInDTO));
  }

  Future<ApiResult<SignInResponse>> signIn(String uid) {
    return safeApiCall(_apiClient.auth.signIn(uid));
  }

  Future<ApiResult<CheckExistResponse>> checkEmailExist(String email)  {
    return safeApiCall(_apiClient.auth.checkEmailExist(email));
    
  }



  Future<ApiResult<CheckExistResponse>> checkPhoneNumberExist(String phone)  {
    return safeApiCall(
      _apiClient.auth.checkPhoneNumberExist(phone),
    );
  }


  Future<ApiResult<dynamic>> sendEmailOtp(String email)  {
    return safeApiCall(_apiClient.auth.sendEmailOtp(email));
  }


  Future<ApiResult<SignInResponse>> varifyEmailOtp(String otp,String email)  {
    return safeApiCall(_apiClient.auth.varifyEmailOtp(email, otp));
  }




}
