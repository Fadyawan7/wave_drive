class SignInDTO {
  String uid;
    String phone;
      String email;
        String method;



  String city;
  String country;
  // String deviceId; //Firebase FID

  SignInDTO({
    required this.uid,
    required this.phone,
    required this.method,
    required this.email,
    required this.city,
    required this.country,
    // required this.deviceId,
  });

  factory SignInDTO.fromJson(Map<String, dynamic> json) => SignInDTO(
        uid: json["uid"]! as String,
        phone: json["phone"]! as String,
        email: json["email"]! as String,
        city: json["city"]! as String,
        country: json["country"]! as String,
        method: json["method"]! as String,
        // deviceId: json["deviceId"]! as String,
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "phone": phone,
        "method": method,
        "email": email,
        "city": city,
        "country": country,
        // "deviceId": deviceId,
      };
}
