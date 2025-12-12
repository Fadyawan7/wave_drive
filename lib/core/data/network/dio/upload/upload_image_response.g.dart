// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadImageResponse _$UploadImageResponseFromJson(Map<String, dynamic> json) =>
    UploadImageResponse(
      url: json['url'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      fileName: json['fileName'] as String?,
      id: json['id'] as String?,
      created: json['created'] as String?,
      updated: json['updated'] as String?,
    );

Map<String, dynamic> _$UploadImageResponseToJson(
  UploadImageResponse instance,
) => <String, dynamic>{
  'url': instance.url,
  'user': instance.user,
  'fileName': instance.fileName,
  'id': instance.id,
  'created': instance.created,
  'updated': instance.updated,
};

User _$UserFromJson(Map<String, dynamic> json) =>
    User(id: json['id'] as String?);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
};
