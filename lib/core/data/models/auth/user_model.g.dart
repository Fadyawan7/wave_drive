// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  user: json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>),
  token: json['token'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'user': instance.user,
  'token': instance.token,
};

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  email: json['email'] as String?,
  driverStatus:
      $enumDecodeNullable(_$DriverStatusEnumMap, json['driverStatus']) ??
      DriverStatus.offline,
  vehicleCategory: $enumDecodeNullable(
    _$VehicleCategoryEnumMap,
    json['vehicleCategory'],
  ),
  driverStates: json['driverStates'] == null
      ? null
      : DriverStates.fromJson(json['driverStates'] as Map<String, dynamic>),
  nationalId: json['nationalId'] as String?,
  language: json['language'] as String?,
  paymentDetail: json['paymentDetail'] == null
      ? null
      : PaymentDetail.fromJson(json['paymentDetail'] as Map<String, dynamic>),
  driverDocument: json['driverDocument'] == null
      ? null
      : DriverDocument.fromJson(json['driverDocument'] as Map<String, dynamic>),
  driver: json['driver'] == null
      ? null
      : Driver.fromJson(json['driver'] as Map<String, dynamic>),
  vehicle: json['vehicle'] == null
      ? null
      : Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>),
  latitude: json['latitude'] as String?,
  longitude: json['longitude'] as String?,
  city: json['city'] as String?,
  country: json['country'] as String?,
  type: json['type'] as String?,
  mobile: json['mobile'] as String?,
  method: $enumDecode(_$LoginMethodEnumMap, json['method']),
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  name: json['name'] as String?,
  emailVerifiedAt: json['emailVerifiedAt'] == null
      ? null
      : DateTime.parse(json['emailVerifiedAt'] as String),
  lastLoginAt: json['lastLoginAt'] == null
      ? null
      : DateTime.parse(json['lastLoginAt'] as String),
  image: json['image'] as String?,
  uid: json['uid'] as String,
  referralCode: json['referralCode'] as String?,
  id: json['id'] as String,
  deviceId: (json['deviceId'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'driverStatus': _$DriverStatusEnumMap[instance.driverStatus]!,
  'vehicleCategory': _$VehicleCategoryEnumMap[instance.vehicleCategory],
  'uid': instance.uid,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'nationalId': instance.nationalId,
  'name': instance.name,
  'email': instance.email,
  'mobile': instance.mobile,
  'language': instance.language,
  'image': instance.image,
  'type': instance.type,
  'city': instance.city,
  'country': instance.country,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'method': _$LoginMethodEnumMap[instance.method]!,
  'driver': instance.driver,
  'vehicle': instance.vehicle,
  'driverDocument': instance.driverDocument,
  'paymentDetail': instance.paymentDetail,
  'driverStates': instance.driverStates,
  'emailVerifiedAt': instance.emailVerifiedAt?.toIso8601String(),
  'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
  'referralCode': instance.referralCode,
  'deviceId': instance.deviceId,
};

const _$DriverStatusEnumMap = {
  DriverStatus.available: 'available',
  DriverStatus.busy: 'busy',
  DriverStatus.offline: 'offline',
};

const _$VehicleCategoryEnumMap = {
  VehicleCategory.wave: 'wave',
  VehicleCategory.comfort: 'comfort',
  VehicleCategory.premium: 'premium',
  VehicleCategory.electric: 'electric',
  VehicleCategory.xL: 'xL',
};

const _$LoginMethodEnumMap = {
  LoginMethod.google: 'google',
  LoginMethod.apple: 'apple',
  LoginMethod.phone: 'phone',
};

Driver _$DriverFromJson(Map<String, dynamic> json) => Driver(
  id: json['id'] as String?,
  userId: json['userId'] as String?,
  nationalId: json['nationalId'] as String?,
  language: json['language'] as String?,
  referralCode: json['referralCode'] as String?,
);

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'nationalId': instance.nationalId,
  'language': instance.language,
  'referralCode': instance.referralCode,
};

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
  id: json['id'] as String?,
  userId: json['userId'] as String?,
  joinAs: json['joinAs'] as String?,
  licensePlate: json['licensePlate'] as String?,
  vehicleTransportLicenseNumber:
      json['vehicleTransportLicenseNumber'] as String?,
  vehicleManufacturer: json['vehicleManufacturer'] as String?,
  vehicleModel: json['vehicleModel'] as String?,
  vehicleYear: (json['vehicleYear'] as num?)?.toInt(),
  vehicleColor: json['vehicleColor'] as String?,
);

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'joinAs': instance.joinAs,
  'licensePlate': instance.licensePlate,
  'vehicleTransportLicenseNumber': instance.vehicleTransportLicenseNumber,
  'vehicleManufacturer': instance.vehicleManufacturer,
  'vehicleModel': instance.vehicleModel,
  'vehicleYear': instance.vehicleYear,
  'vehicleColor': instance.vehicleColor,
};

