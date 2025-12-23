import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_info_dto.g.dart';

@JsonSerializable()
class PaymentInfoDto {
  String billingType;
  String companyName;
  String fullLegalCompanyName;
  String address;
  String registrationCode;
  bool vatLiability;
  String bankAccountHolderName;
  String bankAccountNumber;
  String bankNameOrBIC;
  String countryOfBirth;
  List<TaxIdentificationNumber> taxIdentificationNumbers;

  PaymentInfoDto({
    required this.billingType,
    required this.companyName,
    required this.fullLegalCompanyName,
    required this.address,
    required this.registrationCode,
    required this.vatLiability,
    required this.bankAccountHolderName,
    required this.bankAccountNumber,
    required this.bankNameOrBIC,
    required this.countryOfBirth,
    required this.taxIdentificationNumbers,
  });

  factory PaymentInfoDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentInfoDtoToJson(this);
}

@JsonSerializable()
class TaxIdentificationNumber {
  String country;
  String number;

  TaxIdentificationNumber({required this.country, required this.number});

  factory TaxIdentificationNumber.fromJson(Map<String, dynamic> json) =>
      _$TaxIdentificationNumberFromJson(json);

  Map<String, dynamic> toJson() => _$TaxIdentificationNumberToJson(this);
}
