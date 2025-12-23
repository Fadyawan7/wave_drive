// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_vehicle_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateVehicleDTO _$UpdateVehicleDTOFromJson(Map<String, dynamic> json) =>
    UpdateVehicleDTO(
      joinAs: json['joinAs'] as String,
      licensePlate: json['licensePlate'] as String,
      vehicleTransportNumber: json['vehicleTransportNumber'] as String,
      vehicleModel: json['vehicleModel'] as String,
      vehicleManufacturer: json['vehicleManufacturer'] as String,
      vehicleYear: json['vehicleYear'] as String,
      vehicleColor: json['vehicleColor'] as String,
    );

Map<String, dynamic> _$UpdateVehicleDTOToJson(UpdateVehicleDTO instance) =>
    <String, dynamic>{
      'joinAs': instance.joinAs,
      'licensePlate': instance.licensePlate,
      'vehicleTransportNumber': instance.vehicleTransportNumber,
      'vehicleModel': instance.vehicleModel,
      'vehicleManufacturer': instance.vehicleManufacturer,
      'vehicleYear': instance.vehicleYear,
      'vehicleColor': instance.vehicleColor,
    };
