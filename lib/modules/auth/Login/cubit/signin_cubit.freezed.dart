// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signin_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SigninState {

 SigninStep get step; String? get uid; String? get varificationId; String? get phoneNumber; String? get countryConde; SignUpPhoneDTO? get signUpDTO;
/// Create a copy of SigninState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SigninStateCopyWith<SigninState> get copyWith => _$SigninStateCopyWithImpl<SigninState>(this as SigninState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SigninState&&(identical(other.step, step) || other.step == step)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.varificationId, varificationId) || other.varificationId == varificationId)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.countryConde, countryConde) || other.countryConde == countryConde)&&(identical(other.signUpDTO, signUpDTO) || other.signUpDTO == signUpDTO));
}


@override
int get hashCode => Object.hash(runtimeType,step,uid,varificationId,phoneNumber,countryConde,signUpDTO);

@override
String toString() {
  return 'SigninState(step: $step, uid: $uid, varificationId: $varificationId, phoneNumber: $phoneNumber, countryConde: $countryConde, signUpDTO: $signUpDTO)';
}


}

/// @nodoc
abstract mixin class $SigninStateCopyWith<$Res>  {
  factory $SigninStateCopyWith(SigninState value, $Res Function(SigninState) _then) = _$SigninStateCopyWithImpl;
@useResult
$Res call({
 SigninStep step, String? uid, String? varificationId, String? phoneNumber, String? countryConde, SignUpPhoneDTO? signUpDTO
});




}
/// @nodoc
class _$SigninStateCopyWithImpl<$Res>
    implements $SigninStateCopyWith<$Res> {
  _$SigninStateCopyWithImpl(this._self, this._then);

  final SigninState _self;
  final $Res Function(SigninState) _then;

/// Create a copy of SigninState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? uid = freezed,Object? varificationId = freezed,Object? phoneNumber = freezed,Object? countryConde = freezed,Object? signUpDTO = freezed,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as SigninStep,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,varificationId: freezed == varificationId ? _self.varificationId : varificationId // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,countryConde: freezed == countryConde ? _self.countryConde : countryConde // ignore: cast_nullable_to_non_nullable
as String?,signUpDTO: freezed == signUpDTO ? _self.signUpDTO : signUpDTO // ignore: cast_nullable_to_non_nullable
as SignUpPhoneDTO?,
  ));
}

}


/// Adds pattern-matching-related methods to [SigninState].
extension SigninStatePatterns on SigninState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppState value)  $default,){
final _that = this;
switch (_that) {
case _AppState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppState value)?  $default,){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SigninStep step,  String? uid,  String? varificationId,  String? phoneNumber,  String? countryConde,  SignUpPhoneDTO? signUpDTO)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.step,_that.uid,_that.varificationId,_that.phoneNumber,_that.countryConde,_that.signUpDTO);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SigninStep step,  String? uid,  String? varificationId,  String? phoneNumber,  String? countryConde,  SignUpPhoneDTO? signUpDTO)  $default,) {final _that = this;
switch (_that) {
case _AppState():
return $default(_that.step,_that.uid,_that.varificationId,_that.phoneNumber,_that.countryConde,_that.signUpDTO);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SigninStep step,  String? uid,  String? varificationId,  String? phoneNumber,  String? countryConde,  SignUpPhoneDTO? signUpDTO)?  $default,) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.step,_that.uid,_that.varificationId,_that.phoneNumber,_that.countryConde,_that.signUpDTO);case _:
  return null;

}
}

}

/// @nodoc


class _AppState implements SigninState {
  const _AppState({this.step = SigninStep.login, this.uid, this.varificationId, this.phoneNumber, this.countryConde, this.signUpDTO});
  

@override@JsonKey() final  SigninStep step;
@override final  String? uid;
@override final  String? varificationId;
@override final  String? phoneNumber;
@override final  String? countryConde;
@override final  SignUpPhoneDTO? signUpDTO;

/// Create a copy of SigninState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppStateCopyWith<_AppState> get copyWith => __$AppStateCopyWithImpl<_AppState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppState&&(identical(other.step, step) || other.step == step)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.varificationId, varificationId) || other.varificationId == varificationId)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.countryConde, countryConde) || other.countryConde == countryConde)&&(identical(other.signUpDTO, signUpDTO) || other.signUpDTO == signUpDTO));
}


@override
int get hashCode => Object.hash(runtimeType,step,uid,varificationId,phoneNumber,countryConde,signUpDTO);

@override
String toString() {
  return 'SigninState(step: $step, uid: $uid, varificationId: $varificationId, phoneNumber: $phoneNumber, countryConde: $countryConde, signUpDTO: $signUpDTO)';
}


}

/// @nodoc
abstract mixin class _$AppStateCopyWith<$Res> implements $SigninStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) _then) = __$AppStateCopyWithImpl;
@override @useResult
$Res call({
 SigninStep step, String? uid, String? varificationId, String? phoneNumber, String? countryConde, SignUpPhoneDTO? signUpDTO
});




}
/// @nodoc
class __$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(this._self, this._then);

  final _AppState _self;
  final $Res Function(_AppState) _then;

/// Create a copy of SigninState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? uid = freezed,Object? varificationId = freezed,Object? phoneNumber = freezed,Object? countryConde = freezed,Object? signUpDTO = freezed,}) {
  return _then(_AppState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as SigninStep,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,varificationId: freezed == varificationId ? _self.varificationId : varificationId // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,countryConde: freezed == countryConde ? _self.countryConde : countryConde // ignore: cast_nullable_to_non_nullable
as String?,signUpDTO: freezed == signUpDTO ? _self.signUpDTO : signUpDTO // ignore: cast_nullable_to_non_nullable
as SignUpPhoneDTO?,
  ));
}


}

// dart format on
