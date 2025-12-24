import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wave_drive/core/cubits/user/user_cubit.dart';
import 'package:wave_drive/core/data/local/secure_storage_helper.dart';
import 'package:wave_drive/core/data/models/auth/siginin_dto.dart';
import 'package:wave_drive/core/data/models/auth/sign_in_response.dart';
import 'package:wave_drive/core/data/models/auth/user_model.dart';
import 'package:wave_drive/core/data/network/dio/dio_providers.dart';
import 'package:wave_drive/core/data/network/dio/helpers/api_helper.dart';
import 'package:wave_drive/core/data/repositories/auth_repository.dart';
import 'package:wave_drive/core/data/repositories/user_repository.dart';
import 'package:wave_drive/core/services/firebase/authenticate/apple_auth_service.dart';
import 'package:wave_drive/core/services/firebase/authenticate/google_auth_service.dart';
import 'package:wave_drive/core/services/firebase/consts.dart';
import 'package:wave_drive/core/services/firebase/firebase_auth_service.dart';
import 'package:wave_drive/core/services/socketIo/socket_service.dart';

import 'package:wave_drive/core/shared/constants/enums.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/core/shared/utils/check_user_completed_info.dart';
import 'package:wave_drive/injector_setup.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());
  final _googleAuthService = injector<GoogleAuthService>();
  final _appleAuthService = injector<AppleAuthService>();
  final _authRepository = injector<AuthRepository>();
  final _dioProvider = injector<DioProvider>();
  final _firebaseAuthService = injector<FirebaseAuthService>();

  final _userRepository = injector<UserRepository>();
  final _userCubit = injector<UserCubit>();
  final _socketService = injector<SocketService>();

  Future<void> socialFirebaseLogin(SocialType type) async {
    try {
      SocialLoginResponse response;
      switch (type) {
        case SocialType.google:
          response = await _googleAuthService.signIn();

        case SocialType.apple:
          response = await _appleAuthService.signIn();

        default:
          response = SocialLoginResponse(status: SocialLoginStatus.cancelled);
      }

      final status = response.status;
      if (status == SocialLoginStatus.cancelled) {
        return;
      }

      if (status == SocialLoginStatus.failed) {
        AppLogger.e('Auth provider error: ${type.name}');
        emit(
          state.copyWith(
            signInSocialState: AppLoadState.error,
            errorMessage:
                "Something went wrong connecting to our server. Please try again later!",
          ),
        );
        return;
      }

      final userCredential = response.userCredential;
      if (userCredential == null ||
          userCredential.credential == null ||
          userCredential.user == null) {
        AppLogger.e('Firebase error: ${type.name}');
        return;
      }

      //   await signIn(userCredential.user!.uid, "User", type.name);
    } catch (e, s) {
      AppLogger.e('Social Login Error: $e', stackTrace: s);
      emit(
        state.copyWith(
          signInSocialState: AppLoadState.error,
          errorMessage: e.toString(),
        ),
      );
      return;
    }
  }

  Future<void> register(SignInDTO dto) async {
    final result = await _authRepository.register(dto);
    if (result is ApiError) {
      emit(
        state.copyWith(
          signInSocialState: AppLoadState.error,
          errorMessage:
              result.error ??
              "Something went wrong connecting to our server. Please try again later!",
        ),
      );
      AppLogger.e("signIn error: ${result.error}");
      return;
    }
  }

  Future<void> signIn(String uid) async {
    final result = await _authRepository.signIn(uid);
    if (result is ApiError) {
      emit(
        state.copyWith(
          signInSocialState: AppLoadState.error,
          errorMessage:
              result.error ??
              "Something went wrong connecting to our server. Please try again later!",
        ),
      );
      AppLogger.e("signIn error: ${result.error}");
      return;
    }

    final signInResponse = (result as ApiSuccess).data as SignInResponse;
    if (signInResponse.accessToken == null || signInResponse.user == null) {
      AppLogger.e("signIn error: Token or user is null");
      emit(
        state.copyWith(
          signInSocialState: AppLoadState.error,
          errorMessage: "Access token empty",
        ),
      );
      return;
    }

    SecureStorageHelper.setOAuthToken(accessToken: signInResponse.accessToken!);

    _dioProvider.setHeaderToken(signInResponse.accessToken!);

    _configSocketIo(signInResponse.accessToken!);

    final response = await _userRepository.getProfile();
    if (response is ApiSuccess) {
      final user = response.data!;
      _userCubit.setCurrentUser(user);
    } else {
      AppLogger.e("signIn error: User null");
      emit(state.copyWith(signInSocialState: AppLoadState.error));
      return;
    }

    emit(
      state.copyWith(isLoggedIn: true, signInSocialState: AppLoadState.success),
    );
  }

  Future<void> checkAuthenticate() async {
    final accessToken = await SecureStorageHelper.getSavedAccessToken();
    AppLogger.d("Access Token: $accessToken");
    if (accessToken != null && accessToken.isNotEmpty) {
      _dioProvider.setHeaderToken(accessToken);

      _configSocketIo(accessToken);

      final result = await _userRepository.getProfile();
      if (result is ApiError) {
        await _clearUserInStorage();
        return;
      }

      final user = (result as ApiSuccess).data as UserModel;
      final isCompletedProfile = isUserCompletedFullInfo(user);

      if (isCompletedProfile) {
        _userCubit.setCurrentUser(user);
        emit(state.copyWith(isLoggedIn: true));
      } else {
        await _clearUserInStorage();
      }
    }
  }

  Future<void> logOut() async {
    _updateDeviceToken(isRemoved: true);

    await _firebaseAuthService.signOut();
    await _clearUserInStorage();
    emit(state.copyWith(isLoggedIn: false));
  }

  Future<void> _updateDeviceToken({bool isRemoved = false}) async {
    // final notificationService = injector<FirebaseNotificationService>();

    // if (isRemoved) {
    //   _userRepository.updateProfile(
    //     UpdateProfileDTO(pushNotificationToken: ''),
    //   );
    //   notificationService.deleteFCMToken();
    //   return;
    // }

    // final notificationToken = await notificationService.getFCMToken();
    // if (notificationToken != null &&
    //     _userCubit.state.currentUser?.pushNotificationToken !=
    //         notificationToken) {
    //   _userRepository.updateProfile(
    //     UpdateProfileDTO(pushNotificationToken: notificationToken),
    //   );
    // }
  }

  Future<void> _clearUserInStorage() async {
    _dioProvider.removeHeaderToken();
    SecureStorageHelper.clearOAuthToken();
  }

  Future<({bool isSuccess, String? errorText})> sendEmailOtp(
    String email,
  ) async {
    final response = await _authRepository.sendEmailOtp(email);

    if (response is ApiError) {
      AppLogger.e("phone number bind failed: ${response.error}");
      return (isSuccess: false, errorText: "${response.error}");
    }
    emit(state.copyWith(email: email));

    return (isSuccess: true, errorText: null);
  }

  Future<void> varifyEmailOtp(String otp) async {
    final result = await _authRepository.varifyEmailOtp(otp, state.email!);
    if (result is ApiError) {
      emit(
        state.copyWith(
          signInSocialState: AppLoadState.error,
          errorMessage:
              result.error ??
              "Something went wrong connecting to our server. Please try again later!",
        ),
      );
      AppLogger.e("signIn error: ${result.error}");
      return;
    }

    final signInResponse = (result as ApiSuccess).data as SignInResponse;
    if (signInResponse.accessToken == null || signInResponse.user == null) {
      AppLogger.e("signIn error: Token or user is null");
      emit(
        state.copyWith(
          signInSocialState: AppLoadState.error,
          errorMessage: "Access token empty",
        ),
      );
      return;
    }

    SecureStorageHelper.setOAuthToken(accessToken: signInResponse.accessToken!);

    _dioProvider.setHeaderToken(signInResponse.accessToken!);
    _configSocketIo(signInResponse.accessToken!);

    final response = await _userRepository.getProfile();
    if (response is ApiSuccess) {
      final user = response.data!;
      _userCubit.setCurrentUser(user);
    } else {
      AppLogger.e("signIn error: User null");
      emit(state.copyWith(signInSocialState: AppLoadState.error));
      return;
    }

    emit(
      state.copyWith(isLoggedIn: true, signInSocialState: AppLoadState.success),
    );
  }

  Future<({bool isExist, String? errorText})> checkEmailExist(
    String email,
  ) async {
    final response = await _authRepository.checkEmailExist(email);

    if ((response is ApiSuccess) && (response.data?.exist ?? false)) {
      return (isExist: true, errorText: null);
    }

    return (isExist: false, errorText: "${response.error}");
  }

  Future<({bool isExist, String? errorText})> checkPhoneNumberExist(
    String phone,
  ) async {
    final response = await _authRepository.checkPhoneNumberExist(phone);

    if (response is ApiSuccess && (response.data?.exist ?? false)) {
      return (isExist: true, errorText: null);
    }

    return (isExist: false, errorText: "${response.error}");
  }

  void _configSocketIo(String accessToken) {
    _socketService.setHeaderToken(accessToken);
    _socketService.connect();
  }
}
