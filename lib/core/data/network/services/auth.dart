part of '../api_service.dart';

@RestApi()
abstract class AuthAPIService {
  factory AuthAPIService(Dio dio, {String? baseUrl}) = _AuthAPIService;

  @POST('/register')
  Future<HttpResponse> register(@Body() SignInDTO signInDto);

  @POST('/signin')
  Future<SignInResponse> signIn(@Field() String uid);

  @POST('/auth/is-phone-exist')
  Future<CheckExistResponse> checkPhoneNumberExist(@Field() String phone);

  @POST('/auth/is-email-exist')
  Future<CheckExistResponse> checkEmailExist(@Field() String email);

  @POST('/auth/send-email-otp')
  Future<HttpResponse> sendEmailOtp(@Field('email') String email);

  @POST('/auth/varify-email-otp')
  Future<SignInResponse> varifyEmailOtp(
    @Field('otp') String otp,

    @Field('email') String email,
  );
}
