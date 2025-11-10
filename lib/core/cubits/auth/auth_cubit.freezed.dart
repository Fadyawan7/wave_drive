// // GENERATED CODE - DO NOT MODIFY BY HAND
// // coverage:ignore-file
// // ignore_for_file: type=lint
// // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// part of 'auth_cubit.dart';

// // **************************************************************************
// // FreezedGenerator
// // **************************************************************************

// // dart format off
// T _$identity<T>(T value) => value;
// /// @nodoc
// mixin _$AuthState {

// // required OTPState otpState,
//  bool get isLoggedIn; AppLoadState get signInState; AppLoadState get signInSocialState; AppLoadState get completeProfileState; AppLoadState get completeCreatePassword; int? get statusCodeSignInWithPassword; String get errorMessage;
// /// Create a copy of AuthState
// /// with the given fields replaced by the non-null parameter values.
// @JsonKey(includeFromJson: false, includeToJson: false)
// @pragma('vm:prefer-inline')
// $AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn)&&(identical(other.signInState, signInState) || other.signInState == signInState)&&(identical(other.signInSocialState, signInSocialState) || other.signInSocialState == signInSocialState)&&(identical(other.completeProfileState, completeProfileState) || other.completeProfileState == completeProfileState)&&(identical(other.completeCreatePassword, completeCreatePassword) || other.completeCreatePassword == completeCreatePassword)&&(identical(other.statusCodeSignInWithPassword, statusCodeSignInWithPassword) || other.statusCodeSignInWithPassword == statusCodeSignInWithPassword)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
// }


// @override
// int get hashCode => Object.hash(runtimeType,isLoggedIn,signInState,signInSocialState,completeProfileState,completeCreatePassword,statusCodeSignInWithPassword,errorMessage);

// @override
// String toString() {
//   return 'AuthState(isLoggedIn: $isLoggedIn, signInState: $signInState, signInSocialState: $signInSocialState, completeProfileState: $completeProfileState, completeCreatePassword: $completeCreatePassword, statusCodeSignInWithPassword: $statusCodeSignInWithPassword, errorMessage: $errorMessage)';
// }


// }

// /// @nodoc
// abstract mixin class $AuthStateCopyWith<$Res>  {
//   factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
// @useResult
// $Res call({
//  bool isLoggedIn, AppLoadState signInState, AppLoadState signInSocialState, AppLoadState completeProfileState, AppLoadState completeCreatePassword, int? statusCodeSignInWithPassword, String errorMessage
// });




// }
// /// @nodoc
// class _$AuthStateCopyWithImpl<$Res>
//     implements $AuthStateCopyWith<$Res> {
//   _$AuthStateCopyWithImpl(this._self, this._then);

//   final AuthState _self;
//   final $Res Function(AuthState) _then;

// /// Create a copy of AuthState
// /// with the given fields replaced by the non-null parameter values.
// @pragma('vm:prefer-inline') @override $Res call({Object? isLoggedIn = null,Object? signInState = null,Object? signInSocialState = null,Object? completeProfileState = null,Object? completeCreatePassword = null,Object? statusCodeSignInWithPassword = freezed,Object? errorMessage = null,}) {
//   return _then(_self.copyWith(
// isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
// as bool,signInState: null == signInState ? _self.signInState : signInState // ignore: cast_nullable_to_non_nullable
// as AppLoadState,signInSocialState: null == signInSocialState ? _self.signInSocialState : signInSocialState // ignore: cast_nullable_to_non_nullable
// as AppLoadState,completeProfileState: null == completeProfileState ? _self.completeProfileState : completeProfileState // ignore: cast_nullable_to_non_nullable
// as AppLoadState,completeCreatePassword: null == completeCreatePassword ? _self.completeCreatePassword : completeCreatePassword // ignore: cast_nullable_to_non_nullable
// as AppLoadState,statusCodeSignInWithPassword: freezed == statusCodeSignInWithPassword ? _self.statusCodeSignInWithPassword : statusCodeSignInWithPassword // ignore: cast_nullable_to_non_nullable
// as int?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
// as String,
//   ));
// }

// }



// /// @nodoc


