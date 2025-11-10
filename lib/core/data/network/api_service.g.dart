// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'api_service.dart';

// // **************************************************************************
// // RetrofitGenerator
// // **************************************************************************

// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

// class _AuthAPIService implements AuthAPIService {
//   _AuthAPIService(this._dio, {this.baseUrl, this.errorLogger});

//   final Dio _dio;

//   String? baseUrl;

//   final ParseErrorLogger? errorLogger;

//   @override
//   Future<SignupResponse> signupWithEmail(SignupEmailDto dto) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(dto.toJson());
//     final _options = _setStreamType<SignupResponse>(
//       Options(method: 'POST', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/register/user',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late SignupResponse _value;
//     try {
//       _value = SignupResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<SignupResponse> varifySignupOtp(VarifyOtpDto dto) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(dto.toJson());
//     final _options = _setStreamType<SignupResponse>(
//       Options(method: 'POST', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/verify/email/otp',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late SignupResponse _value;
//     try {
//       _value = SignupResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<HttpResponse<dynamic>> sendOtp(String email) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = {'email': email};
//     final _options = _setStreamType<HttpResponse<dynamic>>(
//       Options(method: 'POST', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/register/email/otp',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch(_options);
//     final _value = _result.data;
//     final httpResponse = HttpResponse(_value, _result);
//     return httpResponse;
//   }

//   @override
//   Future<SignupResponse> sigininWIthEmail(SigninDto dto) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(dto.toJson());
//     final _options = _setStreamType<SignupResponse>(
//       Options(method: 'POST', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/login/user',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late SignupResponse _value;
//     try {
//       _value = SignupResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<HttpResponse<dynamic>> sendForgotPsdOtp(String email) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = {'email': email};
//     final _options = _setStreamType<HttpResponse<dynamic>>(
//       Options(method: 'POST', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/email/otp/code',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch(_options);
//     final _value = _result.data;
//     final httpResponse = HttpResponse(_value, _result);
//     return httpResponse;
//   }

//   @override
//   Future<SignupResponse> varifyForgotOtp(VarifyOtpDto dto) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(dto.toJson());
//     final _options = _setStreamType<SignupResponse>(
//       Options(method: 'POST', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/verify/otp',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late SignupResponse _value;
//     try {
//       _value = SignupResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<SignupResponse> resetPassword(SignupEmailDto dto) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(dto.toJson());
//     final _options = _setStreamType<SignupResponse>(
//       Options(method: 'POST', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/password/reset',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late SignupResponse _value;
//     try {
//       _value = SignupResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<SignupResponse> signIn(SignInDTO signInDto) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(signInDto.toJson());
//     final _options = _setStreamType<SignupResponse>(
//       Options(method: 'POST', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/google/login',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late SignupResponse _value;
//     try {
//       _value = SignupResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }

//   String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
//     if (baseUrl == null || baseUrl.trim().isEmpty) {
//       return dioBaseUrl;
//     }

//     final url = Uri.parse(baseUrl);

//     if (url.isAbsolute) {
//       return url.toString();
//     }

//     return Uri.parse(dioBaseUrl).resolveUri(url).toString();
//   }
// }

// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

// class _UserAPIService implements UserAPIService {
//   _UserAPIService(this._dio, {this.baseUrl, this.errorLogger});

//   final Dio _dio;

//   String? baseUrl;

//   final ParseErrorLogger? errorLogger;

//   @override
//   Future<SignupResponse> getProfile() async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<SignupResponse>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/profile/info',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late SignupResponse _value;
//     try {
//       _value = SignupResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }

//   String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
//     if (baseUrl == null || baseUrl.trim().isEmpty) {
//       return dioBaseUrl;
//     }

//     final url = Uri.parse(baseUrl);

//     if (url.isAbsolute) {
//       return url.toString();
//     }

//     return Uri.parse(dioBaseUrl).resolveUri(url).toString();
//   }
// }

// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

// class _WalletAPIService implements WalletAPIService {
//   _WalletAPIService(this._dio, {this.baseUrl, this.errorLogger});

//   final Dio _dio;

//   String? baseUrl;

//   final ParseErrorLogger? errorLogger;

