import 'package:json_annotation/json_annotation.dart';
part 'upload_image_response.g.dart';

@JsonSerializable()
class UploadImageResponse {
  String? url;
  User? user;
  String? fileName;
  String? id;
  String? created;
  String? updated;

  UploadImageResponse({
    this.url,
    this.user,
    this.fileName,
    this.id,
    this.created,
    this.updated,
  });

  factory UploadImageResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadImageResponseToJson(this);
}

@JsonSerializable()
class User {
  String? id;

  User({
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
