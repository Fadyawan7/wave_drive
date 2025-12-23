part of 'signin_cubit.dart';

@freezed
abstract class SigninState with _$SigninState {
  const factory SigninState({
        @Default(SigninStep.login) SigninStep step,


       String? uid,
    String? varificationId,
    String? phoneNumber
    ,
    
    String? countryConde,
    SignUpPhoneDTO? signUpDTO,
  }) = _AppState;
}
