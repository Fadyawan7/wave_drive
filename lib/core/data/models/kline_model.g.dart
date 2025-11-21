// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KlineModel _$KlineModelFromJson(Map<String, dynamic> json) => KlineModel(
  openTime: (json['open_time'] as num).toInt(),
  open: json['open'] as String,
  high: json['high'] as String,
  low: json['low'] as String,
  close: json['close'] as String,
  volume: json['volume'] as String,
  closeTime: (json['close_time'] as num).toInt(),
  quoteVolume: json['quote_volume'] as String,
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
