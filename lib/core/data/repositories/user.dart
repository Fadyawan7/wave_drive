
import 'package:wave_drive/core/data/network/api_service.dart';
import 'package:wave_drive/injector_setup.dart';


class UserRepository {
  final _apiClient = injector.get<ApiService>();

  // Future<ApiResult<SignupResponse>> getProfile() {
  //   return safeApiCall(_apiClient.user.getProfile());
  // }


}