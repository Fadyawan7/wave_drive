// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';


// part 'auth_cubit.freezed.dart';
// part 'auth_state.dart';

// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit() : super(const AuthState());

//   // final _authRepository = injector<AuthRepository>();
//   // final _dioProvider = injector<DioProvider>();



  

//   Future<String?> registerWithEmail(SignupEmailDto dto) async {
//     final result = await _authRepository.registerWithEmail(dto);
//     if (result.errorText != null) {
//       return result.errorText;
//     }
//     final data = result.response;
//     if (data == null || !data.status) {
//       AppLogger.e("Register error data empty");
//       return "Something went wrong connecting to our server. Please try again later!";
//     }
//     return null;
//   }

//   Future<({bool isSuccess, String? errorText})> sigininWIthEmail(
//     SigninDto dto,
//   ) async {
//     final result = await _authRepository.sigininWIthEmail(dto);
//     if (result.errorText != null) {
//       return (isSuccess: false, errorText: "${result.errorText}");
//     }
//     final data = result.response;
//     if (data == null || !data.status) {
//       AppLogger.e("Login error data empty");
//       return (isSuccess: false, errorText: "Token is empty");
//     }

//     SecureStorageHelper.setOAuthToken(accessToken: data.data!.token!);
//     _dioProvider.setHeaderToken(data.data!.token!);

//     // final user = data.data!.user;

//     // _userCubit.setCurrentUser(user!);

//     // emit(state.copyWith(isLoggedIn: true));

//     final profileResult = await _userRepository.getProfile();

//     if (profileResult is ApiError) {
//       AppLogger.e("Register error user empty");
//       return (
//         isSuccess: true,
//         errorText:
//             "Something went wrong connecting to our server. Please try again later!",
//       );
//     }

//     _userCubit.setCurrentUser(profileResult.data!.data!.user!);

//     emit(state.copyWith(isLoggedIn: true));
//     _profieCubit.setUser(profileResult.data!.data!.user!);

//     return (isSuccess: true, errorText: null);
//   }

//   Future<String?> varifySignupOtp(VarifyOtpDto dto) async {
//     final result = await _authRepository.varifySignupOtp(dto);
//     if (result.errorText != null) {
//       return result.errorText;
//     }
//     final response = result.response;
//     if (response == null ||
//         response.data == null ||
//         response.data?.token == null) {
//       AppLogger.e("Register error data empty");
//       return "Something went wrong connecting to our server. Please try again later!";
//     }

//     final accessToken = response.data!.token;

//     SecureStorageHelper.setOAuthToken(accessToken: accessToken!);
//     _dioProvider.setHeaderToken(accessToken);

//     final profileResult = await _userRepository.getProfile();

//     if (profileResult is ApiError) {
//       AppLogger.e("Register error user empty");
//       return "Something went wrong connecting to our server. Please try again later!";
//     }

//     _userCubit.setCurrentUser(profileResult.data!.data!.user!);

//     emit(state.copyWith(isLoggedIn: true));
//     _profieCubit.setUser(profileResult.data!.data!.user!);

//     return null;
//   }

//   Future<String?> resetPassword(SignupEmailDto dto) async {
//     final result = await _authRepository.resetPassword(dto);
//     if (result.errorText != null) {
//       return result.errorText;
//     }
//     final response = result.response;
//     if (response == null ||
//         response.data == null ||
//         response.data?.token == null) {
//       AppLogger.e("Register error data empty");
//       return "Something went wrong connecting to our server. Please try again later!";
//     }

//     final accessToken = response.data!.token;

//     SecureStorageHelper.setOAuthToken(accessToken: accessToken!);
//     _dioProvider.setHeaderToken(accessToken);

//     final profileResult = await _userRepository.getProfile();

//     if (profileResult is ApiError) {
//       AppLogger.e("Register error user empty");
//       return "Something went wrong connecting to our server. Please try again later!";
//     }

//     _userCubit.setCurrentUser(profileResult.data!.data!.user!);

//     emit(state.copyWith(isLoggedIn: true));
//     _profieCubit.setUser(profileResult.data!.data!.user!);

//     return null;
//   }

//   Future<String?> varifyForgotPsdOtp(VarifyOtpDto dto) async {
//     final result = await _authRepository.varifySignupOtp(dto);
//     if (result.errorText != null) {
//       return result.errorText;
//     }

//     return null;
//   }

//   Future<String?> sendOtp(String email) async {
//     final result = await _authRepository.sendOtp(email);
//     if (result.errorText != null) {
//       return result.errorText;
//     }

//     return null;
//   }

//   Future<String?> sendForgotPsdOtp(String email) async {
//     final result = await _authRepository.sendForgotPsdOtp(email);
//     if (result.errorText != null) {
//       return result.errorText;
//     }

//     return null;
//   }

//   Future<void> socialFirebaseLogin(SocialType type) async {
//     try {
//       SocialLoginResponse response;
//       switch (type) {
//         // case SocialType.facebook:
//         //   response = await _facebookAuthService.signIn();
//         case SocialType.google:
//           response = await _googleAuthService.signIn();

