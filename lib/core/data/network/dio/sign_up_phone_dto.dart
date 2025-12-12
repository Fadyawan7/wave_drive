// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignUpPhoneDTO {
  SignUpPhoneDTO({
    required this.password,
    required this.phone,
    required this.deviceId,
    required this.uid,
  });
  String phone;
  String password;
  String deviceId;
  String uid;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      'password': password,
      'deviceId': deviceId,
      'uid': uid,
    };
  }

  factory SignUpPhoneDTO.fromMap(Map<String, dynamic> map) {
    return SignUpPhoneDTO(
      phone: map['phone'] as String,
      password: map['password'] as String,
      deviceId: map['deviceId'] as String,
      uid: map['uid'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "password": password,
        "deviceId": deviceId,
        "uid": uid,
      };

  factory SignUpPhoneDTO.fromJson(String source) =>
      SignUpPhoneDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
