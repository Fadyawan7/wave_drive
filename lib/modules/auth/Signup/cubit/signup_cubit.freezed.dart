// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignupState {

 String? get email; String? get country; String? get city; String? get uid; String? get varificationId; String? get phoneNumber; String? get countryConde; SignUpPhoneDTO? get signUpDTO;
/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupStateCopyWith<SignupState> get copyWith => _$SignupStateCopyWithImpl<SignupState>(this as SignupState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupState&&(identical(other.email, email) || other.email == email)&&(identical(other.country, country) || other.country == country)&&(identical(other.city, city) || other.city == city)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.varificationId, varificationId) || other.varificationId == varificationId)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.countryConde, countryConde) || other.countryConde == countryConde)&&(identical(other.signUpDTO, signUpDTO) || other.signUpDTO == signUpDTO));
}


@override
int get hashCode => Object.hash(runtimeType,email,country,city,uid,varificationId,phoneNumber,countryConde,signUpDTO);

@override
String toString() {
  return 'SignupState(email: $email, country: $country, city: $city, uid: $uid, varificationId: $varificationId, phoneNumber: $phoneNumber, countryConde: $countryConde, signUpDTO: $signUpDTO)';
}


}

/// @nodoc
abstract mixin class $SignupStateCopyWith<$Res>  {
  factory $SignupStateCopyWith(SignupState value, $Res Function(SignupState) _then) = _$SignupStateCopyWithImpl;
@useResult
$Res call({
 String? email, String? country, String? city, String? uid, String? varificationId, String? phoneNumber, String? countryConde, SignUpPhoneDTO? signUpDTO
});




}
/// @nodoc
class _$SignupStateCopyWithImpl<$Res>
    implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._self, this._then);

  final SignupState _self;
  final $Res Function(SignupState) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? country = freezed,Object? city = freezed,Object? uid = freezed,Object? varificationId = freezed,Object? phoneNumber = freezed,Object? countryConde = freezed,Object? signUpDTO = freezed,}) {
  return _then(_self.copyWith(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,varificationId: freezed == varificationId ? _self.varificationId : varificationId // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,countryConde: freezed == countryConde ? _self.countryConde : countryConde // ignore: cast_nullable_to_non_nullable
as String?,signUpDTO: freezed == signUpDTO ? _self.signUpDTO : signUpDTO // ignore: cast_nullable_to_non_nullable
as SignUpPhoneDTO?,
  ));
}

}


/// Adds pattern-matching-related methods to [SignupState].
extension SignupStatePatterns on SignupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignupState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignupState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignupState value)  $default,){
final _that = this;
switch (_that) {
case _SignupState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignupState value)?  $default,){
final _that = this;
switch (_that) {
case _SignupState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? email,  String? country,  String? city,  String? uid,  String? varificationId,  String? phoneNumber,  String? countryConde,  SignUpPhoneDTO? signUpDTO)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignupState() when $default != null:
return $default(_that.email,_that.country,_that.city,_that.uid,_that.varificationId,_that.phoneNumber,_that.countryConde,_that.signUpDTO);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? email,  String? country,  String? city,  String? uid,  String? varificationId,  String? phoneNumber,  String? countryConde,  SignUpPhoneDTO? signUpDTO)  $default,) {final _that = this;
switch (_that) {
case _SignupState():
return $default(_that.email,_that.country,_that.city,_that.uid,_that.varificationId,_that.phoneNumber,_that.countryConde,_that.signUpDTO);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? email,  String? country,  String? city,  String? uid,  String? varificationId,  String? phoneNumber,  String? countryConde,  SignUpPhoneDTO? signUpDTO)?  $default,) {final _that = this;
switch (_that) {
case _SignupState() when $default != null:
return $default(_that.email,_that.country,_that.city,_that.uid,_that.varificationId,_that.phoneNumber,_that.countryConde,_that.signUpDTO);case _:
  return null;

}
}

}

/// @nodoc


class _SignupState implements SignupState {
   _SignupState({this.email, this.country, this.city, this.uid, this.varificationId, this.phoneNumber, this.countryConde, this.signUpDTO});
  

@override final  String? email;
@override final  String? country;
@override final  String? city;
@override final  String? uid;
@override final  String? varificationId;
@override final  String? phoneNumber;
@override final  String? countryConde;
@override final  SignUpPhoneDTO? signUpDTO;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupStateCopyWith<_SignupState> get copyWith => __$SignupStateCopyWithImpl<_SignupState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignupState&&(identical(other.email, email) || other.email == email)&&(identical(other.country, country) || other.country == country)&&(identical(other.city, city) || other.city == city)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.varificationId, varificationId) || other.varificationId == varificationId)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.countryConde, countryConde) || other.countryConde == countryConde)&&(identical(other.signUpDTO, signUpDTO) || other.signUpDTO == signUpDTO));
}


@override
int get hashCode => Object.hash(runtimeType,email,country,city,uid,varificationId,phoneNumber,countryConde,signUpDTO);

@override
String toString() {
  return 'SignupState(email: $email, country: $country, city: $city, uid: $uid, varificationId: $varificationId, phoneNumber: $phoneNumber, countryConde: $countryConde, signUpDTO: $signUpDTO)';
}


}

/// @nodoc
abstract mixin class _$SignupStateCopyWith<$Res> implements $SignupStateCopyWith<$Res> {
  factory _$SignupStateCopyWith(_SignupState value, $Res Function(_SignupState) _then) = __$SignupStateCopyWithImpl;
@override @useResult
$Res call({
 String? email, String? country, String? city, String? uid, String? varificationId, String? phoneNumber, String? countryConde, SignUpPhoneDTO? signUpDTO
});




}
/// @nodoc
class __$SignupStateCopyWithImpl<$Res>
    implements _$SignupStateCopyWith<$Res> {
  __$SignupStateCopyWithImpl(this._self, this._then);

  final _SignupState _self;
  final $Res Function(_SignupState) _then;

/// Create a copy of SignupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? country = freezed,Object? city = freezed,Object? uid = freezed,Object? varificationId = freezed,Object? phoneNumber = freezed,Object? countryConde = freezed,Object? signUpDTO = freezed,}) {
  return _then(_SignupState(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,varificationId: freezed == varificationId ? _self.varificationId : varificationId // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,countryConde: freezed == countryConde ? _self.countryConde : countryConde // ignore: cast_nullable_to_non_nullable
as String?,signUpDTO: freezed == signUpDTO ? _self.signUpDTO : signUpDTO // ignore: cast_nullable_to_non_nullable
as SignUpPhoneDTO?,
  ));
}


}

// dart format on
