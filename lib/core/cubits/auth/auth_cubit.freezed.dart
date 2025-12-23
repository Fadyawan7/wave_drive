// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {

 String? get email; String? get uid; String? get varificationId; String? get phoneNumber; bool get isLoggedIn; AppLoadState get signInState; AppLoadState get signInSocialState; AppLoadState get completeProfileState; AppLoadState get completeCreatePassword; AppLoadState get deleteAccountState; int? get statusCodeSignInWithPassword; String get errorMessage;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.email, email) || other.email == email)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.varificationId, varificationId) || other.varificationId == varificationId)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn)&&(identical(other.signInState, signInState) || other.signInState == signInState)&&(identical(other.signInSocialState, signInSocialState) || other.signInSocialState == signInSocialState)&&(identical(other.completeProfileState, completeProfileState) || other.completeProfileState == completeProfileState)&&(identical(other.completeCreatePassword, completeCreatePassword) || other.completeCreatePassword == completeCreatePassword)&&(identical(other.deleteAccountState, deleteAccountState) || other.deleteAccountState == deleteAccountState)&&(identical(other.statusCodeSignInWithPassword, statusCodeSignInWithPassword) || other.statusCodeSignInWithPassword == statusCodeSignInWithPassword)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,email,uid,varificationId,phoneNumber,isLoggedIn,signInState,signInSocialState,completeProfileState,completeCreatePassword,deleteAccountState,statusCodeSignInWithPassword,errorMessage);

@override
String toString() {
  return 'AuthState(email: $email, uid: $uid, varificationId: $varificationId, phoneNumber: $phoneNumber, isLoggedIn: $isLoggedIn, signInState: $signInState, signInSocialState: $signInSocialState, completeProfileState: $completeProfileState, completeCreatePassword: $completeCreatePassword, deleteAccountState: $deleteAccountState, statusCodeSignInWithPassword: $statusCodeSignInWithPassword, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 String? email, String? uid, String? varificationId, String? phoneNumber, bool isLoggedIn, AppLoadState signInState, AppLoadState signInSocialState, AppLoadState completeProfileState, AppLoadState completeCreatePassword, AppLoadState deleteAccountState, int? statusCodeSignInWithPassword, String errorMessage
});




}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? uid = freezed,Object? varificationId = freezed,Object? phoneNumber = freezed,Object? isLoggedIn = null,Object? signInState = null,Object? signInSocialState = null,Object? completeProfileState = null,Object? completeCreatePassword = null,Object? deleteAccountState = null,Object? statusCodeSignInWithPassword = freezed,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,varificationId: freezed == varificationId ? _self.varificationId : varificationId // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,signInState: null == signInState ? _self.signInState : signInState // ignore: cast_nullable_to_non_nullable
as AppLoadState,signInSocialState: null == signInSocialState ? _self.signInSocialState : signInSocialState // ignore: cast_nullable_to_non_nullable
as AppLoadState,completeProfileState: null == completeProfileState ? _self.completeProfileState : completeProfileState // ignore: cast_nullable_to_non_nullable
as AppLoadState,completeCreatePassword: null == completeCreatePassword ? _self.completeCreatePassword : completeCreatePassword // ignore: cast_nullable_to_non_nullable
as AppLoadState,deleteAccountState: null == deleteAccountState ? _self.deleteAccountState : deleteAccountState // ignore: cast_nullable_to_non_nullable
as AppLoadState,statusCodeSignInWithPassword: freezed == statusCodeSignInWithPassword ? _self.statusCodeSignInWithPassword : statusCodeSignInWithPassword // ignore: cast_nullable_to_non_nullable
as int?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,){
final _that = this;
switch (_that) {
case _AuthState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? email,  String? uid,  String? varificationId,  String? phoneNumber,  bool isLoggedIn,  AppLoadState signInState,  AppLoadState signInSocialState,  AppLoadState completeProfileState,  AppLoadState completeCreatePassword,  AppLoadState deleteAccountState,  int? statusCodeSignInWithPassword,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.email,_that.uid,_that.varificationId,_that.phoneNumber,_that.isLoggedIn,_that.signInState,_that.signInSocialState,_that.completeProfileState,_that.completeCreatePassword,_that.deleteAccountState,_that.statusCodeSignInWithPassword,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? email,  String? uid,  String? varificationId,  String? phoneNumber,  bool isLoggedIn,  AppLoadState signInState,  AppLoadState signInSocialState,  AppLoadState completeProfileState,  AppLoadState completeCreatePassword,  AppLoadState deleteAccountState,  int? statusCodeSignInWithPassword,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.email,_that.uid,_that.varificationId,_that.phoneNumber,_that.isLoggedIn,_that.signInState,_that.signInSocialState,_that.completeProfileState,_that.completeCreatePassword,_that.deleteAccountState,_that.statusCodeSignInWithPassword,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? email,  String? uid,  String? varificationId,  String? phoneNumber,  bool isLoggedIn,  AppLoadState signInState,  AppLoadState signInSocialState,  AppLoadState completeProfileState,  AppLoadState completeCreatePassword,  AppLoadState deleteAccountState,  int? statusCodeSignInWithPassword,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.email,_that.uid,_that.varificationId,_that.phoneNumber,_that.isLoggedIn,_that.signInState,_that.signInSocialState,_that.completeProfileState,_that.completeCreatePassword,_that.deleteAccountState,_that.statusCodeSignInWithPassword,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _AuthState implements AuthState {
  const _AuthState({this.email, this.uid, this.varificationId, this.phoneNumber, this.isLoggedIn = false, this.signInState = AppLoadState.initial, this.signInSocialState = AppLoadState.initial, this.completeProfileState = AppLoadState.initial, this.completeCreatePassword = AppLoadState.initial, this.deleteAccountState = AppLoadState.initial, this.statusCodeSignInWithPassword, this.errorMessage = ""});
  

@override final  String? email;
@override final  String? uid;
@override final  String? varificationId;
@override final  String? phoneNumber;
@override@JsonKey() final  bool isLoggedIn;
@override@JsonKey() final  AppLoadState signInState;
@override@JsonKey() final  AppLoadState signInSocialState;
@override@JsonKey() final  AppLoadState completeProfileState;
@override@JsonKey() final  AppLoadState completeCreatePassword;
@override@JsonKey() final  AppLoadState deleteAccountState;
@override final  int? statusCodeSignInWithPassword;
@override@JsonKey() final  String errorMessage;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.email, email) || other.email == email)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.varificationId, varificationId) || other.varificationId == varificationId)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn)&&(identical(other.signInState, signInState) || other.signInState == signInState)&&(identical(other.signInSocialState, signInSocialState) || other.signInSocialState == signInSocialState)&&(identical(other.completeProfileState, completeProfileState) || other.completeProfileState == completeProfileState)&&(identical(other.completeCreatePassword, completeCreatePassword) || other.completeCreatePassword == completeCreatePassword)&&(identical(other.deleteAccountState, deleteAccountState) || other.deleteAccountState == deleteAccountState)&&(identical(other.statusCodeSignInWithPassword, statusCodeSignInWithPassword) || other.statusCodeSignInWithPassword == statusCodeSignInWithPassword)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,email,uid,varificationId,phoneNumber,isLoggedIn,signInState,signInSocialState,completeProfileState,completeCreatePassword,deleteAccountState,statusCodeSignInWithPassword,errorMessage);