//   @override
//   Future<WalletModel> fetchWallet(String currency) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{r'currency': currency};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<WalletModel>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/wallet/spot/balance',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late WalletModel _value;
//     try {
//       _value = WalletModel.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<PackageResponse> getPackages() async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<PackageResponse>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/subscription/package',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late PackageResponse _value;
//     try {
//       _value = PackageResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<HttpResponse<dynamic>> subscribePackage(int package_id) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = {'package_id': package_id};
//     final _options = _setStreamType<HttpResponse<dynamic>>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/subscription/subscribe',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch(_options);
//     final _value = _result.data;
//     final httpResponse = HttpResponse(_value, _result);
//     return httpResponse;
//   }

//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }

//   String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
//     if (baseUrl == null || baseUrl.trim().isEmpty) {
//       return dioBaseUrl;
//     }

//     final url = Uri.parse(baseUrl);

//     if (url.isAbsolute) {
//       return url.toString();
//     }

//     return Uri.parse(dioBaseUrl).resolveUri(url).toString();
//   }
// }

// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

// class _ImageAPIService implements ImageAPIService {
//   _ImageAPIService(this._dio, {this.baseUrl, this.errorLogger});

//   final Dio _dio;

//   String? baseUrl;

//   final ParseErrorLogger? errorLogger;

//   @override
//   Future<List<BannerModel>> getBanners() async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<List<BannerModel>>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/banner',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<List<dynamic>>(_options);
//     late List<BannerModel> _value;
//     try {
//       _value = _result.data!
//           .map((dynamic i) => BannerModel.fromJson(i as Map<String, dynamic>))
//           .toList();
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<SocialResponse> getSocialLinkes() async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<SocialResponse>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/community/links',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late SocialResponse _value;
//     try {
//       _value = SocialResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }

//   String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
//     if (baseUrl == null || baseUrl.trim().isEmpty) {
//       return dioBaseUrl;
//     }

//     final url = Uri.parse(baseUrl);

//     if (url.isAbsolute) {
//       return url.toString();
//     }

//     return Uri.parse(dioBaseUrl).resolveUri(url).toString();
//   }
// }

// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

// class _HomeApiService implements HomeApiService {
//   _HomeApiService(this._dio, {this.baseUrl, this.errorLogger});

//   final Dio _dio;

//   String? baseUrl;

//   final ParseErrorLogger? errorLogger;

//   @override
//   Future<HomeMarketPairsResponse> getHomeMarketPairs(
//     int page,
//     int limit,
//   ) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{r'page': page, r'limit': limit};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<HomeMarketPairsResponse>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/home/market-pairs',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late HomeMarketPairsResponse _value;
//     try {
//       _value = HomeMarketPairsResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }

//   String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
//     if (baseUrl == null || baseUrl.trim().isEmpty) {
//       return dioBaseUrl;
//     }

//     final url = Uri.parse(baseUrl);

//     if (url.isAbsolute) {
//       return url.toString();
//     }

//     return Uri.parse(dioBaseUrl).resolveUri(url).toString();
//   }
// }

// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

// class _SubscriptionApiService implements SubscriptionApiService {
//   _SubscriptionApiService(this._dio, {this.baseUrl, this.errorLogger});

//   final Dio _dio;

//   String? baseUrl;

//   final ParseErrorLogger? errorLogger;

//   @override
//   Future<SubscriptionResponse> getSubscriptions() async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<SubscriptionResponse>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/subscription/package',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late SubscriptionResponse _value;
//     try {
//       _value = SubscriptionResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<SubscribeResponse> subscribeToPackage(SubscribeRequest request) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(request.toJson());
//     final _options = _setStreamType<SubscribeResponse>(
//       Options(method: 'POST', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/subscription/subscribe',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late SubscribeResponse _value;
//     try {
//       _value = SubscribeResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }

//   String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
//     if (baseUrl == null || baseUrl.trim().isEmpty) {
//       return dioBaseUrl;
//     }

//     final url = Uri.parse(baseUrl);

//     if (url.isAbsolute) {
//       return url.toString();
//     }

//     return Uri.parse(dioBaseUrl).resolveUri(url).toString();
//   }
// }

// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

// class _DepositApiService implements DepositApiService {
//   _DepositApiService(this._dio, {this.baseUrl, this.errorLogger});

//   final Dio _dio;

//   String? baseUrl;

//   final ParseErrorLogger? errorLogger;

