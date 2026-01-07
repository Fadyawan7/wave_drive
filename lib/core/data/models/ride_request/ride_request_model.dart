import 'package:freezed_annotation/freezed_annotation.dart';
      part 'ride_request_model.g.dart';
@JsonSerializable()
class RideRequestModel {
  final String rideId;
  final String userId;
  final String userName;
  final String? userImage;
  final String category;
  final LocationModel pickLocation;
  final LocationModel dropLocation;
  final double distance;
  final double fare;
  final double baseFare;
  final double ratePerKm;
  final DateTime createdAt;

  RideRequestModel({
    required this.rideId,
    required this.userId,
    required this.userName,
    this.userImage,
    required this.category,
    required this.pickLocation,
    required this.dropLocation,
    required this.distance,
    required this.fare,
    required this.baseFare,
    required this.ratePerKm,
    required this.createdAt,
  });

  factory RideRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RideRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$RideRequestModelToJson(this);
}


@JsonSerializable()
class LocationModel {
  final double latitude;
  final double longitude;
  final String? name;
  final String? address;

  LocationModel({
    required this.latitude,
    required this.longitude,
    this.name,
    this.address,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
