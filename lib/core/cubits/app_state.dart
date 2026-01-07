part of 'app_cubit.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState(
    {required LocationState locationState
    
    ,
    }
  ) = _AppState;
}





@freezed
abstract class LocationState with _$LocationState {
  const factory LocationState({
    @Default(AppLoadState.initial) AppLoadState appLoadState,
    Position? position,
    @Default("Unknown Location") String address,
  }) = _LocationState;
}

