// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseErrorResponse _$BaseErrorResponseFromJson(Map<String, dynamic> json) =>
    BaseErrorResponse(
      statusCode: (json['statusCode'] as num?)?.toInt() ?? -1,
      message: json['message'] as String? ?? "Internal server error",
    );

Map<String, dynamic> _$BaseErrorResponseToJson(BaseErrorResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
