// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_email_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupEmailDto _$SignupEmailDtoFromJson(Map<String, dynamic> json) =>
    SignupEmailDto(
      email: json['email'] as String,
      password: json['password'] as String,
      referralCode: json['referral_code'] as String?,
    );

Map<String, dynamic> _$SignupEmailDtoToJson(SignupEmailDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'referral_code': instance.referralCode,
    };
