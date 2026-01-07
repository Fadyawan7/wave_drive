// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'earning_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EarningState {

 AppLoadState get loadingState; DayPeriod get currentPeriod; EarningModel? get earningModel;
/// Create a copy of EarningState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EarningStateCopyWith<EarningState> get copyWith => _$EarningStateCopyWithImpl<EarningState>(this as EarningState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EarningState&&(identical(other.loadingState, loadingState) || other.loadingState == loadingState)&&(identical(other.currentPeriod, currentPeriod) || other.currentPeriod == currentPeriod)&&(identical(other.earningModel, earningModel) || other.earningModel == earningModel));
}


@override
int get hashCode => Object.hash(runtimeType,loadingState,currentPeriod,earningModel);

@override
String toString() {
  return 'EarningState(loadingState: $loadingState, currentPeriod: $currentPeriod, earningModel: $earningModel)';
}


}

/// @nodoc
abstract mixin class $EarningStateCopyWith<$Res>  {
  factory $EarningStateCopyWith(EarningState value, $Res Function(EarningState) _then) = _$EarningStateCopyWithImpl;
@useResult
$Res call({
 AppLoadState loadingState, DayPeriod currentPeriod, EarningModel? earningModel
});




}
/// @nodoc
class _$EarningStateCopyWithImpl<$Res>
    implements $EarningStateCopyWith<$Res> {
  _$EarningStateCopyWithImpl(this._self, this._then);

  final EarningState _self;
  final $Res Function(EarningState) _then;

/// Create a copy of EarningState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loadingState = null,Object? currentPeriod = null,Object? earningModel = freezed,}) {
  return _then(_self.copyWith(
loadingState: null == loadingState ? _self.loadingState : loadingState // ignore: cast_nullable_to_non_nullable
as AppLoadState,currentPeriod: null == currentPeriod ? _self.currentPeriod : currentPeriod // ignore: cast_nullable_to_non_nullable
as DayPeriod,earningModel: freezed == earningModel ? _self.earningModel : earningModel // ignore: cast_nullable_to_non_nullable
as EarningModel?,
  ));
}

}


/// Adds pattern-matching-related methods to [EarningState].
extension EarningStatePatterns on EarningState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EarningState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EarningState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EarningState value)  $default,){
final _that = this;
switch (_that) {
case _EarningState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EarningState value)?  $default,){
final _that = this;
switch (_that) {
case _EarningState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppLoadState loadingState,  DayPeriod currentPeriod,  EarningModel? earningModel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EarningState() when $default != null:
return $default(_that.loadingState,_that.currentPeriod,_that.earningModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppLoadState loadingState,  DayPeriod currentPeriod,  EarningModel? earningModel)  $default,) {final _that = this;
switch (_that) {
case _EarningState():
return $default(_that.loadingState,_that.currentPeriod,_that.earningModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppLoadState loadingState,  DayPeriod currentPeriod,  EarningModel? earningModel)?  $default,) {final _that = this;
switch (_that) {
case _EarningState() when $default != null:
return $default(_that.loadingState,_that.currentPeriod,_that.earningModel);case _:
  return null;

}
}

}

/// @nodoc


class _EarningState extends EarningState {
  const _EarningState({this.loadingState = AppLoadState.initial, this.currentPeriod = DayPeriod.today, this.earningModel}): super._();
  

@override@JsonKey() final  AppLoadState loadingState;
@override@JsonKey() final  DayPeriod currentPeriod;
@override final  EarningModel? earningModel;

/// Create a copy of EarningState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EarningStateCopyWith<_EarningState> get copyWith => __$EarningStateCopyWithImpl<_EarningState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EarningState&&(identical(other.loadingState, loadingState) || other.loadingState == loadingState)&&(identical(other.currentPeriod, currentPeriod) || other.currentPeriod == currentPeriod)&&(identical(other.earningModel, earningModel) || other.earningModel == earningModel));
}


@override
int get hashCode => Object.hash(runtimeType,loadingState,currentPeriod,earningModel);

@override
String toString() {
  return 'EarningState(loadingState: $loadingState, currentPeriod: $currentPeriod, earningModel: $earningModel)';
}


}

/// @nodoc
abstract mixin class _$EarningStateCopyWith<$Res> implements $EarningStateCopyWith<$Res> {
  factory _$EarningStateCopyWith(_EarningState value, $Res Function(_EarningState) _then) = __$EarningStateCopyWithImpl;
@override @useResult
$Res call({
 AppLoadState loadingState, DayPeriod currentPeriod, EarningModel? earningModel
});




}
/// @nodoc
class __$EarningStateCopyWithImpl<$Res>
    implements _$EarningStateCopyWith<$Res> {
  __$EarningStateCopyWithImpl(this._self, this._then);

  final _EarningState _self;
  final $Res Function(_EarningState) _then;

/// Create a copy of EarningState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loadingState = null,Object? currentPeriod = null,Object? earningModel = freezed,}) {
  return _then(_EarningState(
loadingState: null == loadingState ? _self.loadingState : loadingState // ignore: cast_nullable_to_non_nullable
as AppLoadState,currentPeriod: null == currentPeriod ? _self.currentPeriod : currentPeriod // ignore: cast_nullable_to_non_nullable
as DayPeriod,earningModel: freezed == earningModel ? _self.earningModel : earningModel // ignore: cast_nullable_to_non_nullable
as EarningModel?,
  ));
}


}

// dart format on