//         case SocialType.apple:
//           response = await _appleAuthService.signIn();
//         // case SocialType.twitter:
//         //   response = await _twitterAuthService.signIn();
//         default:
//           response = SocialLoginResponse(status: SocialLoginStatus.cancelled);
//       }

//       final status = response.status;
//       if (status == SocialLoginStatus.cancelled) {
//         // Do nothing when user cancelled
//         return;
//       }

//       if (status == SocialLoginStatus.failed) {
//         AppLogger.e('Auth provider error: ${type.name}');
//         emit(
//           state.copyWith(
//             signInSocialState: AppLoadState.error,
//             errorMessage:
//                 "Something went wrong connecting to our server. Please try again later!",
//           ),
//         );
//         return;
//       }

//       final userCredential = response.userCredential;
//       if (userCredential == null ||
//           userCredential.credential == null ||
//           userCredential.user == null) {
//         AppLogger.e('Firebase error: ${type.name}');
//         return;
//       }

//       await signIn(userCredential.user!.uid);
//     } catch (e, s) {
//       AppLogger.e('Social Login Error: $e', stackTrace: s);
//       emit(
//         state.copyWith(
//           signInSocialState: AppLoadState.error,
//           errorMessage: e.toString(),
//         ),
//       );
//       return;
//     }
//   }

//   Future<void> checkAuthenticate() async {
//     final accessToken = await SecureStorageHelper.getSavedAccessToken();
//     AppLogger.d("Access Token: $accessToken");
//     if (accessToken != null && accessToken.isNotEmpty) {
//       _dioProvider.setHeaderToken(accessToken);

//       final result = await _userRepository.getProfile();
//       if (result is ApiError) {
//         await _clearUserInStorage();
//         return;
//       }

//       final user = (result as ApiSuccess).data as SignupResponse;
//       //  final isCompletedProfile = isUserCompletedInfo(user);

//       //   if (isCompletedProfile) {
//       _userCubit.setCurrentUser(user.data!.user!);
//       emit(state.copyWith(isLoggedIn: true));
//       _profieCubit.setUser(user.data!.user!);

//       // } else {
//       //   await _clearUserInStorage();
//       // }
//     }
//   }

//   Future<void> signIn(String uid) async {
//     final result = await _authRepository.signIn(SignInDTO(uid: uid));
//     if (result is ApiError) {
//       emit(
//         state.copyWith(
//           signInSocialState: AppLoadState.error,
//           errorMessage:
//               result.error ??
//               "Something went wrong connecting to our server. Please try again later!",
//         ),
//       );
//       AppLogger.e("signIn error: ${result.error}");
//       return;
//     }

//     final signInResponse = (result as ApiSuccess).data as SignupResponse;
//     if (signInResponse.data == null || signInResponse.data?.token == null) {
//       AppLogger.e("signIn error: Token or user is null");
//       emit(
//         state.copyWith(
//           signInSocialState: AppLoadState.error,
//           errorMessage: "Access token empty",
//         ),
//       );
//       return;
//     }

//     SecureStorageHelper.setOAuthToken(accessToken: signInResponse.data!.token!);
//     SecureStorageHelper.setUserUid(uid: signInResponse.data!.user!.uid.toString());
//     _dioProvider.setHeaderToken(signInResponse.data!.token!);



//     final response = await _userRepository.getProfile();
//     if (response is ApiSuccess) {
//       final user = response.data!.data!.user;
//       _userCubit.setCurrentUser(user!);

//       _profieCubit.setUser(user);
//     } else {
//       AppLogger.e("signIn error: User null");
//       emit(state.copyWith(signInSocialState: AppLoadState.error));
//       return;
//     }

//     emit(
//       state.copyWith(isLoggedIn: true, signInSocialState: AppLoadState.success),
//     );
//   }


//   Future<void> logOut() async {
//     _updateDeviceToken(isRemoved: true);

//     await _firebaseAuthService.signOut();
//     await _clearUserInStorage();
//     emit(state.copyWith(isLoggedIn: false));
//   }


//   Future<void> _clearUserInStorage() async {
//     _dioProvider.removeHeaderToken();
//     SecureStorageHelper.clearOAuthToken();
//   }


//   Future<void> _updateDeviceToken({bool isRemoved = false}) async {
//     // final notificationService = injector<FirebaseNotificationService>();

//     // if (isRemoved) {
//     //   _userRepository.updateProfile(
//     //     UpdateProfileDTO(pushNotificationToken: ''),
//     //   );
//     //   notificationService.deleteFCMToken();
//     //   return;
//     // }

//     // final notificationToken = await notificationService.getFCMToken();
//     // if (notificationToken != null &&
//     //     _userCubit.state.currentUser?.pushNotificationToken !=
//     //         notificationToken) {
//     //   _userRepository.updateProfile(
//     //     UpdateProfileDTO(pushNotificationToken: notificationToken),
//     //   );
//     // }
//   }


//   Future<void> deleteAccount() async {
//     _updateDeviceToken(isRemoved: true);

//     await _firebaseAuthService.signOut();

//     final codeRid = _userCubit.currentUser!.id;

//    // await _deactivateAccount(DeactivateUserModel(code: codeRid));
//     await _clearUserInStorage();

//     emit(state.copyWith(isLoggedIn: false));
//   }

// }
