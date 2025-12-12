part of '../api_service.dart';

@RestApi()
abstract class AuthAPIService {
  factory AuthAPIService(Dio dio, {String? baseUrl}) = _AuthAPIService;

  @POST('/driver/auth')
  Future<SignInResponse> signIn(@Body() SignInDTO signInDto);

  


}
