// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RideRequestModel _$RideRequestModelFromJson(Map<String, dynamic> json) =>
    RideRequestModel(
      rideId: json['rideId'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      userImage: json['userImage'] as String?,
      category: json['category'] as String,
      pickLocation: LocationModel.fromJson(
        json['pickLocation'] as Map<String, dynamic>,
      ),
      dropLocation: LocationModel.fromJson(
        json['dropLocation'] as Map<String, dynamic>,
      ),
      distance: (json['distance'] as num).toDouble(),
      fare: (json['fare'] as num).toDouble(),
      baseFare: (json['baseFare'] as num).toDouble(),
      ratePerKm: (json['ratePerKm'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$RideRequestModelToJson(RideRequestModel instance) =>
    <String, dynamic>{
      'rideId': instance.rideId,
      'userId': instance.userId,
      'userName': instance.userName,
      'userImage': instance.userImage,
      'category': instance.category,
      'pickLocation': instance.pickLocation,
      'dropLocation': instance.dropLocation,
      'distance': instance.distance,
      'fare': instance.fare,
      'baseFare': instance.baseFare,
      'ratePerKm': instance.ratePerKm,
      'createdAt': instance.createdAt.toIso8601String(),
    };

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      name: json['name'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'name': instance.name,
      'address': instance.address,
    };
