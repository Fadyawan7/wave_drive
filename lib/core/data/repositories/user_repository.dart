import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:wave_drive/core/data/models/auth/user_model.dart';
import 'package:wave_drive/core/data/network/api_service.dart';
import 'package:wave_drive/core/data/network/dio/helpers/api_helper.dart';
import 'package:wave_drive/core/data/network/dio/helpers/safe_api_call.dart';
import 'package:wave_drive/core/data/network/dio/update_profile_dto.dart';
import 'package:wave_drive/core/data/network/dio/upload/upload_image_response.dart';
import 'package:wave_drive/injector_setup.dart';

class UserRepository {
  final _apiClient = injector.get<ApiService>();


   

  final ValueNotifier<double> uploadProgress = ValueNotifier(0.0);

  Future<ApiResult<UserModel>> getProfile() {
    return safeApiCall(_apiClient.user.getProfile());
  }

  Future<ApiResult<UploadImageResponse>> uploadAvatar(File file) async {
    return safeApiCall(
      _apiClient.image.uploadImage(file, (int sent, int total) {
        if (total > 0) {
          uploadProgress.value = sent / total;
        }
      }),
    );
  }

  Future<ApiResult<UserModel>> updateProfile(
    UpdateProfileDTO updateProfileDTO,
  ) {
    return safeApiCall(_apiClient.user.updateProfile(updateProfileDTO));
  }

 
}
