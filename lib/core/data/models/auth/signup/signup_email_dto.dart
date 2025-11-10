import 'package:json_annotation/json_annotation.dart';
part 'signup_email_dto.g.dart';

@JsonSerializable()
class SignupEmailDto {
  final String email;
  final String password;

  @JsonKey(name: "referral_code")
  final String? referralCode;

  const SignupEmailDto({
    required this.email,
    required this.password,
     this.referralCode,
  });

  factory SignupEmailDto.fromJson(Map<String, dynamic> json) =>
      _$SignupEmailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignupEmailDtoToJson(this);
}
