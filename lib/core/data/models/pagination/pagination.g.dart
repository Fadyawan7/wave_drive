// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
  count: (json['count'] as num).toInt(),
  total: (json['total'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  pageCount: (json['pageCount'] as num).toInt(),
);

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageCount': instance.pageCount,
      'count': instance.count,
      'total': instance.total,
    };
