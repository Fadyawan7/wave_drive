import 'package:freezed_annotation/freezed_annotation.dart';
part 'earning_model.g.dart';

@JsonSerializable()
class EarningModelResponse {
  final bool status;
  final String message;
  final EarningModel? data;

  EarningModelResponse({required this.status, required this.message, this.data});

  factory EarningModelResponse.fromJson(Map<String, dynamic> json) => _$EarningModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EarningModelResponseToJson(this);
}

@JsonSerializable()
class EarningModel {
  final String totalEarning;
  final String deduction;
  final String waveCommission;
  final String yourEarning;
  final double earningTarget;
  final Trip trip;
  final List<DayStates> dayStates;

  EarningModel({
    required this.totalEarning,
    required this.deduction,
    required this.waveCommission,
    required this.yourEarning,
    required this.earningTarget,
    required this.trip,
    required this.dayStates,
  });

  factory EarningModel.fromJson(Map<String, dynamic> json) => _$EarningModelFromJson(json);

  Map<String, dynamic> toJson() => _$EarningModelToJson(this);
}

@JsonSerializable()
class Trip {
  final int totalRequests;
  final int completeRequests;

  Trip({required this.totalRequests, required this.completeRequests});

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

  Map<String, dynamic> toJson() => _$TripToJson(this);
}




@JsonSerializable()
class DayStates {
  final String day;
  final double hours;

  DayStates({required this.day, required this.hours});

  factory DayStates.fromJson(Map<String, dynamic> json) => _$DayStatesFromJson(json);

  Map<String, dynamic> toJson() => _$DayStatesToJson(this);
}