//   @override
//   Future<CurrencyResponse> getCurrencies() async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<CurrencyResponse>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/currency',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late CurrencyResponse _value;
//     try {
//       _value = CurrencyResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<List<NetworkModel>> getNetworks(String code) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<List<NetworkModel>>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/networks/${code}',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<List<dynamic>>(_options);
//     late List<NetworkModel> _value;
//     try {
//       _value = _result.data!
//           .map((dynamic i) => NetworkModel.fromJson(i as Map<String, dynamic>))
//           .toList();
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<CreateDepositResponse> createDeposit(Map<String, dynamic> body) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(body);
//     final _options = _setStreamType<CreateDepositResponse>(
//       Options(method: 'POST', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/wallet/now/deposit',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late CreateDepositResponse _value;
//     try {
//       _value = CreateDepositResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }

//   String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
//     if (baseUrl == null || baseUrl.trim().isEmpty) {
//       return dioBaseUrl;
//     }

//     final url = Uri.parse(baseUrl);

//     if (url.isAbsolute) {
//       return url.toString();
//     }

//     return Uri.parse(dioBaseUrl).resolveUri(url).toString();
//   }
// }

// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

// class _CommunityApiService implements CommunityApiService {
//   _CommunityApiService(this._dio, {this.baseUrl, this.errorLogger});

//   final Dio _dio;

//   String? baseUrl;

//   final ParseErrorLogger? errorLogger;

//   @override
//   Future<CommunityResponse> getSubscriptionPlans() async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<CommunityResponse>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/community/subscription-plans',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late CommunityResponse _value;
//     try {
//       _value = CommunityResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<CommunityResponse> getCurrentSubscription() async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<CommunityResponse>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/community/current-subscription',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late CommunityResponse _value;
//     try {
//       _value = CommunityResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<CommunityResponse> subscribeToPlan(
//     Map<String, dynamic> subscriptionData,
//   ) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(subscriptionData);
//     final _options = _setStreamType<CommunityResponse>(
//       Options(method: 'POST', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/community/subscribe',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late CommunityResponse _value;
//     try {
//       _value = CommunityResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<GroupChatResponse> getGroupChatMessages(int page, int limit) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{r'page': page, r'limit': limit};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<GroupChatResponse>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/community/group-chat',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late GroupChatResponse _value;
//     try {
//       _value = GroupChatResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<GroupChatResponse> sendMessage(
//     Map<String, dynamic> messageData,
//   ) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(messageData);
//     final _options = _setStreamType<GroupChatResponse>(
//       Options(method: 'POST', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/community/group-chat/send-message',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late GroupChatResponse _value;
//     try {
//       _value = GroupChatResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<GroupInfo> getGroupInfo() async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<GroupInfo>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/community/group-info',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late GroupInfo _value;
//     try {
//       _value = GroupInfo.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<GroupInfo> updateGroupDescription(
//     Map<String, dynamic> descriptionData,
//   ) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(descriptionData);
//     final _options = _setStreamType<GroupInfo>(
//       Options(method: 'POST', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/community/group-info/update-description',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late GroupInfo _value;
//     try {
//       _value = GroupInfo.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<GroupChatResponse> getGroupMembers(int page, int limit) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{r'page': page, r'limit': limit};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<GroupChatResponse>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/community/group-members',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late GroupChatResponse _value;
//     try {
//       _value = GroupChatResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<PackageResponse> getPackages() async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<PackageResponse>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/subscription/package',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late PackageResponse _value;
//     try {
//       _value = PackageResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<HttpResponse<dynamic>> subscribePackage(int package_id) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = {'package_id': package_id};
//     final _options = _setStreamType<HttpResponse<dynamic>>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/subscription/subscribe',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch(_options);
//     final _value = _result.data;
//     final httpResponse = HttpResponse(_value, _result);
//     return httpResponse;
//   }

//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }

//   String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
//     if (baseUrl == null || baseUrl.trim().isEmpty) {
//       return dioBaseUrl;
//     }

//     final url = Uri.parse(baseUrl);

//     if (url.isAbsolute) {
//       return url.toString();
//     }

//     return Uri.parse(dioBaseUrl).resolveUri(url).toString();
//   }
// }

// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

// class _TradingService implements TradingService {
//   _TradingService(this._dio, {this.baseUrl, this.errorLogger});

//   final Dio _dio;

//   String? baseUrl;

//   final ParseErrorLogger? errorLogger;

