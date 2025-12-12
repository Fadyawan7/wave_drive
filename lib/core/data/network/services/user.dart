part of '../api_service.dart';

@RestApi()
abstract class UserAPIService {
  factory UserAPIService(Dio dio, {String? baseUrl}) = _UserAPIService;

  @GET('/user/profile')
  Future<UserModel> getProfile();

    @PATCH('/user/update-profile')
  Future<UserModel> updateProfile(@Body() UpdateProfileDTO updateProfileDTO);



}
