import 'package:json_annotation/json_annotation.dart';

part 'kline_model.g.dart';







@JsonSerializable()
class KlineModel {
  @JsonKey(name: 'open_time')
  final int openTime;

  final String open;
  final String high;
  final String low;
  final String close;
  final String volume;

  @JsonKey(name: 'close_time')
  final int closeTime;

  @JsonKey(name: 'quote_volume')
  final String quoteVolume;

  KlineModel({
    required this.openTime,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
    required this.closeTime,
    required this.quoteVolume,
  });

  /// Because MEXC returns List instead of Map, we create a custom factory
  factory KlineModel.fromList(List<dynamic> json) {
    return KlineModel(
      openTime: json[0],
      open: json[1],
      high: json[2],
      low: json[3],
      close: json[4],
      volume: json[5],
      closeTime: json[6],
      quoteVolume: json[7],
    );
  }

  Map<String, dynamic> toJson() => _$KlineModelToJson(this);
}
