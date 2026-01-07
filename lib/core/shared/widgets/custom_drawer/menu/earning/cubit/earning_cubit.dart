import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wave_drive/core/cubits/user/user_cubit.dart';
import 'package:wave_drive/core/data/models/auth/user_model.dart';
import 'package:wave_drive/core/data/models/earning/earning_model.dart';
import 'package:wave_drive/core/data/network/dio/helpers/api_helper.dart';
import 'package:wave_drive/core/data/repositories/user_repository.dart';
import 'package:wave_drive/core/shared/constants/enums.dart';
import 'package:wave_drive/injector_setup.dart';

part 'earning_cubit.freezed.dart';

part 'earning_state.dart';

class EarningCubit extends Cubit<EarningState> {
  EarningCubit() : super(const EarningState());

  final _userRepository = injector<UserRepository>();

  Future<void> loadEarning() async {
    emit(state.copyWith(loadingState: AppLoadState.loading));

    final response = await _userRepository.getEarning(state.currentPeriod.value);

    if (response is ApiError) {
      emit(state.copyWith(loadingState: AppLoadState.error));
      return;
    }

    emit(state.copyWith(loadingState: AppLoadState.success, earningModel: response.data!.data));
  }
}
