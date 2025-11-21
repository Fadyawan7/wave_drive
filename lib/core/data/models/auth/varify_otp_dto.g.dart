// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'varify_otp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VarifyOtpDto _$VarifyOtpDtoFromJson(Map<String, dynamic> json) => VarifyOtpDto(
  email: json['email'] as String,
  otp: json['otp_code'] as String?,
);

Map<String, dynamic> _$VarifyOtpDtoToJson(VarifyOtpDto instance) =>
    <String, dynamic>{'email': instance.email, 'otp_code': instance.otp};