// class _AuthState implements AuthState {
//   const _AuthState({this.isLoggedIn = false, this.signInState = AppLoadState.initial, this.signInSocialState = AppLoadState.initial, this.completeProfileState = AppLoadState.initial, this.completeCreatePassword = AppLoadState.initial, this.statusCodeSignInWithPassword, this.errorMessage = ""});
  

// // required OTPState otpState,
// @override@JsonKey() final  bool isLoggedIn;
// @override@JsonKey() final  AppLoadState signInState;
// @override@JsonKey() final  AppLoadState signInSocialState;
// @override@JsonKey() final  AppLoadState completeProfileState;
// @override@JsonKey() final  AppLoadState completeCreatePassword;
// @override final  int? statusCodeSignInWithPassword;
// @override@JsonKey() final  String errorMessage;

// /// Create a copy of AuthState
// /// with the given fields replaced by the non-null parameter values.
// @override @JsonKey(includeFromJson: false, includeToJson: false)
// @pragma('vm:prefer-inline')
// _$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



// @override
// bool operator ==(Object other) {
//   return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn)&&(identical(other.signInState, signInState) || other.signInState == signInState)&&(identical(other.signInSocialState, signInSocialState) || other.signInSocialState == signInSocialState)&&(identical(other.completeProfileState, completeProfileState) || other.completeProfileState == completeProfileState)&&(identical(other.completeCreatePassword, completeCreatePassword) || other.completeCreatePassword == completeCreatePassword)&&(identical(other.statusCodeSignInWithPassword, statusCodeSignInWithPassword) || other.statusCodeSignInWithPassword == statusCodeSignInWithPassword)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
// }


// @override
// int get hashCode => Object.hash(runtimeType,isLoggedIn,signInState,signInSocialState,completeProfileState,completeCreatePassword,statusCodeSignInWithPassword,errorMessage);

// @override
// String toString() {
//   return 'AuthState(isLoggedIn: $isLoggedIn, signInState: $signInState, signInSocialState: $signInSocialState, completeProfileState: $completeProfileState, completeCreatePassword: $completeCreatePassword, statusCodeSignInWithPassword: $statusCodeSignInWithPassword, errorMessage: $errorMessage)';
// }


// }

// /// @nodoc
// abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
//   factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
// @override @useResult
// $Res call({
//  bool isLoggedIn, AppLoadState signInState, AppLoadState signInSocialState, AppLoadState completeProfileState, AppLoadState completeCreatePassword, int? statusCodeSignInWithPassword, String errorMessage
// });




// }
// /// @nodoc
// class __$AuthStateCopyWithImpl<$Res>
//     implements _$AuthStateCopyWith<$Res> {
//   __$AuthStateCopyWithImpl(this._self, this._then);

//   final _AuthState _self;
//   final $Res Function(_AuthState) _then;

// /// Create a copy of AuthState
// /// with the given fields replaced by the non-null parameter values.
// @override @pragma('vm:prefer-inline') $Res call({Object? isLoggedIn = null,Object? signInState = null,Object? signInSocialState = null,Object? completeProfileState = null,Object? completeCreatePassword = null,Object? statusCodeSignInWithPassword = freezed,Object? errorMessage = null,}) {
//   return _then(_AuthState(
// isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
// as bool,signInState: null == signInState ? _self.signInState : signInState // ignore: cast_nullable_to_non_nullable
// as AppLoadState,signInSocialState: null == signInSocialState ? _self.signInSocialState : signInSocialState // ignore: cast_nullable_to_non_nullable
// as AppLoadState,completeProfileState: null == completeProfileState ? _self.completeProfileState : completeProfileState // ignore: cast_nullable_to_non_nullable
// as AppLoadState,completeCreatePassword: null == completeCreatePassword ? _self.completeCreatePassword : completeCreatePassword // ignore: cast_nullable_to_non_nullable
// as AppLoadState,statusCodeSignInWithPassword: freezed == statusCodeSignInWithPassword ? _self.statusCodeSignInWithPassword : statusCodeSignInWithPassword // ignore: cast_nullable_to_non_nullable
// as int?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
// as String,
//   ));
// }


// }

// // dart format on
