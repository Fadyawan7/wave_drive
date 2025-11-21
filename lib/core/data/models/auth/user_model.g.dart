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
      : User.fromJson(json['user'] as Map<String, dynamic>),
  token: json['token'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'user': instance.user,
  'token': instance.token,
};

User _$UserFromJson(Map<String, dynamic> json) => User(
  email: json['email'] as String?,
  name: json['name'] as String?,
  emailVerifiedAt: json['emailVerifiedAt'] == null
      ? null
      : DateTime.parse(json['emailVerifiedAt'] as String),
  lastLoginAt: json['lastLoginAt'] == null
      ? null
      : DateTime.parse(json['lastLoginAt'] as String),
  picture: json['picture'] as String?,
  uid: (json['uid'] as num).toInt(),
  referralCode: json['referralCode'] as String?,
  id: (json['id'] as num).toInt(),
  deviceId: (json['deviceId'] as num?)?.toInt(),
);

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
