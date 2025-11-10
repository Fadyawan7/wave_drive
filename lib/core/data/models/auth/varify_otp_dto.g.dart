// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'varify_otp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VarifyOtpDto _$VarifyOtpDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('VarifyOtpDto', json, ($checkedConvert) {
      final val = VarifyOtpDto(
        email: $checkedConvert('email', (v) => v as String),
        otp: $checkedConvert('otp_code', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'otp': 'otp_code'});

Map<String, dynamic> _$VarifyOtpDtoToJson(VarifyOtpDto instance) =>
    <String, dynamic>{'email': instance.email, 'otp_code': instance.otp};
