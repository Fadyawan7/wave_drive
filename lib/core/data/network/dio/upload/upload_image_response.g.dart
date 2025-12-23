// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadImageResponse _$UploadImageResponseFromJson(Map<String, dynamic> json) =>
    UploadImageResponse(
      url: json['url'] as String?,
      fileName: json['fileName'] as String?,
      id: json['id'] as String?,
      created: json['created'] as String?,
      updated: json['updated'] as String?,
    );

Map<String, dynamic> _$UploadImageResponseToJson(
  UploadImageResponse instance,
) => <String, dynamic>{
  'url': instance.url,
  'fileName': instance.fileName,
  'id': instance.id,
  'created': instance.created,
  'updated': instance.updated,
};
