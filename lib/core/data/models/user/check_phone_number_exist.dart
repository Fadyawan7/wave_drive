class CheckExistResponse {
  bool? exist;

  CheckExistResponse({
    this.exist,
  });

  CheckExistResponse copyWith({
    bool? exist,
  }) {
    return CheckExistResponse(
      exist: exist ?? this.exist,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exist': exist,
    };
  }

  factory CheckExistResponse.fromJson(Map<String, dynamic> json) {
    return CheckExistResponse(
      exist: json['exist'] as bool?,
    );
  }

  @override
  String toString() => "CheckPhoneNumberExist(exist: $exist)";
}
