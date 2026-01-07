part of 'earning_cubit.dart';

@freezed
abstract class EarningState with _$EarningState {
  const factory EarningState({
    @Default(AppLoadState.initial) AppLoadState loadingState,
    @Default(DayPeriod.today) DayPeriod currentPeriod,
    EarningModel? earningModel,
  }) = _EarningState;

  const EarningState._();
}
