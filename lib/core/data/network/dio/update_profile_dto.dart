class UpdateProfileDTO {
  String? picture;
  String? coverImage;
  String? name;
  String? birthDay;
  String? country;
  String? phone;
  double? longitude;
  double? latitude;
  String? email;
  String? gender;
  String? biography;
  String? frame;
  String? password;
  String? pushNotificationToken;
  String? firebaseUid;
  String? roomTitle;
  //
  String? firstName;
  String? lastName;

  UpdateProfileDTO({
        this.firstName,
        this.lastName,

    //
    this.picture,
    this.roomTitle,
    this.name,
    this.birthDay,
    this.country,
    this.phone,
    this.longitude,
    this.latitude,
    this.email,
    this.gender,
    this.biography,
    this.frame,
    this.password,
    this.pushNotificationToken,
    this.firebaseUid,
    this.coverImage,
  });

  factory UpdateProfileDTO.fromJson(Map<String, dynamic> json) =>
      UpdateProfileDTO(
        picture: json["picture"] as String,
        roomTitle: json["roomTitle"] as String,
        coverImage: json["coverImage"] as String,
        name: json["name"] as String,
        birthDay: json["birthDay"] as String,
        country: json["country"] as String,
        phone: json["phone"] as String,
        longitude: (json["longitude"] ?? 0) as double,
        latitude: (json["latitude"] ?? 0) as double,
        email: json["email"] as String,
        gender: json["gender"] as String,
        biography: json["biography"] as String,
        frame: json["frame"] as String,
        password: json["password"] as String,
        pushNotificationToken: json["pushNotificationToken"] as String?,
        firebaseUid: json["firebaseUid"] as String?,
        //
                firstName: json["firstName"] as String,
        lastName: json["lastName"] as String,


      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (firstName != null) data["firstName"] = firstName;
    if (lastName != null) data["lastName"] = lastName;
    //
    if (picture != null) data["picture"] = picture;
    if (roomTitle != null) data["roomTitle"] = roomTitle;
    if (coverImage != null) data["coverImage"] = coverImage;
    if (name != null) data["name"] = name;
    if (birthDay != null) data["birthDay"] = birthDay;
    if (country != null) data["country"] = country;
    if (phone != null) data["phone"] = phone;
    if (longitude != null) data["longitude"] = longitude;
    if (latitude != null) data["latitude"] = latitude;
    if (email != null) data["email"] = email;
    if (gender != null) data["gender"] = gender;
    if (biography != null) data["biography"] = biography;
    if (frame != null) data["frame"] = frame;
    if (password != null) data["password"] = password;
    if (pushNotificationToken != null) {
      data["pushNotificationToken"] = pushNotificationToken;
    }
    if (firebaseUid != null) data["firebaseUid"] = firebaseUid;
    return data;
  }
}
