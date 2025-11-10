class SignInDTO {
  String uid;

  SignInDTO({
    required this.uid,
  });

  factory SignInDTO.fromJson(Map<String, dynamic> json) => SignInDTO(
        uid: json["uid"]! as String,
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
       
      };
}
