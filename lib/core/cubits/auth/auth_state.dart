part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    
    @Default(false) bool isLoggedIn,
    @Default(AppLoadState.initial) AppLoadState signInState,
    @Default(AppLoadState.initial) AppLoadState signInSocialState,
    @Default(AppLoadState.initial) AppLoadState completeProfileState,
    @Default(AppLoadState.initial) AppLoadState completeCreatePassword,
    @Default(AppLoadState.initial) AppLoadState deleteAccountState,

    int? statusCodeSignInWithPassword,
    @Default("") String errorMessage,
  }) = _AuthState;
}


