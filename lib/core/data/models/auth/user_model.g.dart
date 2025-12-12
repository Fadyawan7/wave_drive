// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  user: json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>),
  token: json['token'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'user': instance.user,
  'token': instance.token,
};

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  email: json['email'] as String?,
  method: $enumDecode(_$LoginMethodEnumMap, json['method']),
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  name: json['name'] as String?,
  emailVerifiedAt: json['emailVerifiedAt'] == null
      ? null
      : DateTime.parse(json['emailVerifiedAt'] as String),
  lastLoginAt: json['lastLoginAt'] == null
      ? null
      : DateTime.parse(json['lastLoginAt'] as String),
  image: json['image'] as String?,
  uid: json['uid'] as String,
  referralCode: json['referralCode'] as String?,
  id: json['id'] as String,
  deviceId: (json['deviceId'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'email': instance.email,
  'name': instance.name,
  'emailVerifiedAt': instance.emailVerifiedAt?.toIso8601String(),
  'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
  'image': instance.image,
  'uid': instance.uid,
  'referralCode': instance.referralCode,
  'id': instance.id,
  'deviceId': instance.deviceId,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'method': _$LoginMethodEnumMap[instance.method]!,
};

const _$LoginMethodEnumMap = {
  LoginMethod.google: 'google',
  LoginMethod.apple: 'apple',
  LoginMethod.phone: 'phone',
};