//   @override
//   Future<SymbolPairsResponse> getSymbolePiairs(String quote, int limit) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{r'quote': quote, r'limit': limit};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<SymbolPairsResponse>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/mexc/pair/info',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late SymbolPairsResponse _value;
//     try {
//       _value = SymbolPairsResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<PlaceOrderResponse> placeOrder(PlaceOrderDto dto) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     final _data = <String, dynamic>{};
//     _data.addAll(dto.toJson());
//     final _options = _setStreamType<PlaceOrderResponse>(
//       Options(method: 'POST', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/mexc/spot/trade',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late PlaceOrderResponse _value;
//     try {
//       _value = PlaceOrderResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<List<OpenOrderModel>> getLimitOrders() async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<List<OpenOrderModel>>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/mexc/open/order',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<List<dynamic>>(_options);
//     late List<OpenOrderModel> _value;
//     try {
//       _value = _result.data!
//           .map(
//             (dynamic i) => OpenOrderModel.fromJson(i as Map<String, dynamic>),
//           )
//           .toList();
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<List<OpenOrderModel>> getMarketOrders(String symbol) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<List<OpenOrderModel>>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/api/v1/user/mexc/all/orders/${symbol}',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<List<dynamic>>(_options);
//     late List<OpenOrderModel> _value;
//     try {
//       _value = _result.data!
//           .map(
//             (dynamic i) => OpenOrderModel.fromJson(i as Map<String, dynamic>),
//           )
//           .toList();
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }

//   String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
//     if (baseUrl == null || baseUrl.trim().isEmpty) {
//       return dioBaseUrl;
//     }

//     final url = Uri.parse(baseUrl);

//     if (url.isAbsolute) {
//       return url.toString();
//     }

//     return Uri.parse(dioBaseUrl).resolveUri(url).toString();
//   }
// }

// // ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

// class _MexcAPIService implements MexcAPIService {
//   _MexcAPIService(this._dio, {this.baseUrl, this.errorLogger});

//   final Dio _dio;

//   String? baseUrl;

//   final ParseErrorLogger? errorLogger;

//   @override
//   Future<List<PairModel>> getTradingPairs(dynamic time) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<List<PairModel>>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/ticker/${time}',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<List<dynamic>>(_options);
//     late List<PairModel> _value;
//     try {
//       _value = _result.data!
//           .map((dynamic i) => PairModel.fromJson(i as Map<String, dynamic>))
//           .toList();
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<PairModel> getTradingPairsDetail(dynamic time, String symbol) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{r'symbol': symbol};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<PairModel>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/ticker/${time}',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late PairModel _value;
//     try {
//       _value = PairModel.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<OrderBookModel> fetchMexcOrderBook(String symbol, int limit) async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{
//       r'symbol': symbol,
//       r'limit': limit,
//     };
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<OrderBookModel>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/depth',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late OrderBookModel _value;
//     try {
//       _value = OrderBookModel.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   @override
//   Future<TradingSymbolsResponse> getTradingSymbols() async {
//     final _extra = <String, dynamic>{};
//     final queryParameters = <String, dynamic>{};
//     final _headers = <String, dynamic>{};
//     const Map<String, dynamic>? _data = null;
//     final _options = _setStreamType<TradingSymbolsResponse>(
//       Options(method: 'GET', headers: _headers, extra: _extra)
//           .compose(
//             _dio.options,
//             '/defaultSymbols',
//             queryParameters: queryParameters,
//             data: _data,
//           )
//           .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
//     );
//     final _result = await _dio.fetch<Map<String, dynamic>>(_options);
//     late TradingSymbolsResponse _value;
//     try {
//       _value = TradingSymbolsResponse.fromJson(_result.data!);
//     } on Object catch (e, s) {
//       errorLogger?.logError(e, s, _options);
//       rethrow;
//     }
//     return _value;
//   }

//   RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
//     if (T != dynamic &&
//         !(requestOptions.responseType == ResponseType.bytes ||
//             requestOptions.responseType == ResponseType.stream)) {
//       if (T == String) {
//         requestOptions.responseType = ResponseType.plain;
//       } else {
//         requestOptions.responseType = ResponseType.json;
//       }
//     }
//     return requestOptions;
//   }

//   String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
//     if (baseUrl == null || baseUrl.trim().isEmpty) {
//       return dioBaseUrl;
//     }

//     final url = Uri.parse(baseUrl);

//     if (url.isAbsolute) {
//       return url.toString();
//     }

//     return Uri.parse(dioBaseUrl).resolveUri(url).toString();
//   }
// }
