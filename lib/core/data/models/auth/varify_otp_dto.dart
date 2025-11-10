import 'package:json_annotation/json_annotation.dart';
part 'varify_otp_dto.g.dart';     
@JsonSerializable()
class VarifyOtpDto {
  final String email;
 

  @JsonKey(name: "otp_code")
  final String? otp;

  const VarifyOtpDto({
    required this.email,
   
    required this.otp,
  });

  factory VarifyOtpDto.fromJson(Map<String, dynamic> json) =>
      _$VarifyOtpDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VarifyOtpDtoToJson(this);
}
