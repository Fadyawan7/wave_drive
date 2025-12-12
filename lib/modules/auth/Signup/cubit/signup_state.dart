part of 'signup_cubit.dart';


@freezed

abstract class SignupState   with _$SignupState {
  factory SignupState({
    String? email,
    String? country,
    String? city,
    
    String? uid,
    String? varificationId,
    String? phoneNumber,
    String? countryConde,
    SignUpPhoneDTO? signUpDTO,
  }) = _SignupState;
   
  
}