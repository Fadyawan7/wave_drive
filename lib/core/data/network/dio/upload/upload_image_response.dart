import 'package:json_annotation/json_annotation.dart';
part 'upload_image_response.g.dart';

@JsonSerializable()
class UploadImageResponse {
  String? url;
  String? fileName;
  String? id;
  String? created;
  String? updated;

  UploadImageResponse({
    this.url,
    this.fileName,
    this.id,
    this.created,
    this.updated,
  });

  factory UploadImageResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadImageResponseToJson(this);
}

