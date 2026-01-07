// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ride_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RideState {

 AppLoadState get apploading; RideRequestModel? get rideModel;
/// Create a copy of RideState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RideStateCopyWith<RideState> get copyWith => _$RideStateCopyWithImpl<RideState>(this as RideState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RideState&&(identical(other.apploading, apploading) || other.apploading == apploading)&&(identical(other.rideModel, rideModel) || other.rideModel == rideModel));
}


@override
int get hashCode => Object.hash(runtimeType,apploading,rideModel);

@override
String toString() {
  return 'RideState(apploading: $apploading, rideModel: $rideModel)';
}


}

/// @nodoc
abstract mixin class $RideStateCopyWith<$Res>  {
  factory $RideStateCopyWith(RideState value, $Res Function(RideState) _then) = _$RideStateCopyWithImpl;
@useResult
$Res call({
 AppLoadState apploading, RideRequestModel? rideModel
});




}
/// @nodoc
class _$RideStateCopyWithImpl<$Res>
    implements $RideStateCopyWith<$Res> {
  _$RideStateCopyWithImpl(this._self, this._then);

  final RideState _self;
  final $Res Function(RideState) _then;

/// Create a copy of RideState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? apploading = null,Object? rideModel = freezed,}) {
  return _then(_self.copyWith(
apploading: null == apploading ? _self.apploading : apploading // ignore: cast_nullable_to_non_nullable
as AppLoadState,rideModel: freezed == rideModel ? _self.rideModel : rideModel // ignore: cast_nullable_to_non_nullable
as RideRequestModel?,
  ));
}

}


/// Adds pattern-matching-related methods to [RideState].
extension RideStatePatterns on RideState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RideState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RideState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RideState value)  $default,){
final _that = this;
switch (_that) {
case _RideState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RideState value)?  $default,){
final _that = this;
switch (_that) {
case _RideState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppLoadState apploading,  RideRequestModel? rideModel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RideState() when $default != null:
return $default(_that.apploading,_that.rideModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppLoadState apploading,  RideRequestModel? rideModel)  $default,) {final _that = this;
switch (_that) {
case _RideState():
return $default(_that.apploading,_that.rideModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppLoadState apploading,  RideRequestModel? rideModel)?  $default,) {final _that = this;
switch (_that) {
case _RideState() when $default != null:
return $default(_that.apploading,_that.rideModel);case _:
  return null;

}
}

}

/// @nodoc


class _RideState implements RideState {
  const _RideState({this.apploading = AppLoadState.initial, this.rideModel});
  

@override@JsonKey() final  AppLoadState apploading;
@override final  RideRequestModel? rideModel;

/// Create a copy of RideState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RideStateCopyWith<_RideState> get copyWith => __$RideStateCopyWithImpl<_RideState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RideState&&(identical(other.apploading, apploading) || other.apploading == apploading)&&(identical(other.rideModel, rideModel) || other.rideModel == rideModel));
}


@override
int get hashCode => Object.hash(runtimeType,apploading,rideModel);

@override
String toString() {
  return 'RideState(apploading: $apploading, rideModel: $rideModel)';
}


}

/// @nodoc
abstract mixin class _$RideStateCopyWith<$Res> implements $RideStateCopyWith<$Res> {
  factory _$RideStateCopyWith(_RideState value, $Res Function(_RideState) _then) = __$RideStateCopyWithImpl;
@override @useResult
$Res call({
 AppLoadState apploading, RideRequestModel? rideModel
});




}
/// @nodoc
class __$RideStateCopyWithImpl<$Res>
    implements _$RideStateCopyWith<$Res> {
  __$RideStateCopyWithImpl(this._self, this._then);

  final _RideState _self;
  final $Res Function(_RideState) _then;

/// Create a copy of RideState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? apploading = null,Object? rideModel = freezed,}) {
  return _then(_RideState(
apploading: null == apploading ? _self.apploading : apploading // ignore: cast_nullable_to_non_nullable
as AppLoadState,rideModel: freezed == rideModel ? _self.rideModel : rideModel // ignore: cast_nullable_to_non_nullable
as RideRequestModel?,
  ));
}


}

// dart format on
