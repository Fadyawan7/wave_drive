import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wave_drive/core/shared/constants/enums.dart';
part 'user_model.g.dart';

@JsonSerializable()
class SignupResponse {
  final bool status;
  final String message;
  final Data? data;

  SignupResponse({required this.status, required this.message, this.data});

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}

@JsonSerializable()
class Data {
  final UserModel? user;
  final String? token;

  Data({this.user, this.token});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class UserModel {
  final String id;
  final String uid;
  final String? firstName;
  final String? lastName;
  final String? nationalId;
  final String? name;
  final String? email;
  final String? mobile;
  final String? language;
  final String? image;
  final String? type;
  final String? city;
  final String? country;
  final String? latitude;
  final String? longitude;
  final LoginMethod method;
  final Driver? driver;
  final Vehicle? vehicle;
  final DriverDocument? driverDocument;
  final PaymentDetail? paymentDetail;

  ///
  final DateTime? emailVerifiedAt;
  final DateTime? lastLoginAt;
  final String? referralCode;
  final int? deviceId;

  UserModel({
    this.email,
    this.nationalId,
    this.language,
    this.paymentDetail,
    this.driverDocument,
    this.driver,
    this.vehicle,
    this.latitude,
    this.longitude,
    this.city,
    this.country,
    this.type,
    this.mobile,
    required this.method,
    this.firstName,
    this.lastName,
    this.name,
    this.emailVerifiedAt,
    this.lastLoginAt,
    this.image,
    required this.uid,
    this.referralCode,
    required this.id,
    this.deviceId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class Driver {
  final String? id;
  final String? userId;
  final String? nationalId;
  final String? language;
  final String? referralCode;

  Driver({
    this.id,
    this.userId,
    this.nationalId,
    this.language,
    this.referralCode,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);
}

@JsonSerializable()
class Vehicle {
  final String? id;
  final String? userId;
  final String? joinAs;
  final String? licensePlate;
  final String? vehicleTransportLicenseNumber;
  final String? vehicleManufacturer;
  final String? vehicleModel;
  final int? vehicleYear;
  final String? vehicleColor;

  Vehicle({
    this.id,
    this.userId,
    this.joinAs,
    this.licensePlate,
    this.vehicleTransportLicenseNumber,
    this.vehicleManufacturer,
    this.vehicleModel,
    this.vehicleYear,
    this.vehicleColor,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);
}

@JsonSerializable()
class DriverDocument {
  final String? id;
  final String? userId;
  final String? taxiOperatingLicense;
  final String? roofLight;
  final String? vehicleInsuranceDocumentation;
  final String? profilePicture;
  final String? driversLicense;
  final String? driversLicenseNumber;
  final String? taxiDrivingLicense;
  final String? companyRegistrationCertificate;
  final String? bankStatement;
  final DateTime? documentExpires;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DriverDocument({
    this.id,
    this.userId,
    this.taxiOperatingLicense,
    this.roofLight,
    this.vehicleInsuranceDocumentation,
    this.profilePicture,
    this.driversLicense,
    this.driversLicenseNumber,
    this.taxiDrivingLicense,
    this.companyRegistrationCertificate,
    this.bankStatement,
    this.documentExpires,
    this.createdAt,
    this.updatedAt,
  });

  factory DriverDocument.fromJson(Map<String, dynamic> json) =>
      _$DriverDocumentFromJson(json);

  Map<String, dynamic> toJson() => _$DriverDocumentToJson(this);
}

@JsonSerializable()
class PaymentDetail {
  final String? id;
  final String? userId;
  final String? billingType;
  final String? companyName;
  final String? fullLegalCompanyName;
  final String? address;
  final String? registrationCode;
  final bool? vatLiability;
  final String? bankAccountHolderName;
  final String? bankAccountNumber;
  final String? bankNameOrBic;
  final List<TaxIdentificationNumber>? taxIdentificationNumbers;
  final String? countryOfBirth;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PaymentDetail({
    this.id,
    this.userId,
    this.billingType,
    this.companyName,
    this.fullLegalCompanyName,
    this.address,
    this.registrationCode,
    this.vatLiability,
    this.bankAccountHolderName,
    this.bankAccountNumber,
    this.bankNameOrBic,
    this.taxIdentificationNumbers,
    this.countryOfBirth,
    this.createdAt,
    this.updatedAt,
  });

  factory PaymentDetail.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentDetailToJson(this);
}

@JsonSerializable()
class TaxIdentificationNumber {
  final String? number;
  final String? country;

  TaxIdentificationNumber({this.number, this.country});

  factory TaxIdentificationNumber.fromJson(Map<String, dynamic> json) =>
      _$TaxIdentificationNumberFromJson(json);

  Map<String, dynamic> toJson() => _$TaxIdentificationNumberToJson(this);
}
