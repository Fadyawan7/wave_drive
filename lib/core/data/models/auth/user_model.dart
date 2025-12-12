import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wave_drive/core/shared/constants/enums.dart';
part 'user_model.g.dart';

@JsonSerializable()
class SignupResponse {
  final bool status;
  final String message;
  final Data? data;

  SignupResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}

@JsonSerializable()
class Data {
  final UserModel? user;
  final String? token;

  Data({
    this.user,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class UserModel {
  final String? email;
  final String? name;
  final DateTime? emailVerifiedAt;
  final DateTime? lastLoginAt;
  final String? image;
  final String uid;
  final String? referralCode;
  final String id;
  final int? deviceId;
  final String? firstName;
  final String? lastName;
  final LoginMethod method;

  UserModel({
    this.email,
    required this.method,
    this.firstName,
    this.lastName,
    this.name,
    this.emailVerifiedAt,
    this.lastLoginAt,
    this.image,
    required this.uid,
    this.referralCode,
    required this.id,
    this.deviceId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
