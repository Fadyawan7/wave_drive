import 'package:freezed_annotation/freezed_annotation.dart';
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
    final User? user;
    final String? token;

    Data({
        this.user,
        this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);


}

@JsonSerializable()
class User {
    final String? email;
    final String? name;
    final DateTime? emailVerifiedAt;
    final DateTime? lastLoginAt;
    final String? picture;
    final int uid;
    final String? referralCode;
    final int id;
    final int? deviceId;

    User({
        this.email,
        this.name,
        this.emailVerifiedAt,
        this.lastLoginAt,
        this.picture,
        required this.uid,
        this.referralCode,
        required this.id,
        this.deviceId,
    });

      factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}
