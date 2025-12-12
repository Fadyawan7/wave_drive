import 'package:json_annotation/json_annotation.dart';
import 'package:wave_drive/core/data/models/auth/user_model.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse {
  String? accessToken;
    UserModel? user;

  

  SignInResponse({this.accessToken,this.user});

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);

   SignInResponse copyWith({String? accessToken, UserModel? user}) {
    return SignInResponse(
      accessToken: accessToken ?? this.accessToken,
      user: user ?? this.user,
    );
  }
}
