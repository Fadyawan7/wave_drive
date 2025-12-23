

import 'package:freezed_annotation/freezed_annotation.dart';

      part 'update_vehicle_info_dto.g.dart';

@JsonSerializable()
class UpdateVehicleDTO {
  String joinAs;
  String licensePlate;
  String vehicleTransportNumber;
  String vehicleModel;
  String vehicleManufacturer;
  String vehicleYear;
  String vehicleColor;


  UpdateVehicleDTO({
    required this.joinAs,
    required this.licensePlate,
    required this.vehicleTransportNumber,
    required this.vehicleModel,
    required this.vehicleManufacturer,
    required this.vehicleYear,
    required this.vehicleColor,
  });




 factory UpdateVehicleDTO.fromJson(Map<String, dynamic> json) =>
      _$UpdateVehicleDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateVehicleDTOToJson(this);
  
}
