import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:wave_drive/core/data/models/auth/user_model.dart';
import 'package:wave_drive/core/data/models/earning/earning_model.dart';
import 'package:wave_drive/core/data/network/api_service.dart';
import 'package:wave_drive/core/data/network/dio/helpers/api_helper.dart';
import 'package:wave_drive/core/data/network/dio/helpers/safe_api_call.dart';
import 'package:wave_drive/core/data/network/dio/payment_info_dto.dart';
import 'package:wave_drive/core/data/network/dio/update_profile_dto.dart';
import 'package:wave_drive/core/data/network/dio/update_vehicle_info_dto.dart';
import 'package:wave_drive/core/data/network/dio/upload/upload_image_response.dart';
import 'package:wave_drive/injector_setup.dart';

class UserRepository {
  final _apiClient = injector.get<ApiService>();

  final ValueNotifier<double> uploadProgress = ValueNotifier(0.0);

  Future<ApiResult<UserModel>> getProfile() {
    return safeApiCall(_apiClient.user.getProfile());
  }

  Future<ApiResult<UploadImageResponse>> uploadAvatar(File file) {
    return safeApiCall(
      _apiClient.image.uploadFile(file, (int sent, int total) {
        if (total > 0) {
          uploadProgress.value = sent / total;
        }
      }),
    );
  }

  Future<ApiResult<UserModel>> updateProfile(UpdateProfileDTO updateProfileDTO) {
    return safeApiCall(_apiClient.user.updateProfile(updateProfileDTO));
  }

  Future<ApiResult<dynamic>> updateVehicleInfo(UpdateVehicleDTO updateProfileDTO) {
    return safeApiCall(_apiClient.user.updateVehicleInfo(updateProfileDTO));
  }

  Future<ApiResult<dynamic>> uploadPaymentInfo(PaymentInfoDto dto) {
    return safeApiCall(_apiClient.user.uploadPaymentInfo(dto));
  }

  Future<ApiResult<dynamic>> uploadDucoments({
    required File taxiOperatingLicense,
    required File roofLight,
    required File vehicleInsuranceDocumentation,
    required File profilePicture,
    required File driversLicense,
    required String driversLicenseNumber,
    required File taxiDrivingLicense,
    required File companyRegistrationCertificate,
    required File bankStatement,
    required String documentExpires,
  }) {
    return safeApiCall(
      _apiClient.user.uploadDucoments(
        taxiOperatingLicense,
        roofLight,
        vehicleInsuranceDocumentation,
        profilePicture,

        driversLicense,
        driversLicenseNumber,
        taxiDrivingLicense,
        companyRegistrationCertificate,
        bankStatement,
        documentExpires,
      ),
    );
  }

  Future<ApiResult<UploadImageResponse>> uploadFile(File file) {
    return safeApiCall(
      _apiClient.image.uploadFile(file, (int sent, int total) {
        if (total > 0) {
          uploadProgress.value = sent / total;
        }
      }),
    );
  }

  Future<ApiResult<EarningModelResponse>> getEarning(String pariod) {
    return safeApiCall(_apiClient.user.getEarning(pariod));
  }

  Future<List<String>> getCategory() async {
    final response = await safeApiCall(_apiClient.user.getCategory());
    return response.data ?? [];
  }
}
