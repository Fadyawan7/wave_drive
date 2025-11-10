// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KlineModel _$KlineModelFromJson(Map<String, dynamic> json) => $checkedCreate(
  'KlineModel',
  json,
  ($checkedConvert) {
    final val = KlineModel(
      openTime: $checkedConvert('open_time', (v) => (v as num).toInt()),
      open: $checkedConvert('open', (v) => v as String),
      high: $checkedConvert('high', (v) => v as String),
      low: $checkedConvert('low', (v) => v as String),
      close: $checkedConvert('close', (v) => v as String),
      volume: $checkedConvert('volume', (v) => v as String),
      closeTime: $checkedConvert('close_time', (v) => (v as num).toInt()),
      quoteVolume: $checkedConvert('quote_volume', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'openTime': 'open_time',
    'closeTime': 'close_time',
    'quoteVolume': 'quote_volume',
  },
);

Map<String, dynamic> _$KlineModelToJson(KlineModel instance) =>
    <String, dynamic>{
      'open_time': instance.openTime,
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
      'volume': instance.volume,
      'close_time': instance.closeTime,
      'quote_volume': instance.quoteVolume,
    };
