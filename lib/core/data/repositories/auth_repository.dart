


import 'package:wave_drive/core/data/models/auth/siginin_dto.dart';
import 'package:wave_drive/core/data/models/auth/sign_in_response.dart';
import 'package:wave_drive/core/data/network/api_service.dart';
import 'package:wave_drive/core/data/network/dio/helpers/api_helper.dart';
import 'package:wave_drive/core/data/network/dio/helpers/safe_api_call.dart';
import 'package:wave_drive/injector_setup.dart';

class AuthRepository {
  final _apiClient = injector.get<ApiService>();



  Future<ApiResult<SignInResponse>> signIn(SignInDTO signInDTO) async {
    return safeApiCall(_apiClient.auth.signIn(signInDTO));
  }
}
