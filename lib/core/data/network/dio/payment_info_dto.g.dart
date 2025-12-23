// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentInfoDto _$PaymentInfoDtoFromJson(
  Map<String, dynamic> json,
) => PaymentInfoDto(
  billingType: json['billingType'] as String,
  companyName: json['companyName'] as String,
  fullLegalCompanyName: json['fullLegalCompanyName'] as String,
  address: json['address'] as String,
  registrationCode: json['registrationCode'] as String,
  vatLiability: json['vatLiability'] as bool,
  bankAccountHolderName: json['bankAccountHolderName'] as String,
  bankAccountNumber: json['bankAccountNumber'] as String,
  bankNameOrBIC: json['bankNameOrBIC'] as String,
  countryOfBirth: json['countryOfBirth'] as String,
  taxIdentificationNumbers: (json['taxIdentificationNumbers'] as List<dynamic>)
      .map((e) => TaxIdentificationNumber.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaymentInfoDtoToJson(PaymentInfoDto instance) =>
    <String, dynamic>{
      'billingType': instance.billingType,
      'companyName': instance.companyName,
      'fullLegalCompanyName': instance.fullLegalCompanyName,
      'address': instance.address,
      'registrationCode': instance.registrationCode,
      'vatLiability': instance.vatLiability,
      'bankAccountHolderName': instance.bankAccountHolderName,
      'bankAccountNumber': instance.bankAccountNumber,
      'bankNameOrBIC': instance.bankNameOrBIC,
      'countryOfBirth': instance.countryOfBirth,
      'taxIdentificationNumbers': instance.taxIdentificationNumbers,
    };

TaxIdentificationNumber _$TaxIdentificationNumberFromJson(
  Map<String, dynamic> json,
) => TaxIdentificationNumber(
  country: json['country'] as String,
  number: json['number'] as String,
);

Map<String, dynamic> _$TaxIdentificationNumberToJson(
  TaxIdentificationNumber instance,
) => <String, dynamic>{'country': instance.country, 'number': instance.number};
