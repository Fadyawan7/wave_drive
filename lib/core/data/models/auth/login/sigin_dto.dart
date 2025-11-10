import 'package:json_annotation/json_annotation.dart';
  part 'sigin_dto.g.dart';          
  
@JsonSerializable()
class SigninDto {
  final String email;
  final String password;


  const SigninDto({
    required this.email,
    required this.password,
  });

  factory SigninDto.fromJson(Map<String, dynamic> json) =>
      _$SigninDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SigninDtoToJson(this);
}
