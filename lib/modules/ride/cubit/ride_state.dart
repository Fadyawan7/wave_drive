part of 'ride_cubit.dart';

@freezed
abstract class RideState with _$RideState {
  const factory RideState({@Default(AppLoadState.initial) AppLoadState apploading, RideRequestModel? rideModel}) = _RideState;
}
