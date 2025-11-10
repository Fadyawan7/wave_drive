// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Pagination', json, ($checkedConvert) {
      final val = Pagination(
        count: $checkedConvert('count', (v) => (v as num).toInt()),
        total: $checkedConvert('total', (v) => (v as num).toInt()),
        page: $checkedConvert('page', (v) => (v as num).toInt()),
        pageCount: $checkedConvert('pageCount', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageCount': instance.pageCount,
      'count': instance.count,
      'total': instance.total,
    };
