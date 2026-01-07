// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earning_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EarningModelResponse _$EarningModelResponseFromJson(
  Map<String, dynamic> json,
) => EarningModelResponse(
  status: json['status'] as bool,
  message: json['message'] as String,
  data: json['data'] == null
      ? null
      : EarningModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EarningModelResponseToJson(
  EarningModelResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

EarningModel _$EarningModelFromJson(Map<String, dynamic> json) => EarningModel(
  totalEarning: json['totalEarning'] as String,
  deduction: json['deduction'] as String,
  waveCommission: json['waveCommission'] as String,
  yourEarning: json['yourEarning'] as String,
  earningTarget: (json['earningTarget'] as num).toDouble(),
  trip: Trip.fromJson(json['trip'] as Map<String, dynamic>),
  dayStates: (json['dayStates'] as List<dynamic>)
      .map((e) => DayStates.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$EarningModelToJson(EarningModel instance) =>
    <String, dynamic>{
      'totalEarning': instance.totalEarning,
      'deduction': instance.deduction,
      'waveCommission': instance.waveCommission,
      'yourEarning': instance.yourEarning,
      'earningTarget': instance.earningTarget,
      'trip': instance.trip,
      'dayStates': instance.dayStates,
    };

Trip _$TripFromJson(Map<String, dynamic> json) => Trip(
  totalRequests: (json['totalRequests'] as num).toInt(),
  completeRequests: (json['completeRequests'] as num).toInt(),
);

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
  'totalRequests': instance.totalRequests,
  'completeRequests': instance.completeRequests,
};

DayStates _$DayStatesFromJson(Map<String, dynamic> json) => DayStates(
  day: json['day'] as String,
  hours: (json['hours'] as num).toDouble(),
);

Map<String, dynamic> _$DayStatesToJson(DayStates instance) => <String, dynamic>{
  'day': instance.day,
  'hours': instance.hours,
};
