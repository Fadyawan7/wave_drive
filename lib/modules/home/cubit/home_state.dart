part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({required LocationState locationState,
  
      @Default(<Marker>{}) Set<Marker> markers,

  }) = _HomeState;
}

@freezed
abstract class LocationState with _$LocationState {
  const factory LocationState({
    @Default(AppLoadState.initial) AppLoadState appLoadState,
    Position? position,
  }) = _LocationState;
}
