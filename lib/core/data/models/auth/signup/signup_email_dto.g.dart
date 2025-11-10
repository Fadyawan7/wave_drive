// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_email_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupEmailDto _$SignupEmailDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SignupEmailDto', json, ($checkedConvert) {
      final val = SignupEmailDto(
        email: $checkedConvert('email', (v) => v as String),
        password: $checkedConvert('password', (v) => v as String),
        referralCode: $checkedConvert('referral_code', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'referralCode': 'referral_code'});

Map<String, dynamic> _$SignupEmailDtoToJson(SignupEmailDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'referral_code': instance.referralCode,
    };
