// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sigin_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigninDto _$SigninDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SigninDto', json, ($checkedConvert) {
      final val = SigninDto(
        email: $checkedConvert('email', (v) => v as String),
        password: $checkedConvert('password', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$SigninDtoToJson(SigninDto instance) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
};
