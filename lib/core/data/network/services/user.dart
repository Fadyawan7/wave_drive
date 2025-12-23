part of '../api_service.dart';

@RestApi()
abstract class UserAPIService {
  factory UserAPIService(Dio dio, {String? baseUrl}) = _UserAPIService;

  @GET('/user/profile')
  Future<UserModel> getProfile();

  @PATCH('/user/profile')
  Future<UserModel> updateProfile(@Body() UpdateProfileDTO updateProfileDTO);

  @POST('/user/vehicle')
  Future<HttpResponse> updateVehicleInfo(
    @Body() UpdateVehicleDTO updateProfileDTO,
  );

  @POST('/user/documents')
  Future<HttpResponse> uploadDucoments(
    @Part(name: 'taxiOperatingLicense') File taxiOperatingLicense,
    @Part(name: 'roofLight') File roofLight,
    @Part(name: 'vehicleInsuranceDocumentation')
    File vehicleInsuranceDocumentation,
    @Part(name: 'profilePicture') File profilePicture,
    @Part(name: 'driversLicense') File driversLicense,
    @Part(name: 'driversLicenseNumber') String driversLicenseNumber,
    @Part(name: 'taxiDrivingLicense') File taxiDrivingLicense,
    @Part(name: 'companyRegistrationCertificate')
    File companyRegistrationCertificate,
    @Part(name: 'bankStatement') File bankStatement,
    @Part(name: 'documentExpires') String documentExpires,
  );

  @POST('/user/payment')
  Future<HttpResponse> uploadPaymentInfo(@Body() PaymentInfoDto dto);
  






}
