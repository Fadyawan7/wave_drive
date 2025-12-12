class SignInDTO {
  String uid;
  String type;
  String method;
  String email;
  String city;
  String country;
  // String deviceId; //Firebase FID

  SignInDTO({
    required this.uid,
    required this.type,
    required this.method,
    required this.email,
    required this.city,
    required this.country,
    // required this.deviceId,
  });

  factory SignInDTO.fromJson(Map<String, dynamic> json) => SignInDTO(
        uid: json["uid"]! as String,
        email: json["email"]! as String,
        city: json["city"]! as String,
        country: json["country"]! as String,
        type: json["type"]! as String,
        method: json["method"]! as String,
        // deviceId: json["deviceId"]! as String,
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "type": type,
        "method": method,
        "email": email,
        "city": city,
        "country": country,
        // "deviceId": deviceId,
      };
}
