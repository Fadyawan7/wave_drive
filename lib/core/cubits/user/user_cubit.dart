import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:wave_drive/core/data/models/auth/user_model.dart';
import 'package:wave_drive/core/data/network/dio/helpers/api_helper.dart';
import 'package:wave_drive/core/data/network/dio/payment_info_dto.dart';
import 'package:wave_drive/core/data/network/dio/update_profile_dto.dart';
import 'package:wave_drive/core/data/network/dio/update_vehicle_info_dto.dart';
import 'package:wave_drive/core/data/repositories/user_repository.dart';
import 'package:wave_drive/core/services/firebase/firebase_auth_service.dart';
import 'package:wave_drive/core/shared/constants/constants.dart';
import 'package:wave_drive/core/shared/constants/enums.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/injector_setup.dart';

part 'user_cubit.freezed.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState());

  final _userRepository = injector<UserRepository>();
  final _firebaseAuth = injector<FirebaseAuthService>();

  UserModel? get currentUser => state.currentUser;

  Future<void> loadProfile() async {
    emit(state.copyWith(updateProfileState: AppLoadState.loading));

    final response = await _userRepository.getProfile();

    if (response is ApiError) {
      emit(
        state.copyWith(
          updateProfileState: AppLoadState.error,
          errorMessageUpdateProfile: response.error ?? "Something went wrong",
        ),
      );
      return;
    }

    emit(state.copyWith(updateProfileState: AppLoadState.success, currentUser: response.data));
  }

  void setCurrentUser(UserModel user) {
    emit(state.copyWith(currentUser: user));
  }

  Future<void> updateUserInfo({
    File? avatar,
    String? nickname,
    String? birthday,
    String? country,
    String? email,
    String? gender,
    String? bio,
    String? phone,
    //
    String? firstName,
    String? lastName,
    //
    String? idCard,
    String? language,
    String? referance,
  }) async {
    String birthdayConvert = "";
    if (birthday != null) {
      final inputFormat = DateFormat(appDateTimeFormat);
      final birthDayFormat = inputFormat.parse(birthday);

      final outputFormat = DateFormat(serverDateTimeFormat);
      birthdayConvert = outputFormat.format(birthDayFormat);
    }

    String? avatarUrl;
    if (avatar != null) {
      final uploadResponse = await _userRepository.uploadAvatar(avatar);
      _userRepository.uploadProgress.addListener(() {
        AppLogger.d("avatar upload progress is ${_userRepository.uploadProgress.value}");
      });

      avatarUrl = uploadResponse.data?.url;
    }

    if (email != null && email.isNotEmpty) {
      _firebaseAuth.updateInfo(email: email, name: nickname ?? "");
    }

    final result = await _userRepository.updateProfile(
      UpdateProfileDTO(
        firstName: firstName,
        lastName: lastName,
        picture: avatarUrl,
        name: nickname,
        birthDay: birthdayConvert.isNotEmpty ? birthdayConvert : null,
        country: country,
        email: email,
        gender: gender,
        biography: bio,
        phone: phone,
        language: language,
        nationalId: idCard,
        referralCode: referance,
      ),
    );

    if (result is ApiError) {
      AppLogger.e("updateInfoUser error: ${result.error}");
      emit(state.copyWith(updateProfileState: AppLoadState.error, errorMessageUpdateProfile: result.error!));
      return;
    }

    emit(state.copyWith(updateProfileState: AppLoadState.success, currentUser: result.data));
  }

  Future<void> updateVehicleInfo(UpdateVehicleDTO dto) async {
    final result = await _userRepository.updateVehicleInfo(dto);

    if (result is ApiError) {
      AppLogger.e("updateInfoUser error: ${result.error}");
      emit(state.copyWith(updateProfileState: AppLoadState.error, errorMessageUpdateProfile: result.error!));
      return;
    }

    emit(state.copyWith(updateProfileState: AppLoadState.success));
  }

  Future<void> uploadPaymentInfo(PaymentInfoDto dto) async {
    final result = await _userRepository.uploadPaymentInfo(dto);

    if (result is ApiError) {
      AppLogger.e("updateInfoUser error: ${result.error}");
      emit(state.copyWith(updateProfileState: AppLoadState.error, errorMessageUpdateProfile: result.error!));
      return;
    }

    emit(state.copyWith(updateProfileState: AppLoadState.success));
  }

  Future<void> uploadDucoments({
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
  }) async {
    final result = await _userRepository.uploadDucoments(
      taxiOperatingLicense: taxiOperatingLicense,
      roofLight: roofLight,
      vehicleInsuranceDocumentation: vehicleInsuranceDocumentation,
      profilePicture: profilePicture,
      driversLicense: driversLicense,
      driversLicenseNumber: driversLicenseNumber,
      taxiDrivingLicense: taxiDrivingLicense,
      companyRegistrationCertificate: companyRegistrationCertificate,
      bankStatement: bankStatement,
      documentExpires: documentExpires,
    );

    if (result is ApiError) {
      AppLogger.e("updateInfoUser error: ${result.error}");
      emit(state.copyWith(updateProfileState: AppLoadState.error, errorMessageUpdateProfile: result.error!));
      return;
    }

    emit(state.copyWith(updateProfileState: AppLoadState.success));
  }

  void updateCurrentUserField({
    String? email,
    String? firstName,
    String? lastName,
    String? nickname,
    String? country,
    String? phone,
    String? gender,
    String? bio,
    String? picture,
  }) {
    final current = state.currentUser;

    if (current == null) return;

    final updatedUser = current.copyWith(
      email: email ?? current.email,
      firstName: firstName ?? current.firstName,
      lastName: lastName ?? current.lastName,
      name: nickname ?? current.name,
      country: country ?? current.country,
    );

    emit(state.copyWith(currentUser: updatedUser, updateProfileState: AppLoadState.success));

    // If email changed, update Firebase
    if (email != null && email.isNotEmpty && email != current.email) {
      _firebaseAuth.updateInfo(email: email, name: updatedUser.name ?? "");
    }
  }
}