DriverDocument _$DriverDocumentFromJson(Map<String, dynamic> json) =>
    DriverDocument(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      taxiOperatingLicense: json['taxiOperatingLicense'] as String?,
      roofLight: json['roofLight'] as String?,
      vehicleInsuranceDocumentation:
          json['vehicleInsuranceDocumentation'] as String?,
      profilePicture: json['profilePicture'] as String?,
      driversLicense: json['driversLicense'] as String?,
      driversLicenseNumber: json['driversLicenseNumber'] as String?,
      taxiDrivingLicense: json['taxiDrivingLicense'] as String?,
      companyRegistrationCertificate:
          json['companyRegistrationCertificate'] as String?,
      bankStatement: json['bankStatement'] as String?,
      documentExpires: json['documentExpires'] == null
          ? null
          : DateTime.parse(json['documentExpires'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$DriverDocumentToJson(DriverDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'taxiOperatingLicense': instance.taxiOperatingLicense,
      'roofLight': instance.roofLight,
      'vehicleInsuranceDocumentation': instance.vehicleInsuranceDocumentation,
      'profilePicture': instance.profilePicture,
      'driversLicense': instance.driversLicense,
      'driversLicenseNumber': instance.driversLicenseNumber,
      'taxiDrivingLicense': instance.taxiDrivingLicense,
      'companyRegistrationCertificate': instance.companyRegistrationCertificate,
      'bankStatement': instance.bankStatement,
      'documentExpires': instance.documentExpires?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

PaymentDetail _$PaymentDetailFromJson(
  Map<String, dynamic> json,
) => PaymentDetail(
  id: json['id'] as String?,
  userId: json['userId'] as String?,
  billingType: json['billingType'] as String?,
  companyName: json['companyName'] as String?,
  fullLegalCompanyName: json['fullLegalCompanyName'] as String?,
  address: json['address'] as String?,
  registrationCode: json['registrationCode'] as String?,
  vatLiability: json['vatLiability'] as bool?,
  bankAccountHolderName: json['bankAccountHolderName'] as String?,
  bankAccountNumber: json['bankAccountNumber'] as String?,
  bankNameOrBic: json['bankNameOrBic'] as String?,
  taxIdentificationNumbers: (json['taxIdentificationNumbers'] as List<dynamic>?)
      ?.map((e) => TaxIdentificationNumber.fromJson(e as Map<String, dynamic>))
      .toList(),
  countryOfBirth: json['countryOfBirth'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$PaymentDetailToJson(PaymentDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'billingType': instance.billingType,
      'companyName': instance.companyName,
      'fullLegalCompanyName': instance.fullLegalCompanyName,
      'address': instance.address,
      'registrationCode': instance.registrationCode,
      'vatLiability': instance.vatLiability,
      'bankAccountHolderName': instance.bankAccountHolderName,
      'bankAccountNumber': instance.bankAccountNumber,
      'bankNameOrBic': instance.bankNameOrBic,
      'taxIdentificationNumbers': instance.taxIdentificationNumbers,
      'countryOfBirth': instance.countryOfBirth,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

TaxIdentificationNumber _$TaxIdentificationNumberFromJson(
  Map<String, dynamic> json,
) => TaxIdentificationNumber(
  number: json['number'] as String?,
  country: json['country'] as String?,
);

Map<String, dynamic> _$TaxIdentificationNumberToJson(
  TaxIdentificationNumber instance,
) => <String, dynamic>{'number': instance.number, 'country': instance.country};

DriverStates _$DriverStatesFromJson(Map<String, dynamic> json) => DriverStates(
  score: json['score'] as String?,
  acceptanceRate: json['acceptanceRate'] as String?,
  bonus: (json['bonus'] as num?)?.toDouble(),
);

Map<String, dynamic> _$DriverStatesToJson(DriverStates instance) =>
    <String, dynamic>{
      'score': instance.score,
      'acceptanceRate': instance.acceptanceRate,
      'bonus': instance.bonus,
    };
