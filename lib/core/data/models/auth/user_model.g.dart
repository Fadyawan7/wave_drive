// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SignupResponse', json, ($checkedConvert) {
      final val = SignupResponse(
        status: $checkedConvert('status', (v) => v as bool),
        message: $checkedConvert('message', (v) => v as String),
        data: $checkedConvert(
          'data',
          (v) => v == null ? null : Data.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Data', json, ($checkedConvert) {
      final val = Data(
        user: $checkedConvert(
          'user',
          (v) => v == null ? null : User.fromJson(v as Map<String, dynamic>),
        ),
        token: $checkedConvert('token', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'user': instance.user?.toJson(),
  'token': instance.token,
};

User _$UserFromJson(Map<String, dynamic> json) =>
    $checkedCreate('User', json, ($checkedConvert) {
      final val = User(
        email: $checkedConvert('email', (v) => v as String?),
        name: $checkedConvert('name', (v) => v as String?),
        emailVerifiedAt: $checkedConvert(
          'emailVerifiedAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        lastLoginAt: $checkedConvert(
          'lastLoginAt',
          (v) => v == null ? null : DateTime.parse(v as String),
        ),
        picture: $checkedConvert('picture', (v) => v as String?),
        uid: $checkedConvert('uid', (v) => (v as num).toInt()),
        referralCode: $checkedConvert('referralCode', (v) => v as String?),
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        deviceId: $checkedConvert('deviceId', (v) => (v as num?)?.toInt()),
      );
      return val;
    });

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'email': instance.email,
  'name': instance.name,
  'emailVerifiedAt': instance.emailVerifiedAt?.toIso8601String(),
  'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
  'picture': instance.picture,
  'uid': instance.uid,
  'referralCode': instance.referralCode,
  'id': instance.id,
  'deviceId': instance.deviceId,
};