@override
String toString() {
  return 'AuthState(email: $email, uid: $uid, varificationId: $varificationId, phoneNumber: $phoneNumber, isLoggedIn: $isLoggedIn, signInState: $signInState, signInSocialState: $signInSocialState, completeProfileState: $completeProfileState, completeCreatePassword: $completeCreatePassword, deleteAccountState: $deleteAccountState, statusCodeSignInWithPassword: $statusCodeSignInWithPassword, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 String? email, String? uid, String? varificationId, String? phoneNumber, bool isLoggedIn, AppLoadState signInState, AppLoadState signInSocialState, AppLoadState completeProfileState, AppLoadState completeCreatePassword, AppLoadState deleteAccountState, int? statusCodeSignInWithPassword, String errorMessage
});




}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? uid = freezed,Object? varificationId = freezed,Object? phoneNumber = freezed,Object? isLoggedIn = null,Object? signInState = null,Object? signInSocialState = null,Object? completeProfileState = null,Object? completeCreatePassword = null,Object? deleteAccountState = null,Object? statusCodeSignInWithPassword = freezed,Object? errorMessage = null,}) {
  return _then(_AuthState(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,varificationId: freezed == varificationId ? _self.varificationId : varificationId // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,signInState: null == signInState ? _self.signInState : signInState // ignore: cast_nullable_to_non_nullable
as AppLoadState,signInSocialState: null == signInSocialState ? _self.signInSocialState : signInSocialState // ignore: cast_nullable_to_non_nullable
as AppLoadState,completeProfileState: null == completeProfileState ? _self.completeProfileState : completeProfileState // ignore: cast_nullable_to_non_nullable
as AppLoadState,completeCreatePassword: null == completeCreatePassword ? _self.completeCreatePassword : completeCreatePassword // ignore: cast_nullable_to_non_nullable
as AppLoadState,deleteAccountState: null == deleteAccountState ? _self.deleteAccountState : deleteAccountState // ignore: cast_nullable_to_non_nullable
as AppLoadState,statusCodeSignInWithPassword: freezed == statusCodeSignInWithPassword ? _self.statusCodeSignInWithPassword : statusCodeSignInWithPassword // ignore: cast_nullable_to_non_nullable
as int?,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
